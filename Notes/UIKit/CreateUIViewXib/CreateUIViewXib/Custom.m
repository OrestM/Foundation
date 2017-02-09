//
//  Custom.m
//  CreateUIViewXib
//
//  Created by Admin on 7/27/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Custom.h"

@implementation Custom

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //1. Load interface from .xib file.
        [[NSBundle mainBundle] loadNibNamed:@"Custom" owner:self options:nil];
        
        //2. Add as a subview.
        [self addSubview:self.customView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        //1. Load interface from .xib file.
        [[NSBundle mainBundle] loadNibNamed:@"Custom" owner:self options:nil];
        
        //2. Add as a subview.
        [self addSubview:self.customView];        
    }
    return self;
}

@end
