//
//  OMTestClass.m
//  TestBlock
//
//  Created by Admin on 6/6/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMTestClass.h"

@implementation OMTestClass

- (void)getText:(NSString *(^)(void))block {
    
    NSString *addText = @"Hi";
   
    NSLog(@"%@ %@", addText, block());
    
}

@end
