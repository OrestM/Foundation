//
//  OMAbonement.h
//  AbonementApp
//
//  Created by Admin on 4/23/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OMAbonement : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *surname;
@property (assign, nonatomic) NSInteger phoneNumber;
@property (strong, nonatomic) UIImage *photo;
@property (copy, nonatomic) NSString *address;
@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) NSInteger dateOfBirth;

@end
