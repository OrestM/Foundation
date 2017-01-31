//
//  OMStudent.h
//  UITableViewEditPart-1
//
//  Created by Admin on 3/7/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OMStudent : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) float averageGrade;

+ (OMStudent *) randomStudent;

@end
