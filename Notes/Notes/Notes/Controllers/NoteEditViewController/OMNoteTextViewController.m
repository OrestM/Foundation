//
//  OMNoteTextViewController.m
//  Notes
//
//  Created by Admin on 4/28/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMNoteTextViewController.h"
#import "OMCoreDataManager.h"

@interface OMNoteTextViewController () <UITextViewDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) UIAlertController *alert;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation OMNoteTextViewController

- (NSManagedObjectContext *)managedObjectContext {
    
    if (!_managedObjectContext) {
        _managedObjectContext = [[OMCoreDataManager sharedManager] managedObjectContext];
    }
    
    return  _managedObjectContext;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.note) {
        
        [self.textView setText:[self.note valueForKey:@"text"]];
        
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self setupAlert];
}

#pragma mark - Private method

- (void)saveContext {
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
}

- (void)setupAlert {
    
    self.alert = [UIAlertController alertControllerWithTitle:@"Press save"
                                                     message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionSave = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
        
        self.managedObjectContext = [self managedObjectContext];
        
        // Create a new note
        NSManagedObject *newNote = [NSEntityDescription insertNewObjectForEntityForName:@"Note"
                                                                 inManagedObjectContext:self.managedObjectContext];
        if ([self.alert.textFields[0].text isEqualToString:@""]) {
            [newNote setValue:self.textView.text forKey:@"text"];
            [newNote setValue:@"Note" forKey:@"name"];
        } else {
            [newNote setValue:self.textView.text forKey:@"text"];
            [newNote setValue:self.alert.textFields[0].text forKey:@"name"];
        }
        
        [self saveContext];
        
        [self.navigationController popViewControllerAnimated:YES];

    }];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [self.alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = @"Enter note name";
        
    }];
    
    [actionCancel setValue:[UIColor redColor] forKey:@"titleTextColor"];
    [actionSave setValue:[UIColor greenColor] forKey:@"titleTextColor"];
    
    [self.alert addAction:actionSave];
    [self.alert addAction:actionCancel];

}

#pragma mark - Actions

- (IBAction)save:(UIBarButtonItem *)sender {
    
    if (self.note) {
        // Update existing note
        [self.note setValue:self.textView.text forKey:@"text"];
        [self saveContext];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        UIViewController *top = [UIApplication sharedApplication].keyWindow.rootViewController;
        [top presentViewController:self.alert animated:YES completion:nil];
    }
    
}

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

@end
