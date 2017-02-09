//
//  UIView+OMUITableViewCell.m
//  UINavigationEditStoryboard 2
//
//  Created by Admin on 3/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "UIView+OMUITableViewCell.h"

@implementation UIView (OMUITableViewCell)

- (UITableViewCell *)superCell {
    
    if (!self.superview) {
        return nil;
    }
    
    if ([self.superview isKindOfClass:[UITableViewCell class]]) {
        return (UITableViewCell *)self.superview;
    }
    
    return [self.superview superCell];
    
}

@end
