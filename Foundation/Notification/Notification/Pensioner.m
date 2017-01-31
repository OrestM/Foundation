//
//  Pensioner.m
//  Notification
//
//  Created by Admin on 2/3/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Pensioner.h"
#import "Government.h"

@implementation Pensioner

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pansionNotification:) name:GovernmentPansionNotification object:nil];
    }
    return self;
}

- (void)pansionNotification:(NSNotification*)notification {
    
    NSNumber* value = [notification.userInfo objectForKey:GovernmentPansionUserInfoKey];
    
    float pansion = [value floatValue];
    
    if (pansion < self.pansion) {
        NSLog(@"Pensioner are not happy.");
    } else {
        NSLog(@"Pensioner happy.");
    }
    
    self.pansion = pansion;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
