//
//  OMStudent.h
//  MultiThreading
//
//  Created by Admin on 6/6/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OMStudent : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger randomNumber;

- (id)initWithName:(NSString *)name;

- (void)guessTheNumber:(NSInteger)number;

@end
