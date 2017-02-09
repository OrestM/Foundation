//
//  OMStudentsViewController.m
//  CoreDataTest2
//
//  Created by Admin on 3/25/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMStudentsViewController.h"
#import "OMStudent.h"
#import "OMCourse.h"
#import "OMUniversity.h"
#import "OMCar.h"
#import "Header.h"

@interface OMStudentsViewController () <NSFetchedResultsControllerDelegate>

@end

@implementation OMStudentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.navigationItem.title = @"Students";
}

- (OMCar *)addRandomCar {
    
    OMCar *car =
    [NSEntityDescription insertNewObjectForEntityForName:@"OMCar" inManagedObjectContext:self.managedObjectContext];
    
    car.model = carModelNames[arc4random_uniform(5)];
    
    return car;
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

- (void)insertNewObject:(id)sender {
    
    NSError *error = nil;
    
    OMStudent *student = [self addRandomStudent];
    
    student.university.courses = [NSSet setWithObject:self.course];
    
    [self.course addStudentsObject:student];
    
    if ([self.managedObjectContext save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
}

@synthesize fetchedResultsController = _fetchedResultsController;

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"OMStudent" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *firstNameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    NSSortDescriptor *lastNameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[firstNameDescriptor, lastNameDescriptor]];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"courses contains %@", self.course];
    
    [fetchRequest setPredicate:predicate];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"university.name" cacheName:nil];
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

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo name];
    
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
        OMStudent *student = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.2f", [student.score floatValue]];
    
}

@end
