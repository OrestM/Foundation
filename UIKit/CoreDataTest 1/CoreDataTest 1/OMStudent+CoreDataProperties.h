//
//  OMStudent+CoreDataProperties.h
//  CoreDataTest 1
//
//  Created by Admin on 3/20/16.
//  Copyright © 2016 Admin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "OMStudent.h"

NS_ASSUME_NONNULL_BEGIN

@interface OMStudent (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *dateBirthd;
@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSNumber *score;

@end

NS_ASSUME_NONNULL_END
