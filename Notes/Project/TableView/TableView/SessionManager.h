//
//  SessionManager.h
//  TableView
//
//  Created by Admin on 12/25/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "AFNetworking/AFNetworking.h"

typedef void (^SuccessCompletionHandler)(NSURLSessionDataTask *task, id responseObject);
typedef void (^FailureCompletionHandler)(NSURLSessionDataTask *task, NSError *error);
typedef void (^DownloadCompletionHandler)(NSURLResponse *response, NSURL *filePath, NSError *error);

@interface SessionManager : AFHTTPSessionManager

+ (id)shareManager;

- (NSURLSessionDataTask*)DownloadAllPhotosInfoWithSuccess:(SuccessCompletionHandler)successCompletion
                                         failureHandler:(FailureCompletionHandler)failureCompletion;

- (NSURLSessionDownloadTask*)downloadPhotoWithURL:(NSString*)url
                               completionHandler:(DownloadCompletionHandler)completion;

@end
