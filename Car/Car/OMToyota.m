//
//  OMToyota.m
//  Car
//
//  Created by Admin on 3/24/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMToyota.h"

@implementation OMToyota

@synthesize carModel = _carModel, carVolumeMotor = _carVolumeMotor, carWhels = _carWhels, carDoors = _carDoors;

- (instancetype)init {
    self = [super init];
    
    if (self) {
        
        _carMark = @"Toyota";
        _carModel = @"Camry";
        _carVolumeMotor = 2.0f;
        _carWhels = 4;
        _carDoors = 5;
        _cruiseControl = YES;
        
    }
    
    return self;
}

- (NSString *)description {

    return [NSString stringWithFormat:
            @"Car:\nMark = %@,\nModel = %@,\nVolume motor = %1.1f,\nWhels = %ld,\nDors = %ld,\nCruize-Control = %@",
            _carMark, _carModel, _carVolumeMotor, _carWhels, _carDoors, _cruiseControl ? @"YES" : @"NO"];

}

@end
