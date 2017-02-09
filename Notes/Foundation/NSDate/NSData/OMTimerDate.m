//
//  OMTimerDate.m
//  NSData
//
//  Created by Admin on 3/3/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMTimerDate.h"

@implementation OMTimerDate

- (instancetype)init
{
    self = [super init];
    if (self) {
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerMethod:) userInfo:nil repeats:NO];
    }
    return self;
}

- (void)timerMethod:(NSTimer *)timer {
    NSDateFormatter* formatterDate = [[NSDateFormatter alloc]init];
    [formatterDate setDateFormat:@"HH:mm:ss:SSS"];
    NSLog(@"%@", [formatterDate stringFromDate:[NSDate date]]);
}

- (void)dealloc {
    NSLog(@"OMTimerDate dealloc");
}

@end
