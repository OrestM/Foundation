//
//  Student.h
//  Protocol
//
//  Created by Admin on 2/2/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hospital.h"

@interface Student : NSObject <Patient>

@property (strong, nonatomic) NSString* universityName;
@property (strong, nonatomic) NSString* name;

- (void)study;

@end
