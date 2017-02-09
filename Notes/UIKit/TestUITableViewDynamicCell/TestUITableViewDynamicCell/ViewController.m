//
//  ViewController.m
//  TestUITableViewDynamicCell
//
//  Created by Admin on 3/6/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIEdgeInsets insets = UIEdgeInsetsMake(20, 0, 0, 0);
    
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView; {
    NSLog(@"numberOfSectionsInTableView");
    
    return [[UIFont familyNames] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection %ld", section);
    
    NSArray *familyNames = [UIFont familyNames];
    
    NSString *familyName = [familyNames objectAtIndex:section];
    
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    return [fontNames count];
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *familyNames = [UIFont familyNames];
    
    NSString *familyName = [familyNames objectAtIndex:section];
    
    return familyName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath {%ld %ld}", indexPath.section, indexPath.row);
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        NSLog(@"Cell created");
    } else {
        NSLog(@"Cell resued");
    }
    
    NSArray *familyNames = [UIFont familyNames];
    
    NSString *familyName = [familyNames objectAtIndex:indexPath.section];
    
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    NSString *fontName = [fontNames objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fontName;
    
    UIFont *font = [UIFont fontWithName:fontName size:16];
    
    cell.textLabel.font = font;
    
    return cell;
}

@end
