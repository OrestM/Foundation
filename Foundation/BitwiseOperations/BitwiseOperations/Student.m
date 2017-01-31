//
//  Student.m
//  BitwiseOperations
//
//  Created by Admin on 2/22/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Student.h"

@implementation Student

- (NSString*)answerByType:(StudentSubjectType)type {
    return self.subjectType & type ? @"yes" : @"no";
}

- (NSString*)description {
    
    return [NSString stringWithFormat:@"Student studies:\n"
                                        @"biology = %@\n"
                                        @"math = %@\n"
                                        @"development = %@\n"
                                        @"art = %@\n"
                                        @"engineering = %@\n"
                                        @"geographic = %@\n"
                                        @"history = %@",
                                        [self answerByType:StudentSubjectTypeBiology],
                                        [self answerByType:StudentSubjectTypeMath],
                                        [self answerByType:StudentSubjectTypeDevelopment],
                                        [self answerByType:StudentSubjectTypeArt],
                                        [self answerByType:StudentSubjectTypeEngineering],
                                        [self answerByType:StudentSubjectTypeGeography],
                                        [self answerByType:StudentSubjectTypeHistory]];
    
}

@end
