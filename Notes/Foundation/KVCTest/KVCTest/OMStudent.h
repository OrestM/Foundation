//
//  OMStudent.h
//  KVCTest
//
//  Created by Admin on 3/18/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OMStudent : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;

- (void)changeName;

@end
