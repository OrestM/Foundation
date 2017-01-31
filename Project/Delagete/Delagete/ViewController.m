//
//  ViewController.m
//  Delagete
//
//  Created by Admin on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSArray *name;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"MyCell"];
    
    name = [NSArray arrayWithObjects:@"Olena", @"Slavik", @"Kolia", nil];
}

#pragma mark - UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [name count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *lCell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    lCell.displayText.text = [name objectAtIndex:indexPath.row];
    NSLog(@"%d", indexPath.row);
    
    lCell.click.tag = indexPath.row;
    
    lCell.delegate = self;
    
    return lCell;
}

#pragma mark - TableViewCell Delegate

- (void)pressButton:(UIButton *)click {
    NSLog(@"Button was pressed: %ld cell, name: %@", (long)click.tag, [name objectAtIndex:click.tag]);
}

@end
