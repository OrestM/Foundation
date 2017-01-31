//
//  OMImageTableViewCell.m
//  Networking
//
//  Created by Admin on 5/26/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMImageTableViewCell.h"
#import "OMModelImage.h"
#import <AFNetworking/UIProgressView+AFNetworking.h>

@interface OMImageTableViewCell () <OMModelImageDelegate>

@property (weak, nonatomic) IBOutlet UIButton       * download;
@property (weak, nonatomic) IBOutlet UIImageView    * imagePic;
@property (weak, nonatomic) IBOutlet UIProgressView * progressDownload;

@end

@implementation OMImageTableViewCell

- (void)setModel:(OMModelImage *)model {
    
    _model = model;
    _model.delegate = self;
    
    if (_model) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self isDownload];
        self.progressDownload.progress = 1.f;
        [self turnOffButton];
        
    }
    
    if (!_imagePic.image) {
        
        _imagePic.image = [UIImage imageNamed:@"question sign"];
        self.download.enabled = YES;
        self.progressDownload.progress = 0.f;
        self.accessoryType = UITableViewCellAccessoryNone;
        
    }
    
}

- (void)turnOffButton {
    
    self.download.enabled = NO;
    
}

#pragma mark - Actions

- (IBAction)actionStart:(id)sender {
    
    [_model download];
    
}

#pragma mark - ModelImageDelegate

- (void)modelImageDidFinishDownloading {
    
    [self isDownload];
    [self.progressDownload setProgressWithDownloadProgressOfTask:(NSURLSessionDownloadTask *)_model.downloadTask animated:YES];
    [self turnOffButton];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
}

- (void)modelImageDidUpdateProgress:(CGFloat)progress {
    
    self.progressDownload.progress = progress;
    
}

- (void)isDownload {
    
    self.imagePic.image = [_model getCacheImage];
    
}

@end
