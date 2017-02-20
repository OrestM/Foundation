//
//  OMBonusView.m
//  DelegateTapGestore
//
//  Created by Admin on 5/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMBonusView.h"

@implementation OMBonusView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(20, 20, 50, 50);
        self.backgroundColor = [UIColor yellowColor];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)handleTap {
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"Tap" object:nil];
    if ([self.delegate respondsToSelector:@selector(didPressTap)]) {
        
        [self.delegate didPressTap];
        
    } else {
        
        NSLog(@"Unrecognizer selector");
        
    }
    
}

@end
