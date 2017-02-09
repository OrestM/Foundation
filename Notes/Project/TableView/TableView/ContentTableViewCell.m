//
//  ContentTableViewCell.m
//  TableView
//
//  Created by Admin on 12/25/15.
//  Copyright © 2015 Admin. All rights reserved.
//
#import "ContentTableViewCell.h"
#import "UIProgressView+AFNetworking.h"
#import "ImageModel.h"

@interface ContentTableViewCell () {
    IBOutlet UIButton *_buttonDownload;
    IBOutlet UIProgressView *_progressView;
    IBOutlet UIImageView *_imageView;
    IBOutlet UIActivityIndicatorView *_activityIndicator;
}
- (void)checkPreviewImageSettingsForModel:(ImageModel*)model;
- (void)checkFullSizeImageSettingsForModel:(ImageModel *)model;

@end

@implementation ContentTableViewCell

- (IBAction)downloadImage:(id)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(ContentTableViewCell:didDownloadButtonCilck:forImageModel:)]) {
        [_buttonDownload setEnabled:NO];
        [_delegate ContentTableViewCell:self didDownloadButtonCilck:_buttonDownload forImageModel:_imageModel];
    }
}

#pragma mark - public methods

- (void)setImageModel:(ImageModel*)model {
    [self checkPreviewImageSettingsForModel:model];
    [self checkFullSizeImageSettingsForModel:model];
    
    _imageModel = model;
}

#pragma mark - private methods

- (void)checkPreviewImageSettingsForModel:(ImageModel*)model {
    if (model.previewDownloadTask && !model.previewImage) {
        [_activityIndicator setHidden:NO];
        [_activityIndicator startAnimating];
    } else if(model.previewDownloadTask && model.previewImage) {
        _imageView.image = model.previewImage;
        [_activityIndicator stopAnimating];
        [_activityIndicator setHidden:YES];
    }
}

- (void)checkFullSizeImageSettingsForModel:(ImageModel *)model {
    if (!model.fullSizeImage && model.fullSizeDownloadTask) {
        [_buttonDownload setEnabled:NO];
        [_progressView setProgressWithDownloadProgressOfTask:(NSURLSessionDownloadTask*)model.fullSizeDownloadTask animated:YES];
    } else if(model.fullSizeImage && model.fullSizeDownloadTask){
        [_buttonDownload setEnabled:NO];
        [_progressView setProgress:1];
    } else {
        [_buttonDownload setEnabled:YES];
        [_progressView setProgress:0];
    }
}

@end
