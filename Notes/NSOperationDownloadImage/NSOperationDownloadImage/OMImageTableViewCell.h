//
//  OMImageTableViewCell.h
//  NSOperationDownloadImage
//
//  Created by Admin on 6/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OMImageDownloaded;

@interface OMImageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageDownload;

@property (strong, nonatomic) OMImageDownloaded *model;

@end
