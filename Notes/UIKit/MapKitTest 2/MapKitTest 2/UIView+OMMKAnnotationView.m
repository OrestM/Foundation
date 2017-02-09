//
//  UIView+OMMKAnnotationView.m
//  MapKitTest 2
//
//  Created by Admin on 3/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "UIView+OMMKAnnotationView.h"
#import <MapKit/MKAnnotationView.h>

@implementation UIView (OMMKAnnotationView)

- (MKAnnotationView *)superAnnotationView {
    
    if ([self isKindOfClass:[MKAnnotationView class]]) {
        
        return (MKAnnotationView *)self;
        
    }
    
    if (!self.superview) {
        
        return nil;
        
    }
    
    return [self.superview superAnnotationView];
    
}

@end
