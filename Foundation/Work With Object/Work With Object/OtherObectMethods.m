//
//  OtherObectMethods.m
//  Work With Object
//
//  Created by Admin on 1/26/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OtherObectMethods.h"
#import "ObjectAndMethods.h"

@implementation OtherObectMethods

- (void)sayHello:(NSString *)greeting {
    NSString *uppercaseGreeting = [greeting uppercaseString];
    NSLog(@"%@", uppercaseGreeting);
//    [super sayHello:uppercaseGreeting];
}

@end
