//
//  OMCar+OMProtected.h
//  Car
//
//  Created by Admin on 3/24/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMCar.h"

@interface OMCar (OMProtected)

- (BOOL)ifNeedChangeOil:(BOOL)changeOil;
- (void)changeOil;
- (void)oilOk;

@end
