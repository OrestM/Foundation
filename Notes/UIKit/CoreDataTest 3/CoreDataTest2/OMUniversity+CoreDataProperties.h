//
//  OMUniversity+CoreDataProperties.h
//  CoreDataTest2
//
//  Created by Admin on 3/22/16.
//  Copyright © 2016 Admin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "OMUniversity.h"

@class OMStudent, OMCourse;

NS_ASSUME_NONNULL_BEGIN

@interface OMUniversity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<OMStudent *> *students;
@property (nullable, nonatomic, retain) NSSet<OMCourse *> *courses;

@end

@interface OMUniversity (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(OMStudent *)value;
- (void)removeStudentsObject:(OMStudent *)value;
- (void)addStudents:(NSSet<OMStudent *> *)values;
- (void)removeStudents:(NSSet<OMStudent *> *)values;

- (void)addCoursesObject:(OMCourse *)value;
- (void)removeCoursesObject:(OMCourse *)value;
- (void)addCourses:(NSSet<OMCourse *> *)values;
- (void)removeCourses:(NSSet<OMCourse *> *)values;

@end

NS_ASSUME_NONNULL_END
