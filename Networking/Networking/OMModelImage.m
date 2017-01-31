//
//  OMModelImage.m
//  Networking
//
//  Created by Admin on 5/27/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMModelImage.h"
#import <AFNetworking.h>

@interface OMModelImage ()

@end

@implementation OMModelImage

+ (NSArray *)models {
    
    NSString *pathResource   = [[NSBundle mainBundle] pathForResource:@"imagesList" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:pathResource];
    
    OMModelImage* image1  = [[OMModelImage alloc] init];
    OMModelImage* image2  = [[OMModelImage alloc] init];
    OMModelImage* image3  = [[OMModelImage alloc] init];
    OMModelImage* image4  = [[OMModelImage alloc] init];
    OMModelImage* image5  = [[OMModelImage alloc] init];
    OMModelImage* image6  = [[OMModelImage alloc] init];
    OMModelImage* image7  = [[OMModelImage alloc] init];
    OMModelImage* image8  = [[OMModelImage alloc] init];
    OMModelImage* image9  = [[OMModelImage alloc] init];
    OMModelImage* image10 = [[OMModelImage alloc] init];
    OMModelImage* image11 = [[OMModelImage alloc] init];
    OMModelImage* image12 = [[OMModelImage alloc] init];
    OMModelImage* image13 = [[OMModelImage alloc] init];
    OMModelImage* image14 = [[OMModelImage alloc] init];
    OMModelImage* image15 = [[OMModelImage alloc] init];
    OMModelImage* image16 = [[OMModelImage alloc] init];
    OMModelImage* image17 = [[OMModelImage alloc] init];
    OMModelImage* image18 = [[OMModelImage alloc] init];
    OMModelImage* image19 = [[OMModelImage alloc] init];
    OMModelImage* image20 = [[OMModelImage alloc] init];
    
    image1.imageUrl  = [NSURL URLWithString:[dictionary valueForKey:@"image1"]];
    image2.imageUrl  = [NSURL URLWithString:[dictionary valueForKey:@"image2"]];
    image3.imageUrl  = [NSURL URLWithString:[dictionary valueForKey:@"image3"]];
    image4.imageUrl  = [NSURL URLWithString:[dictionary valueForKey:@"image4"]];
    image5.imageUrl  = [NSURL URLWithString:[dictionary valueForKey:@"image5"]];
    image6.imageUrl  = [NSURL URLWithString:[dictionary valueForKey:@"image6"]];
    image7.imageUrl  = [NSURL URLWithString:[dictionary valueForKey:@"image7"]];
    image8.imageUrl  = [NSURL URLWithString:[dictionary valueForKey:@"image8"]];
    image9.imageUrl  = [NSURL URLWithString:[dictionary valueForKey:@"image9"]];
    image10.imageUrl = [NSURL URLWithString:[dictionary valueForKey:@"image10"]];
    image11.imageUrl = [NSURL URLWithString:[dictionary valueForKey:@"image11"]];
    image12.imageUrl = [NSURL URLWithString:[dictionary valueForKey:@"image12"]];
    image13.imageUrl = [NSURL URLWithString:[dictionary valueForKey:@"image13"]];
    image14.imageUrl = [NSURL URLWithString:[dictionary valueForKey:@"image14"]];
    image15.imageUrl = [NSURL URLWithString:[dictionary valueForKey:@"image15"]];
    image16.imageUrl = [NSURL URLWithString:[dictionary valueForKey:@"image16"]];
    image17.imageUrl = [NSURL URLWithString:[dictionary valueForKey:@"image17"]];
    image18.imageUrl = [NSURL URLWithString:[dictionary valueForKey:@"image18"]];
    image19.imageUrl = [NSURL URLWithString:[dictionary valueForKey:@"image19"]];
    image20.imageUrl = [NSURL URLWithString:[dictionary valueForKey:@"image20"]];
    
    return @[image1, image2, image3, image4, image5, image6, image7, image8, image9, image10, image11, image12,
             image13, image14, image15, image16, image17, image18, image19, image20];
    
}

- (NSString *)imageName {
    
    _imageName = _imageUrl.lastPathComponent;
    
    return _imageName;
    
}

- (void)download {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.imageUrl];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = nil;
            if ([self.delegate respondsToSelector:@selector(modelImageDidUpdateProgress:)]) {
                [self.delegate modelImageDidUpdateProgress:downloadProgress.fractionCompleted];
            } else {
                NSLog(@"Error: %@", [error localizedDescription]);
            }
        });
        
    }  destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        targetPath = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [targetPath URLByAppendingPathComponent:self.imageName];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self.delegate respondsToSelector:@selector(modelImageDidFinishDownloading)]) {
                [self.delegate modelImageDidFinishDownloading];
            } else {
                NSError *saveError = nil;
                NSLog(@"%@", [saveError localizedDescription]);
            }
        });
        
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];
    
}

- (UIImage *)getCacheImage {
    
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *getImage = [NSString stringWithFormat:@"%@/%@", documentsDirectory, self.imageName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:getImage]) {
        
        self.image = [UIImage imageWithContentsOfFile:getImage];
        
    }
    
    return self.image;
}

@end
