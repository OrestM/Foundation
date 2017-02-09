//
//  SessionManager.m
//  TableView
//
//  Created by Admin on 12/25/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "SessionManager.h"
#import "Global.h"

@interface SessionManager() {
    NSURL *_filesDirectory;
}

@end

@implementation SessionManager

- (id)init {
    self = [super initWithBaseURL:[NSURL URLWithString:kBaseUrl]];
    
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return  self;
}

+ (id)shareManager {
    static SessionManager *_sessionManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sessionManager = [[self alloc] init];
    });
    
    return _sessionManager;
}

#pragma mark - public method

- (NSURLSessionDataTask*)DownloadAllPhotosInfoWithSuccess:(SuccessCompletionHandler)successCompletion
                                         failureHandler:(FailureCompletionHandler)failureCompletion {
    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];    
    return [self GET:@"api" parameters:@{@"key":kApiKey, @"q":kStringForSearch} progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 successCompletion(task, responseObject);
             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 failureCompletion(task, error);
    }];
}

- (NSURLSessionDownloadTask*)downloadPhotoWithURL:(NSString *)url
                               completionHandler:(DownloadCompletionHandler)completion {
    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    NSURL *lUrl = [NSURL URLWithString:url];
    NSURLRequest *lRequest = [NSURLRequest requestWithURL:lUrl];
    NSURLSessionDownloadTask *lDownloadTask = [self downloadTaskWithRequest:lRequest
                                                                   progress:nil
                                                                destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
                                                                    return [self.filesDirectory URLByAppendingPathComponent:[response suggestedFilename]];
                                                                }
                                                          completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                                                              completion(response,filePath,error);
                                                          }];
    [lDownloadTask resume];
    
    return lDownloadTask;
}

#pragma  mark - private method

- (NSURL*)filesDirectory {
    if(!_filesDirectory) {
        NSString *documentsDirectory = [DOCUMENTS_FOLDER stringByAppendingPathComponent:@"Images"];
        BOOL lExists = [[NSFileManager defaultManager] fileExistsAtPath:documentsDirectory isDirectory:NULL];
        if (!lExists) {
            NSError *error = nil;
            [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:&error];
            
            if (error) {
                NSLog(@"%s, Failed to create directory at path: %@, error: %@", __func__,documentsDirectory,error);
                return nil;
            }
        }
        _filesDirectory = [NSURL URLWithString:[@"file://" stringByAppendingString:documentsDirectory]];
    }
    return _filesDirectory;
}


@end
