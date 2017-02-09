//
//  OMImageDownloaded.h
//  NSOperationDownloadImage
//
//  Created by Admin on 6/9/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol OMImageDownloadedDelegate;

@interface OMImageDownloaded : NSOperation

@property (weak, nonatomic) id<OMImageDownloadedDelegate> delegate;

@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) UIImage *image;

+ (NSArray *)allImages;
- (void)operationQueue;

@end

@protocol OMImageDownloadedDelegate <NSObject>

- (void)imageDidFinishDownloaded;

@end