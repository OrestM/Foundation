//
//  OMHonda.m
//  Car
//
//  Created by Admin on 3/24/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMHonda.h"

@implementation OMHonda

@synthesize carModel = _carModel, carVolumeMotor = _carVolumeMotor, carWhels = _carWhels, carDoors = _carDoors;

- (instancetype)init {
    self = [super init];
    
    if (self) {
        
        _carMark = @"Honda";
        _carModel = @"Civic";
        _carVolumeMotor = 1.6f;
        _carWhels = 4;
        _carDoors = 3;
        
    }
    
    return self;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Car:\nMark = %@,\nModel = %@,\nVolume motor = %1.1f,\nWhels = %ld,\nDors = %ld",
            _carMark, _carModel, _carVolumeMotor, _carWhels, _carDoors];
    
}

@end
