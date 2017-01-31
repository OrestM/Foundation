//
//  Person.m
//  Notification
//
//  Created by Admin on 2/3/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Person.h"
#import "Government.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* ns = [NSNotificationCenter defaultCenter];
        
        [ns addObserver:self selector:@selector(salaryChangeNotification:) name:GovernmentSalaryNotification object:nil];
        [ns addObserver:self selector:@selector(averagePriceChangeNotification:) name:GovernmentAveragePriceNotification object:nil];

    }
    return self;
}

#pragma mark - Notification

- (void)salaryChangeNotification:(NSNotification*)notification {
    
    NSNumber* value = [notification.userInfo objectForKey:GovernmentSalaryUserInfoKey];
    
    float salary = [value floatValue];
    
    if (salary < self.salary) {
        NSLog(@"Person are not happy.");
    } else {
        NSLog(@"Person happy.");
    }
    
    self.salary = salary;
}

- (void)averagePriceChangeNotification:(NSNotification*)notification {
    
    NSNumber* value = [notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey];
    
    float avaragePrice = [value floatValue];
    
    if (avaragePrice < self.averagePrice) {
        NSLog(@"Person very happy.");
    } else {
       NSLog(@"Person are not happy averagePrice."); 
    }
    
    self.averagePrice = avaragePrice;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
