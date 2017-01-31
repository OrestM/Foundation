//
//  Government.h
//  Notification
//
//  Created by Admin on 2/3/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const GovernmentTaxLevelNotification;
extern NSString* const GovernmentSalaryNotification;
extern NSString* const GovernmentPansionNotification;
extern NSString* const GovernmentAveragePriceNotification;

extern NSString* const GovernmentTaxLevelUserInfoKey;
extern NSString* const GovernmentSalaryUserInfoKey;
extern NSString* const GovernmentPansionUserInfoKey;
extern NSString* const GovernmentAveragePriceUserInfoKey;

@interface Government : NSObject

@property (assign, nonatomic) float taxLevel;
@property (assign, nonatomic) float salary;
@property (assign, nonatomic) float pansion;
@property (assign, nonatomic) float averagePrice;

@end
