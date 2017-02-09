//
//  Developer.m
//  Protocol
//
//  Created by Admin on 2/2/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Developer.h"

@implementation Developer

- (void)work {
    
}

#pragma mark - Patient

- (BOOL)areYouOkey {
    
    BOOL ok = arc4random() % 2;
    
    NSLog(@"Is developer %@ ok %@?", _name, ok ? @"YES" : @"NO");
    
    return ok;
}

- (void)takePill {
    NSLog(@"Developer %@ takes a pill.", _name);
}

- (void)makeShots {
    NSLog(@"Developer %@ make a shots.", _name);
}

- (NSString*)howYourJob {
    return @"I love my job)";
}

@end
