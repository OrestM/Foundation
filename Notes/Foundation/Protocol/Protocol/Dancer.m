//
//  Dancer.m
//  Protocol
//
//  Created by Admin on 2/2/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Dancer.h"

@implementation Dancer

- (void)dance {
    
}

#pragma mark - Patient

- (BOOL)areYouOkey {
    
    BOOL ok = arc4random() % 2;
    
    NSLog(@"Is dancer %@ ok %@?", _name, ok ? @"YES" : @"NO");
    
    return ok;
}

- (void)takePill {
    NSLog(@"Dancer %@ takes a pill.", _name);
}

- (void)makeShots {
    NSLog(@"Dancer %@ make a shots.", _name);
}

@end
