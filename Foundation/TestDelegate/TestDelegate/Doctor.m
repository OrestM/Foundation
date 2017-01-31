//
//  Doctor.m
//  TestDelegate
//
//  Created by Admin on 1/26/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor

#pragma mark - PatientDelegate

- (void) patientFeelsBad:(Patient*) patient {
    
    NSLog(@"%@ patient fells bad", patient.name);
    
    if (patient.temperature >= 37 && patient.temperature <= 39) {
        [patient takePill];
    } else if (patient.temperature > 39) {
        [patient makeShot];
    } else {
        NSLog(@"%@ you have just a rest", patient.name);
    }
}

@end
