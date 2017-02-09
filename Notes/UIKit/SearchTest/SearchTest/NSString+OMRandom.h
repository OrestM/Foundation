//
//  NSString+OMRandom.h
//  SearchTest
//
//  Created by Admin on 3/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (OMRandom)

+ (NSString *)randomAlphanumericStringWithLength;
+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length;

@end
