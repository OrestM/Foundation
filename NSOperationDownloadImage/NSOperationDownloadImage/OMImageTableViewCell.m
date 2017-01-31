//
//  OMImageTableViewCell.m
//  NSOperationDownloadImage
//
//  Created by Admin on 6/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMImageTableViewCell.h"
#import "OMImageDownloaded.h"

@interface OMImageTableViewCell () <OMImageDownloadedDelegate>

@end

@implementation OMImageTableViewCell

- (void)setModel:(OMImageDownloaded *)model {
    
    _model = model;
    _model.delegate = self;
    
    if (_model) {
        
        _imageDownload.image = _model.image;
        
    }
    
    if (!_imageDownload.image) {
        [_model operationQueue];
    }
    
}

#pragma mark - OMImageDownloadedDelegate

- (void)imageDidFinishDownloaded {
    
    _imageDownload.image = _model.image;
    
}

@end
