//
//  Dog.m
//  Animal
//
//  Created by Admin on 11/1/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (id)initWithFavorites:(NSString*)name andAge:(NSInteger)age andColor:(NSString*)color andPaws:(NSInteger)paws {
    self = [super init];
    if (self) {
        Name = name;
        Age = age;
        Color = color;
        Paws = paws;
    }
    return self;
}

- (void)_namePaws {
    NSLog(@"Its name %@ .It has %li paws.", Name, (long)Paws);
}

- (void)_Voice {
    NSLog(@"Gav!");
}

@end
