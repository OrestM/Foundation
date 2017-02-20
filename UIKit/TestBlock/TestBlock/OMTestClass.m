//
//  OMTestClass.m
//  TestBlock
//
//  Created by Admin on 6/6/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMTestClass.h"
#import "ViewController.h"

@implementation OMTestClass

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showText:) name:@"passTxt" object:nil];
    }
    return self;
}

- (void)getText:(TestBlock)text {
   
    NSString *hi = @"Hi";
    text(hi);
    
}

- (void)showText:(NSNotification *)notification {
    NSLog(@"%@", notification.object);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"dealloc");
}

@end
