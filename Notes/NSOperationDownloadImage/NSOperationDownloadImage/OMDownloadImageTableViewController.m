//
//  OMDownloadImageTableViewController.m
//  NSOperationDownloadImage
//
//  Created by Admin on 6/4/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMDownloadImageTableViewController.h"
#import "OMImageDownloaded.h"
#import "OMImageTableViewCell.h"

@interface OMDownloadImageTableViewController () {
    NSArray <OMImageDownloaded*>*images;
}

@property (strong, nonatomic) OMImageDownloaded *model;

@end

static NSString* const identifier = @"cellImage";

@implementation OMDownloadImageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.contentInset = insets;
    
    images = [OMImageDownloaded allImages];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  images.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OMImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[OMImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    [cell setModel:images[indexPath.row]];

    return cell;
    
}

@end
