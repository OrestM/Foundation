//
//  OMCar+CoreDataProperties.h
//  CoreDataTest2
//
//  Created by Admin on 3/21/16.
//  Copyright © 2016 Admin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "OMCar.h"

NS_ASSUME_NONNULL_BEGIN

@interface OMCar (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *model;
@property (nullable, nonatomic, retain) OMStudent *owner;

@end

NS_ASSUME_NONNULL_END
