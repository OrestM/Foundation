//
//  OMBonusView.m
//  DelegateTapGestore
//
//  Created by Admin on 5/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMBonusView.h"

@implementation OMBonusView

- (void)addGestureRecognizer:(UIView *)touchView {
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    [touchView addGestureRecognizer:tapGesture];

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 50, 50)];
        view.backgroundColor = [UIColor yellowColor];
        [self addSubview:view];
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
