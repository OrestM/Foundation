//
//  Cat.m
//  Animal
//
//  Created by Admin on 11/2/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "Cat.h"

@implementation Cat

- (id)initWithFavorites:(NSString *)name andAge:(NSInteger)age andColor:(NSString *)color andSleep:(NSInteger)sleep {
    self = [super init];
    if (self) {        
        Name = name;
        Age = age;
        Color = color;
        Sleep = sleep;
    }
    return self;
}

- (void)_Voice {
    NSLog(@"Meaw!");
}

- (void)_nameSleep {
    NSLog(@"Its name %@. Its sleep %li hour.", Name, (long)Sleep);
}

@end
