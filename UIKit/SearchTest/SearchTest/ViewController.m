//
//  ViewController.m
//  SearchTest
//
//  Created by Admin on 3/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"
#import "NSString+OMRandom.h"
#import "OMSection.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *namesArray;

@property (strong, nonatomic) NSMutableArray *sectionsArray;

@property (strong, nonatomic) NSOperation *currentOperation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < 100; i++) {
        [array addObject:[[NSString randomAlphanumericStringWithLength] capitalizedString]];
    }
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"self" ascending:YES];
    
    [array sortUsingDescriptors:@[sortDescriptor]];
    
    self.namesArray = array;
    
    [self genarateSectionsInBackgroundFromArray:self.namesArray withFilter:self.searchBar.text];
}

- (void)genarateSectionsInBackgroundFromArray:(NSArray *)array withFilter:(NSString *)filterstring {
    
    [self.currentOperation cancel];
    
    __weak ViewController *weakSelf = self;
    
    self.currentOperation = [NSBlockOperation blockOperationWithBlock:^{
       
        NSMutableArray *sectionsArray = [weakSelf generateSectionsFromArray:array withFilter:filterstring];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            weakSelf.sectionsArray = sectionsArray;
            [weakSelf.tableView reloadData];
            
            self.currentOperation = nil;
        });
        
    }];
    
    [self.currentOperation start];
    
}

- (NSMutableArray *)generateSectionsFromArray:(NSArray *)array withFilter:(NSString *)filterstring {
    
    NSMutableArray *sectionsArray = [NSMutableArray array];
    
    NSString *currentLatter = nil;
    
    for (NSString *string in array) {
        
        if ([filterstring length] > 0 && [string rangeOfString:filterstring].location == NSNotFound) {
            continue;
        }
        
        NSString *firstLatter = [string substringToIndex:1];
        
        OMSection *section = nil;
        
        if (![currentLatter isEqualToString:firstLatter]) {
            section = [[OMSection alloc] init];
            section.sectionName = firstLatter;
            section.itemsArray = [NSMutableArray array];
            currentLatter = firstLatter;
            [sectionsArray addObject:section];
        } else {
            section = [sectionsArray lastObject];
        }
        [section.itemsArray addObject:string];
    }
    return sectionsArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (OMSection *section in self.sectionsArray) {
        [array addObject:section.sectionName];
    }
    return array;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionsArray count];
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self.sectionsArray objectAtIndex:section] sectionName];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    OMSection *sec = [self.sectionsArray objectAtIndex:section];
    
    return [sec.itemsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    OMSection *section = [self.sectionsArray objectAtIndex:indexPath.section];
    
    NSString *name = [section.itemsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = name;
    
    return cell;
    
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    [searchBar setShowsCancelButton:YES animated:YES];
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    NSLog(@"searchText = %@", searchText);
    
    self.sectionsArray = [self generateSectionsFromArray:self.namesArray withFilter:searchText];
    [self.tableView reloadData];
    
    [self genarateSectionsInBackgroundFromArray:self.namesArray withFilter:self.searchBar.text];
    
}



@end
