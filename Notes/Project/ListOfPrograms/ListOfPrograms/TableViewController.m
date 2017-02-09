//
//  TableViewController.m
//  ListOfPrograms
//
//  Created by Admin on 17.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "TableViewController.h"
#import "ListJsonCell.h"

@interface TableViewController ()

@property (nonatomic, strong) NSArray *arrayKey;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(20, 0, 5, 0);
    self.tableView.contentInset = insets;
    
    NSError *error = nil;
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"FirstScene" ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:fileName];
    NSArray *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];

    NSMutableArray *arr = [NSMutableArray new];
    for (NSDictionary *dic in jsonDictionary) {
        [arr addObject:dic];
    }
    self.arrayKey = arr;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 150.f;
    
}

#pragma mark -  UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrayKey.count;
    
};


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* indentifier = @"Cell";
    
    ListJsonCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (!cell) {
        cell = [[ListJsonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    
    NSString *title = [NSString stringWithFormat:@"%@", [self.arrayKey[indexPath.row] valueForKey:@"title"]];
    NSString *description = [NSString stringWithFormat:@"%@", [self.arrayKey[indexPath.row] valueForKey:@"description"]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [self.arrayKey[indexPath.row] valueForKey:@"image"]]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.imageImageView.image = [UIImage imageWithData:data];
                });
        }] resume];
    });
    
    cell.titleTextField.text = title;
    cell.descriptionTextField.text = description;
    
    return cell;
};

@end
