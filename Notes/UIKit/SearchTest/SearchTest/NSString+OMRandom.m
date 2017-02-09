//
//  NSString+OMRandom.m
//  SearchTest
//
//  Created by Admin on 3/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "NSString+OMRandom.h"

@implementation NSString (OMRandom)

+ (NSString *)randomAlphanumericStringWithLength {
    
    int lenght = arc4random() % 11 + 5;
    
    return [self randomAlphanumericStringWithLength:lenght];
    
}

+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length {
    
    NSString *letters = @"abcdefghijklmnopqrstuvwxyz";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (int i = 0; i < length; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    
    return randomString;
    
}

@end
