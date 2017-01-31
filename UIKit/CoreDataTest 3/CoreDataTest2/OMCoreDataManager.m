//
//  OMCoreDataManager.m
//  CoreDataTest2
//
//  Created by Admin on 3/23/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMCoreDataManager.h"
#import "OMStudent+CoreDataProperties.h"
#import "OMCar+CoreDataProperties.h"
#import "OMUniversity+CoreDataProperties.h"
#import "OMCourse+CoreDataProperties.h"

static NSString *firstNames[] = {
    @"Tran", @"Lenore", @"Bud", @"Fredda", @"Katrice",
    @"Clyde", @"Hildegard", @"Vernell", @"Nellie", @"Rupert",
    @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
    @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna",
    @"Eufemia", @"Britteny", @"Ramon", @"Jacque", @"Telma",
    @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa",
    @"Willard", @"Mireille", @"Roma", @"Elise", @"Trang",
    @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla",
    @"Whitney", @"Denver", @"Norbert", @"Meghan", @"Tandra",
    @"Jenise", @"Brent", @"Elenor", @"Sha", @"Jessie"
};

static NSString *lastNames[] = {
    @"Farrah", @"Laviolette", @"Heal", @"Sechrest", @"Roots",
    @"Homan", @"Starns", @"Oldham", @"Yocum", @"Mancia",
    @"Prill", @"Lush", @"Piedra", @"Castenada", @"Warnock",
    @"Vanderlinden", @"Simms", @"Gilroy", @"Brann", @"Bodden",
    @"Lenz", @"Gildersleeve", @"Wimbish", @"Bello", @"Beachy",
    @"Jurado", @"William", @"Beaupre", @"Dyal", @"Doiron",
    @"Plourde", @"Bator", @"Krause", @"Odriscoll", @"Corby",
    @"Waltman", @"Michaud", @"Kobayashi", @"Sherrick", @"Woolfolk",
    @"Holladay", @"Hornback", @"Moler", @"Bowles", @"Libbey",
    @"Spano", @"Folson", @"Arguelles", @"Burke", @"Rook"
};

static NSString *carModelNames[] = {
    @"Dodge", @"Chevrole", @"Toyota", @"Citroen", @"Reno"
};

static NSString *universityName[] = {
    @"LNU", @"Garvard", @"Stanford"
};

@implementation OMCoreDataManager

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (OMCoreDataManager *)sharedManager {
    
    static OMCoreDataManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[OMCoreDataManager alloc] init];
    });
    
    return manager;
}

- (OMStudent *)addRandomStudent {
    
    OMStudent *student =
    [NSEntityDescription insertNewObjectForEntityForName:@"OMStudent" inManagedObjectContext:self.managedObjectContext];
    
    student.score = @((CGFloat)arc4random_uniform(201) / 100.f + 2.f);
    student.dateBirthd = [NSDate dateWithTimeIntervalSince1970:60 * 60 * 24 * 365 * arc4random_uniform(31)];
    student.firstName = firstNames[arc4random_uniform(50)];
    student.lastName = lastNames[arc4random_uniform(50)];
    
    return student;
}

- (OMCar *)addRandomCar {
    
    OMCar *car =
    [NSEntityDescription insertNewObjectForEntityForName:@"OMCar" inManagedObjectContext:self.managedObjectContext];
    
    car.model = carModelNames[arc4random_uniform(5)];
    
    return car;
}

- (OMUniversity *)addUniversity {
    
    OMUniversity *university =
    [NSEntityDescription insertNewObjectForEntityForName:@"OMUniversity" inManagedObjectContext:self.managedObjectContext];
    
    university.name = @"LNU";
    
    return university;
    
}

- (OMCourse *)addCourseWithName:(NSString *)name; {
    
    OMCourse *course =
    [NSEntityDescription insertNewObjectForEntityForName:@"OMCourse" inManagedObjectContext:self.managedObjectContext];
    
    course.name = name;
    
    return course;
    
}

- (NSArray *)allObjects {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *description = [NSEntityDescription entityForName:@"OMObject" inManagedObjectContext:self.managedObjectContext];
    
    [request setEntity:description];
    
    NSError *requestError = nil;
    
    NSArray *resultArray = [self.managedObjectContext executeFetchRequest:request error:&requestError];
    
    if (requestError) {
        NSLog(@"%@", [requestError localizedDescription]);
    }
    return resultArray;
    
    
}

- (void)printArray:(NSArray *)array {
    
    for (id object in array) {
        
        if ([object isKindOfClass:[OMCar class]]) {
            OMCar *car = (OMCar *)object;
            NSLog(@"Car: %@, Owner: %@ %@", car.model, car.owner.firstName, car.owner.lastName);
        } else if ([object isKindOfClass:[OMStudent class]]) {
            OMStudent *student = (OMStudent *)object;
            NSLog(@"Student: %@ %@, Score: %1.2f, Courses: %d",
                  student.firstName, student.lastName, [student.score floatValue], [student.courses count]);
        } else if ([object isKindOfClass:[OMUniversity class]]) {
            OMUniversity *university = (OMUniversity *)object;
            NSLog(@"University: %@, Students: %d", university.name, [university.students count]);
        } else if ([object isKindOfClass:[OMCourse class]]) {
            OMCourse *course = (OMCourse *)object;
            NSLog(@"Courses: %@, Students: %d", course.name, [course.students count]);
        }
        
    }
    
    NSLog(@"Count = %d", [array count]);
    
}

- (void)printAllObjects {
    
    NSArray *allObjects = [self allObjects];
    
    [self printArray:allObjects];
    
}

- (void)deleteAllObjects {
    
    NSArray *allObjects = [self allObjects];
    
    for (id object in allObjects) {
        [self.managedObjectContext deleteObject:object];
    }
    
    [self.managedObjectContext save:nil];
    
}

- (void)generateAddUniversity {
     
     NSError *error = nil;
     
     NSArray *courses = @[[self addCourseWithName:@"iOS"],
     [self addCourseWithName:@"Android"],
     [self addCourseWithName:@"Javascript"],
     [self addCourseWithName:@"Python"],
     [self addCourseWithName:@"HTML"]];
     
     OMUniversity *university = [self addUniversity];
     
     [university addCourses:[NSSet setWithArray:courses]];
     
     for (int i = 0; i < 100; i++) {
     
     OMStudent *student = [self addRandomStudent];
     
     if (arc4random_uniform(1000) < 500) {
     OMCar *car = [self addRandomCar];
     student.car = car;
     }
     
     student.university = university;
     
     NSInteger number = arc4random_uniform(5) + 1;
     
     while ([student.courses count] < number) {
         OMCourse *course = [courses objectAtIndex:arc4random_uniform(5)];
         if (![student.courses containsObject:course]) {
             [student addCoursesObject:course];
         }
     }
     
     }
     
     if (![self.managedObjectContext save:&error]) {
     NSLog(@"%@", [error localizedDescription]);
     }
    
    
    //    [self deleteAllObjects];
    
    //    [self printAllObjects];
    /*
     NSFetchRequest *request = [[NSFetchRequest alloc] init];
     
     NSEntityDescription *description =
     [NSEntityDescription entityForName:@"OMCourse" inManagedObjectContext:self.managedObjectContext];
     
     [request setEntity:description];
     //    [request setRelationshipKeyPathsForPrefetching:@[@"courses"]];
     //    [request setFetchBatchSize:20];
     //    [request setFetchLimit:35];
     */
    /*
     NSSortDescriptor *firstNameDescriptor =
     [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
     
     NSSortDescriptor *lastNameDescriptor =
     [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
     
     [request setSortDescriptors:@[firstNameDescriptor, lastNameDescriptor]];
     */
    /*
     NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
     
     [request setSortDescriptors:@[nameDescriptor]];
     */
    /*
     NSArray *validNames = @[@"Tracy", @"Vanetta", @"Savanna"];
     
     NSPredicate *predicate = [NSPredicate predicateWithFormat:
     @"score > %f AND"
     " courses.@count >= %d AND"
     " firstName IN %@", 3.0, 3, validNames];
     */
    
    //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"@avg.students.score > %f", 2.9];
    /*
     NSPredicate *predicate =
     [NSPredicate predicateWithFormat:@"SUBQUERY(students, $student, $student.car.model = %@).@count >= %d", @"Chevrole", 5];
     
     [request setPredicate:predicate];
     */
    /*
     NSFetchRequest *request = [[self.managedObjectModel fetchRequestTemplateForName:@"FetchStudents"] copy];
     
     NSArray *resultArray = [self.managedObjectContext executeFetchRequest:request error:nil];
     
     NSSortDescriptor *firstNameDescriptor =
     [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
     
     NSSortDescriptor *lastNameDescriptor =
     [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
     
     [request setSortDescriptors:@[firstNameDescriptor, lastNameDescriptor]];
     
     [self printArray:resultArray];
     */
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *description =
    [NSEntityDescription entityForName:@"OMCourse" inManagedObjectContext:self.managedObjectContext];
    
    [request setEntity:description];
    
    NSArray *resultArray = [self.managedObjectContext executeFetchRequest:request error:nil];
    
    for (OMCourse *course in resultArray) {
        NSLog(@"Course name: %@", course.name);
        NSLog(@"Best Students:");
        [self printArray:course.bestStudents];
    }
}

#pragma mark - Core Data stack

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.orestm.CoreDataTest2" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataTest2" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreDataTest2.sqlite"];
    NSError *error = nil;
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
        
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
