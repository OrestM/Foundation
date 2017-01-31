//
//  OMNotesTableViewController.m
//  NotesApp
//
//  Created by Admin on 4/8/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMNotesTableViewController.h"

@interface OMNotesTableViewController ()

@property (strong, nonatomic) NSMutableArray *notes;

@end

static NSString *identifier = @"cell";

@implementation OMNotesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.notes = [[NSMutableArray alloc] init];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.notes.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        
    }
    
    OMNote *note = self.notes[indexPath.row];
    cell.textLabel.text = note.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [self.notes removeObject:self.notes[indexPath.row]];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    OMNoteViewController *vc = [segue destinationViewController];
    
    if ([segue.identifier isEqualToString:@"addNoteSeque"]) {
        
        vc.editing = NO;
        
    } else if ([segue.identifier isEqualToString:@"editNoteSeque"]){
        
        vc.editing = YES;
        vc.note = self.notes[self.tableView.indexPathForSelectedRow.row];
        
    }
    
    vc.delegate = self;
    
}

#pragma mark - OMNoteViewControllerDelegate

- (void)noteViewController:(OMNoteViewController *)viewController didCreateNote:(OMNote *)note {
    
    if (note != nil) {
        
        [self.notes addObject:note];
        [self.tableView reloadData];
        
    }
    
}

- (void)noteViewController:(OMNoteViewController *)viewController didUpdateNote:(OMNote *)note {
    
    [self.tableView reloadData];
    
}

@end
