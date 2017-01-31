//
//  Patient.m
//  TestDelegate
//
//  Created by Admin on 1/25/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (BOOL) howAreYou {
    BOOL iFellGood = arc4random() % 2;
    
    if (!iFellGood) {
        [_delegate patientFeelsBad:self];
    }
    
    return iFellGood;
}

- (void) takePill {
    NSLog(@"%@ take a pill", _name);
}

- (void) makeShot {
   NSLog(@"%@ make a shot", _name);
}


@end
