//
//  ImageModel.h
//  TableView
//
//  Created by Admin on 12/25/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageModel : NSObject

//URL's for images
@property(nonatomic, strong) NSString *previewImageURL;
@property(nonatomic, strong) NSString *fullSizeImageURL;

//Images
@property(nonatomic, strong) UIImage *previewImage;
@property(nonatomic, strong) UIImage *fullSizeImage;

//Data tasks for downloadinf images
@property(nonatomic, strong) NSURLSessionDownloadTask *previewDownloadTask;
@property(nonatomic, strong) NSURLSessionDownloadTask *fullSizeDownloadTask;

@end
