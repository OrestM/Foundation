//
//  Bear.m
//  Animal
//
//  Created by Admin on 11/2/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "Bear.h"

@implementation Bear

- (id)initWithFavorites:(NSString *)name andAge:(NSInteger)age andColor:(NSString *)color andHunter:(NSString *)hunt {
    self = [super init];
    if (self) {
        Name = name;
        Age = age;
        Color = color;
        Hunter = hunt;        
    }
    return self;
}

- (void)_Voice {
    NSLog(@"Hrr!");
}

- (void)_hunter {
    NSLog(@"Its name %@. Its professional %@.", Name, Hunter);
}

@end
