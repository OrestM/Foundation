//
//  OMImageTableViewController.m
//  Networking
//
//  Created by Admin on 5/26/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMImageTableViewController.h"
#import "OMImageTableViewCell.h"
#import "OMFullSizeViewController.h"
#import "OMModelImage.h"

@interface OMImageTableViewController ()
    
@property (strong, nonatomic) NSArray <OMModelImage*>* modelImages;

@end

static NSString* const identifier = @"cellImage";

@implementation OMImageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 0, 0, 5);
    self.tableView.contentInset = insets;
    
    self.title = @"Image List";
    
    _modelImages = [OMModelImage models];
 
}

- (void)showMessage:(NSString *)message withTtitle:(NSString *)title {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok!" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:actionOk];
    
    UIViewController *top = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [top presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - Method for segue

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if ([self imageForSender:sender] != nil) {
        
        return [self imageForSender:sender] != nil;
        
    } else {
        
        [self showMessage:@"Press download to view image" withTtitle:@"Sorry image is not downloaded!"];
        
    }
    
    return nil;
}

- (UIImage *)imageForSender:(id)sender {
    
    NSIndexPath *IndexPath = self.tableView.indexPathForSelectedRow;
    return ((OMModelImage*)self.modelImages[IndexPath.row]).getCacheImage;
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.modelImages.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OMImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[OMImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell setModel:self.modelImages[indexPath.row]];
    
    return cell;
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    OMFullSizeViewController *vc = [segue destinationViewController];
    
    if ([segue.identifier isEqualToString:@"full"]) {
        [vc setImage:[self imageForSender:sender]];
    }
    
}

@end
