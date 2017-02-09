//
//  OMUniversityViewController.m
//  CoreDataTest2
//
//  Created by Admin on 3/24/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMUniversitiesViewController.h"
#import "OMCoreDataManager.h"
#import "OMUniversity.h"
#import "OMCoursesViewController.h"
#import "OMCourse.h"
#import "OMStudent.h"
#import "OMCar.h"
#import "Header.h"

@interface OMUniversitiesViewController () <NSFetchedResultsControllerDelegate>

@end

@implementation OMUniversitiesViewController

@synthesize fetchedResultsController = _fetchedResultsController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(actionEdit:)];
    self.navigationItem.leftBarButtonItem = editButton;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.navigationItem.title = @"University";
}

- (OMCourse *)addCourseWithName:(NSString *)name; {
    
    OMCourse *course =
    [NSEntityDescription insertNewObjectForEntityForName:@"OMCourse" inManagedObjectContext:self.managedObjectContext];
    
    course.name = name;
    
    return course;
    
}

- (OMUniversity *)addUniversity {
    
    OMUniversity *university =
    [NSEntityDescription insertNewObjectForEntityForName:@"OMUniversity" inManagedObjectContext:self.managedObjectContext];
    
    university.name = universityName[arc4random_uniform(3)];
    
    return university;
    
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

- (void)actionEdit:(id)sender {
    
    BOOL isEditing = self.tableView.editing;
    
    [self.tableView setEditing:!isEditing animated:YES];
    UIBarButtonSystemItem item = UIBarButtonSystemItemEdit;
    
    if (self.tableView.editing) {
        item = UIBarButtonSystemItemDone;
    }
    
}

- (void)insertNewObject:(id)sender {
    
    NSError *error = nil;
    
    NSArray *courses = @[[self addCourseWithName:@"iOS"],
                         [self addCourseWithName:@"Android"],
                         [self addCourseWithName:@"Javascript"],
                         [self addCourseWithName:@"Python"],
                         [self addCourseWithName:@"HTML"]];
    
    OMUniversity *university = [self addUniversity];
    
    [university addCourses:[NSSet setWithArray:courses]];
    
    for (int i = 0; i < 30; i++) {
        
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
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"OMUniversity" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[nameDescriptor]];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsController;
}

#pragma mark - UITableViewDataSource

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    OMUniversity *university = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = university.name;
    cell.detailTextLabel.text = nil;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    OMUniversity *university = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    OMCoursesViewController *vc = [[OMCoursesViewController alloc] init];
    vc.university = university;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
