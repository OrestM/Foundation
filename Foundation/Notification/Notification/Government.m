//
//  Government.m
//  Notification
//
//  Created by Admin on 2/3/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Government.h"

NSString* const GovernmentTaxLevelNotification = @"GovernmentTaxLevelNotification";
NSString* const GovernmentSalaryNotification = @"GovernmentSalaryNotification";
NSString* const GovernmentPansionNotification = @"GovernmentPansionNotification";
NSString* const GovernmentAveragePriceNotification = @"GovernmentAveragePriceNotification";

NSString* const GovernmentTaxLevelUserInfoKey = @"GovernmentTaxLevelUserInfoKey";
NSString* const GovernmentSalaryUserInfoKey = @"GovernmentSalaryUserInfoKey";
NSString* const GovernmentPansionUserInfoKey = @"GovernmentPansionUserInfoKey";
NSString* const GovernmentAveragePriceUserInfoKey = @"GovernmentAveragePriceUserInfoKey";

@implementation Government

- (instancetype)init
{
    self = [super init];
    if (self) {
        _taxLevel = 5.f;
        _salary = 1000;
        _pansion = 500;
        _averagePrice = 10.f;
    }
    return self;
}

- (void)setTaxLevel:(float)taxLevel {
    _taxLevel = taxLevel;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:GovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentTaxLevelNotification object:nil userInfo:dictionary];
}

- (void) setSalary:(float)salary {
    _salary = salary;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:GovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentSalaryNotification object:nil userInfo:dictionary];
}

- (void)setPansion:(float)pansion {
    _pansion = pansion;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pansion] forKey:GovernmentPansionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentPansionNotification object:nil userInfo:dictionary];
}

- (void)setAveragePrice:(float)averagePrice {
    _averagePrice = averagePrice;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:GovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentAveragePriceNotification object:nil userInfo:dictionary];
}

@end
