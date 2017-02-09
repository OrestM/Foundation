//
//  ObjectAndMethods.m
//  Work With Object
//
//  Created by Admin on 1/26/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ObjectAndMethods.h"

@implementation ObjectAndMethods

- (void)sayHello {
    [self sayHello:@"Hello friends!"];
}

- (void)sayHello:(NSString*)greating {
    NSLog(@"%@", greating);
}

- (int)magicNumber {
    return 42;
}

@end
