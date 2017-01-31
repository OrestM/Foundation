//
//  OMModelImage.h
//  Networking
//
//  Created by Admin on 5/27/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol OMModelImageDelegate;

@interface OMModelImage : NSObject

@property (weak, nonatomic) id<OMModelImageDelegate> delegate;

@property (strong, nonatomic) UIImage  *image;
@property (strong, nonatomic) NSURL    *imageUrl;
@property (copy,   nonatomic) NSString *imageName;
@property (strong, nonatomic) NSURLSessionDownloadTask *downloadTask;

- (void)download;

- (UIImage *)getCacheImage;
+ (NSArray *)models;

@end

@protocol OMModelImageDelegate <NSObject>

- (void)isDownload;
- (void)modelImageDidFinishDownloading;
- (void)modelImageDidUpdateProgress:(CGFloat)progress;

@end
