//
//  Developer.h
//  Protocol
//
//  Created by Admin on 2/2/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hospital.h"

@interface Developer : NSObject <Patient>

@property (assign, nonatomic) float expirience;
@property (strong, nonatomic) NSString* name;

- (void)work;

@end
