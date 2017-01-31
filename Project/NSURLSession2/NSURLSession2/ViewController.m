//
//  ViewController.m
//  NSURLSession2
//
//  Created by Admin on 1/25/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDelegate, NSURLSessionDownloadDelegate> {
    NSURLSession* _session;
}

@property (strong, nonatomic) NSURLSessionDownloadTask* downloadTask;
@property (strong, nonatomic) NSData* resumeData;

@end

@implementation ViewController

- (NSURLSession*)session {
    if (!_session) {
        
        //Create session
        NSURLSessionConfiguration* sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        //Session configuration
        _session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
    }
    return _session;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Create downloadTask
    _downloadTask = [self.session downloadTaskWithURL:[NSURL URLWithString:@"http://cdn.tutsplus.com/mobile/uploads/2014/01/5a3f1-sample.jpg"]];
    
    //Resume downloadTask
    [_downloadTask resume];
}

- (IBAction)cancel:(id)sender {
    if (!self.downloadTask) return;
    
    [self.cancelButton setEnabled:NO];
    
    [self.downloadTask cancelByProducingResumeData:^(NSData* resumeData) {
        if (!resumeData) return;
        
        [self setResumeData:resumeData];
        [self setDownloadTask:nil];
    }];
}

- (IBAction)resume:(id)sender {
    if (!self.resumeData) return;
    
    [self.resumeButton setEnabled:NO];
    
    self.downloadTask = [self.session downloadTaskWithResumeData:self.resumeData];
    
    [self.downloadTask resume];
    
    [self setResumeData:nil];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    NSData* data = [NSData dataWithContentsOfURL:location];
    
    dispatch_async(dispatch_get_main_queue(), ^ {
        [self.cancelButton setHidden:YES];
        [self.resumeButton setHidden:YES];
        [self.imageView setImage:[UIImage imageWithData:data]];
    });
    [self.session finishTasksAndInvalidate];
}

@end
