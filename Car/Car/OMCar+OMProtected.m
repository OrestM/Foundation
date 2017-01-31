//
//  OMCar+OMProtected.m
//  Car
//
//  Created by Admin on 3/24/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMCar+OMProtected.h"

@implementation OMCar (OMProtected)

- (BOOL)ifNeedChangeOil:(BOOL)changeOil {
    
    if (changeOil == YES) {
        [self changeOil];
    } else {
        [self oilOk];
    }
    
    return changeOil;
}

- (void)changeOil {
    
    NSLog(@"%@ - need change motor oil", self.carModel);
    
}

- (void)oilOk {
    
    NSLog(@"%@ - motor oil fine", self.carModel);
    
}

@end
