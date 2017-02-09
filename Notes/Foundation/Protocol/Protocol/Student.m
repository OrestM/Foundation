//
//  Student.m
//  Protocol
//
//  Created by Admin on 2/2/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)study {
    
}

#pragma mark - Patient

- (BOOL)areYouOkey {
    
    BOOL ok = arc4random() % 2;
    
    NSLog(@"Is student %@ ok %@?", _name, ok ? @"YES" : @"NO");
    
    return ok;
}

- (void)takePill {
    NSLog(@"Student %@ takes a pill.", _name);
}

- (void)makeShots {
    NSLog(@"Student %@ make a shots.", _name);
}

- (NSString*)howYourFamily {
    return @"My family are fine)";
}

@end
