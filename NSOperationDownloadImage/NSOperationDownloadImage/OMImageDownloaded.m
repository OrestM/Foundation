//
//  OMImageDownloaded.m
//  NSOperationDownloadImage
//
//  Created by Admin on 6/9/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMImageDownloaded.h"
#import <AFNetworking/AFNetworking.h>

@interface OMImageDownloaded () 

@property (strong, nonatomic) NSArray *images;
@property (strong, nonatomic) NSOperationQueue *myQueue;

@end

@implementation OMImageDownloaded

+ (NSArray *)allImages {
    
    OMImageDownloaded *image1  = [OMImageDownloaded new];
    OMImageDownloaded *image2  = [OMImageDownloaded new];
    OMImageDownloaded *image3  = [OMImageDownloaded new];
    OMImageDownloaded *image4  = [OMImageDownloaded new];
    OMImageDownloaded *image5  = [OMImageDownloaded new];
    OMImageDownloaded *image6  = [OMImageDownloaded new];
    OMImageDownloaded *image7  = [OMImageDownloaded new];
    OMImageDownloaded *image8  = [OMImageDownloaded new];
    OMImageDownloaded *image9  = [OMImageDownloaded new];
    OMImageDownloaded *image10 = [OMImageDownloaded new];
    OMImageDownloaded *image11 = [OMImageDownloaded new];
    OMImageDownloaded *image12 = [OMImageDownloaded new];
    OMImageDownloaded *image13 = [OMImageDownloaded new];
    OMImageDownloaded *image14 = [OMImageDownloaded new];
    OMImageDownloaded *image15 = [OMImageDownloaded new];
    OMImageDownloaded *image16 = [OMImageDownloaded new];
    OMImageDownloaded *image17 = [OMImageDownloaded new];
    OMImageDownloaded *image18 = [OMImageDownloaded new];
    OMImageDownloaded *image19 = [OMImageDownloaded new];
    OMImageDownloaded *image20 = [OMImageDownloaded new];
    
    image1.url  = [NSURL URLWithString:@"http://i.stack.imgur.com/ILTQq.png"];
    image2.url  = [NSURL URLWithString:@"http://images2.wikia.nocookie.net/__cb20120807053107/poohadventures/images/4/45/Goofy_hq.png"];
    image3.url  = [NSURL URLWithString:@"http://live.todocast.tv/images/Twitter-Bird.png"];
    image4.url  = [NSURL URLWithString:@"http://vignette4.wikia.nocookie.net/robber-penguin-agency/images/6/6e/Small-mario.png/revision/latest?cb=20150107080404"];
    image5.url  = [NSURL URLWithString:@"http://xn--80aalcbc2bocdadlpp9nfk.xn--d1acj3b/images/persona/kolya.png"];
    image6 .url = [NSURL URLWithString:@"http://s1.iconbird.com/ico/0612/HydroPROv2/w512h5121339358929Network.png"];
    image7.url  = [NSURL URLWithString:@"http://s1.iconbird.com/ico/0912/ILikeButtons3A/w512h5121348753316CuteBallGames.png"];
    image8.url  = [NSURL URLWithString:@"https://en.opensuse.org/images/8/83/Thunderbird_logo.png"];
    image9.url  = [NSURL URLWithString:@"http://juegayestudia.com/images/users/tiburon.png"];
    image10.url = [NSURL URLWithString:@"http://iconizer.net/files/Brilliant/orig/muscle_car.png"];
    image11.url = [NSURL URLWithString:@"http://www.fleetexpo.lu/wp-content/uploads/2015/09/VW-Golf.png"];
    image12.url = [NSURL URLWithString:@"http://farniente.com/wp-content/uploads/2013/12/car_car.png"];
    image13.url = [NSURL URLWithString:@"https://gaycarboys.files.wordpress.com/2012/01/image9.png"];
    image14.url = [NSURL URLWithString:@"https://d19hkjflplfhx2.cloudfront.net/media/google/google-logo.png"];
    image15.url = [NSURL URLWithString:@"http://thcsvinhninh.edu.vn/uploads/thcsvinhninh.edu.vn/albums/canh_dep/anh7.jpg"];
    image16.url = [NSURL URLWithString:@"http://sharbatrepublic.com/wp-content/themes/sharbat/img/animated/bird.png"];
    image17.url = [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/7/7a/Basketball.png"];
    image18.url = [NSURL URLWithString:@"http://3.bp.blogspot.com/--1wPBNN2VAU/VLbUoh5WMLI/AAAAAAAAEvk/pM1EUq0b--A/s1600/962px-Ground_Pound_Yoshi.png"];
    image19.url = [NSURL URLWithString:@"http://www.samsung.com/us/images/header/header-level.png"];
    image20.url = [NSURL URLWithString:@"http://pngimg.com/upload/grape_PNG521.png"];
    
    return @[image1, image2, image3, image4, image5, image6, image7, image8, image9, image10, image11, image12, image13,
             image14, image15, image16, image17, image18, image19, image20];
    
}

- (void)operationQueue {
    
    NSInvocationOperation *opInvocation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(start) object:nil];
    
    self.myQueue = [[NSOperationQueue alloc] init];
    self.myQueue.name = @"Operation Queue";
    [self.myQueue addOperation:opInvocation];
    [self.myQueue setMaxConcurrentOperationCount:1];
    
}

- (void)start {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    
    [[manager downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        targetPath = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [targetPath URLByAppendingPathComponent:response.suggestedFilename];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(queue, ^{
            NSData *data = [NSData dataWithContentsOfURL:filePath];
            self.image = [UIImage imageWithData:data];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if ([self.delegate respondsToSelector:@selector(imageDidFinishDownloaded)]) {
                    [self.delegate imageDidFinishDownloaded];
                    
                }
            });
        });
        
        NSLog(@"File downloaded to: %@", filePath);
        
    }] resume];
    
}


@end
