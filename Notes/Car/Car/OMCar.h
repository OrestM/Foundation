//
//  OMCar.h
//  Car
//
//  Created by Admin on 3/24/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@interface OMCar : NSObject
    
@property (copy, nonatomic) NSString *carModel;
@property (assign, nonatomic) CGFloat carVolumeMotor;
@property (assign, nonatomic) NSInteger carWhels;
@property (assign, nonatomic) NSInteger carDoors;

@end
