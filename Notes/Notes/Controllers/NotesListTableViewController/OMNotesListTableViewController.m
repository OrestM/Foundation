//
//  OMNotesListTableViewController.m
//  Notes
//
//  Created by Admin on 4/28/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMNotesListTableViewController.h"
#import "OMNoteTextViewController.h"
#import "OMCoreDataManager.h"

@interface OMNotesListTableViewController () 

@property (weak, nonatomic) IBOutlet UIBarButtonItem *itemEdit;
@property (strong, nonatomic) NSMutableArray *notes;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

static NSString *identifier = @"cell";

@implementation OMNotesListTableViewController

- (NSManagedObjectContext *)managedObjectContext {
    if (!_managedObjectContext) {
        _managedObjectContext = [[OMCoreDataManager sharedManager] managedObjectContext];
    }
    
    return  _managedObjectContext;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Fetch the notes from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Note"];
    self.notes = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.tableView reloadData];
    
}

#pragma mark - Action

- (IBAction)actionEdit:(UIBarButtonItem *)sender {
    
    BOOL isEditing = self.tableView.editing;
    
    [self.tableView setEditing:!isEditing animated:YES];
    
    if (self.tableView.editing) {
        
        self.itemEdit =  UIBarButtonSystemItemDone;
        
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.notes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        
    // Configure the cell...
    NSManagedObject *note = [self.notes objectAtIndex:indexPath.row];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@", [note valueForKey:@"name"]]];
    
    NSString *subTitle = [NSString stringWithFormat:@"%@", [note valueForKey:@"name"]];
    const int cutLenght = 3;
    
    if (subTitle.length > cutLenght) {
        
        subTitle = [NSString stringWithFormat:@"%@...", [subTitle substringToIndex:cutLenght]];
        cell.detailTextLabel.text = subTitle;
        
    } else {
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [note valueForKey:@"name"]];
        
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete object from database
        [context deleteObject:[self.notes objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        // Remove note from table view
        [self.notes removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - UITableViewDelegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"editTextSegue"]) {
        
        NSManagedObject *selectedNote = self.notes[self.tableView.indexPathForSelectedRow.row];
        OMNoteTextViewController *vc = segue.destinationViewController;
        vc.note = selectedNote;
        
    }
    
}

@end
