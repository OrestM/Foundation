//
//  OMDog.m
//  DelegateDogBiteCat
//
//  Created by Admin on 5/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMDog.h"

@implementation OMDog

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"Dog";
    }
    return self;
}

- (void)dogBiteCat:(OMCat *)cat {
    
    if ([self.delegate respondsToSelector:@selector(showBiteAlert:andCat:)]) {
        
        [self.delegate showBiteAlert:self andCat:cat];
        
    } else {
        
        NSLog(@"Unrecognizer selector");
        
    }
    
}

@end
