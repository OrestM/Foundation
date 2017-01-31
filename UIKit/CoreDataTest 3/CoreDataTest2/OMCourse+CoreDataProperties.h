//
//  OMCourse+CoreDataProperties.h
//  CoreDataTest2
//
//  Created by Admin on 3/22/16.
//  Copyright © 2016 Admin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "OMCourse.h"

NS_ASSUME_NONNULL_BEGIN

@interface OMCourse (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) OMUniversity *university;
@property (nullable, nonatomic, retain) NSSet<OMStudent *> *students;
@property (nullable, nonatomic, retain) NSArray *bestStudents;

@end

@interface OMCourse (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(OMStudent *)value;
- (void)removeStudentsObject:(OMStudent *)value;
- (void)addStudents:(NSSet<OMStudent *> *)values;
- (void)removeStudents:(NSSet<OMStudent *> *)values;

@end

NS_ASSUME_NONNULL_END
