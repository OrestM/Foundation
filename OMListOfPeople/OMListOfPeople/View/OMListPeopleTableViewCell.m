//
//  OMListPeopleTableViewCell.m
//  OMListOfPeople
//
//  Created by Orest Mykha on 2/4/17.
//  Copyright © 2017 Orest Mykha. All rights reserved.
//

#import "OMListPeopleTableViewCell.h"

@interface OMListPeopleTableViewCell ()

@property (strong, nonatomic) NSURLSessionDataTask *dataTask;
@property (strong, nonatomic) NSURL *currentUrl;

@end

@implementation OMListPeopleTableViewCell

- (void)loadImageWithUrl:(NSURL *)url {    
    
    if ([self.currentUrl isEqual:url]) {
        return;
    } else {
        self.currentUrl = url;
        [self.dataTask cancel];
        
        UIImage *image = [self.cashe objectForKey:url];
        self.image.image = image;

    }

    if (self.image.image) {
        return;
    } else {
        self.dataTask = [self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error) {
                UIImage *downloadedImage = [UIImage imageWithData:data];
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.image.image = downloadedImage;
                    if (downloadedImage) {
                        [self.cashe setObject:downloadedImage forKey:url];
                    }
                });
            }
        }];
        [self.dataTask resume];
    }
    
}

@end
