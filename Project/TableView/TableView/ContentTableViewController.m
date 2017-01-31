//
//  ContentTableViewController.m
//  TableView
//
//  Created by Admin on 12/25/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "FullSizeImageViewController.h"
#import "ContentTableViewController.h"
#import "ContentTableViewCell.h"
#import "SessionManager.h"
#import "ImageModel.h"
#import "Global.h"

@interface ContentTableViewController() <UITableViewDelegate, UITableViewDataSource, ContentTableViewCellProtocol> {
    NSMutableArray *_imageModels;
}

- (void)downloadInfoAboutAllPhotos;
- (void)createModelsWithResponse:(NSDictionary*)response;
- (UIImage*)imageForSender:(id)sender;
- (void)downloadPreviewImages;

@end

@implementation ContentTableViewController

- (void)viewDidLoad {
    _imageModels = [NSMutableArray new];
    
    [self downloadInfoAboutAllPhotos];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return [self imageForSender:sender] != nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:kFullSizeSeque]) {
        FullSizeImageViewController *lFullSizeVC = [segue destinationViewController];
        [lFullSizeVC setImage:[self imageForSender:sender]];
    }
}

#pragma mark - private methods

/**
 *  This method is used to download preview images which are displayed in ContentTableViewController
 */
- (void)downloadPreviewImages {
    SessionManager *lSessionManager = [SessionManager shareManager];
    __weak ContentTableViewController *wself = self;
    
    for (ImageModel *imageModel in _imageModels) {
        __weak ImageModel *wImageModel = imageModel;
        imageModel.previewDownloadTask = [lSessionManager downloadPhotoWithURL:imageModel.previewImageURL
                                                             completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                                                                 if (error) {
                                                                     NSLog(@"Failed to download image error: %@", error);
                                                                 } else {
                                                                     NSData *lData = [NSData dataWithContentsOfURL:filePath];
                                                                     wImageModel.previewImage = [[UIImage alloc] initWithData:lData];
                                                                     
                                                                     [wself.tableView reloadData];
                                                                 }
                                                             }];
    }
}
/**
 *  This methods is used to get JSON wich will contain info about all available photos for such request
 */
- (void)downloadInfoAboutAllPhotos {
    __weak ContentTableViewController *wself = self;
    SessionManager *lSessionManager = [SessionManager shareManager];
    [lSessionManager DownloadAllPhotosInfoWithSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        [wself createModelsWithResponse:responseObject];
        [wself downloadPreviewImages];
    } failureHandler:^(NSURLSessionDataTask *task, NSError *error) {
        UIAlertController * lAlert =  [UIAlertController alertControllerWithTitle:@"Unable to download info about photos"
                                                                          message:[NSString stringWithFormat:@"Error :%@", error]
                                                                   preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* lOk = [UIAlertAction actionWithTitle:@"OK"
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                        [wself dismissViewControllerAnimated:YES completion:nil];
                                                    }];
        [lAlert addAction:lOk];
        [self presentViewController:lAlert animated:YES completion:nil];
    }];
}

/**
 *  This methods is ised to create ImageModel items from JSON response
 *
 *  @param response NSDictionary instance
 */
- (void)createModelsWithResponse:(NSDictionary*)response {
    NSArray *lModels = (NSArray*)response[kResponseKey];
    
    for (NSDictionary *imageInfo in lModels) {
        ImageModel *lImageModel = [ImageModel new];
        
        [lImageModel setPreviewImageURL:imageInfo[kImagePreviewUrl]];
        [lImageModel setFullSizeImageURL:imageInfo[kImageFullSizeUrl]];
        
        [_imageModels addObject:lImageModel];
    }
    
    [self.tableView reloadData];
}

/**
 *  This methods is used to get proper image from _imageModels for particular cell
 *
 *  @param sender - ContentTableViewCell instance
 *
 *  @return - UIImage instance
 */
- (UIImage*)imageForSender:(id)sender {
    NSIndexPath *lIndexPath = [self.tableView indexPathForCell:sender];
    return ((ImageModel*)_imageModels[lIndexPath.row]).fullSizeImage;
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _imageModels.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *lIdentifier = @"ContentTableViewCell";
    
    ContentTableViewCell *lCell = [tableView dequeueReusableCellWithIdentifier:lIdentifier];
    
    if (lCell == nil) {
        lCell = [[ContentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:lIdentifier];
    }
    
    [lCell setImageModel:_imageModels[indexPath.row]];
    lCell.delegate = self;
    
    return lCell;
}

#pragma mark - ContentTableViewCell Delegate

- (void)ContentTableViewCell:(ContentTableViewCell*)cell didDownloadButtonCilck:(UIButton*)button forImageModel:(ImageModel*)model {
    SessionManager *lSessionManager = [SessionManager shareManager];
    
    __weak ImageModel *wImageModel = model;
    __weak ContentTableViewController *wself = self;
    
    model.fullSizeDownloadTask = [lSessionManager downloadPhotoWithURL:model.fullSizeImageURL
                                                     completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                                                         if (error) {
                                                             NSLog(@"Failed to download image error: %@", error);
                                                         } else {
                                                             NSData *lData = [NSData dataWithContentsOfURL:filePath];
                                                             wImageModel.fullSizeImage = [[UIImage alloc] initWithData:lData];
                                                             
                                                             [wself.tableView reloadData];
                                                         }
                                                     }];
    
    [self.tableView reloadData];
}


@end
