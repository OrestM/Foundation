//
//  Student.h
//  BitwiseOperations
//
//  Created by Admin on 2/22/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    StudentSubjectTypeBiology      = 1 << 0,
    StudentSubjectTypeMath         = 1 << 1,
    StudentSubjectTypeDevelopment  = 1 << 2,
    StudentSubjectTypeArt          = 1 << 3,
    StudentSubjectTypeEngineering  = 1 << 4,
    StudentSubjectTypeGeography    = 1 << 5,
    StudentSubjectTypeHistory      = 1 << 6
    
} StudentSubjectType;

@interface Student : NSObject

@property (assign, nonatomic) StudentSubjectType subjectType;

/*
@property (assign, nonatomic) BOOL studiesBiology;
@property (assign, nonatomic) BOOL studiesMath;
@property (assign, nonatomic) BOOL studiesDevelopment;
@property (assign, nonatomic) BOOL studiesArt;
@property (assign, nonatomic) BOOL studiesEngineering;
@property (assign, nonatomic) BOOL studiesGeography;
@property (assign, nonatomic) BOOL studiesHistory;
*/

@end
