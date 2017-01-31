//
//  ViewController.m
//  TextFieldTest1
//
//  Created by Admin on 3/3/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.firstNameField becomeFirstResponder];
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(notificationDidBeginEditingNotification:)
        name:UITextFieldTextDidBeginEditingNotification object:nil];
    [nc addObserver:self selector:@selector(notificationDidEndEditingNotification:)
               name:UITextFieldTextDidEndEditingNotification object:nil];
    [nc addObserver:self selector:@selector(notificationDidChangeNotification:)
               name:UITextFieldTextDidChangeNotification object:nil];
    
    /*
    self.firstNameField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.lastNameField.autocapitalizationType  = UITextAutocapitalizationTypeWords;
    
    self.firstNameField.returnKeyType = UIReturnKeyNext;
    self.lastNameField.returnKeyType = UIReturnKeyDone;
    */
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionEditingChanged:(UITextField *)sender {
    NSLog(@"%@", sender.text);
}

- (IBAction)actionLog:(id)sender {
    NSLog(@"First Name %@, Last Name %@", self.firstNameField.text, self.lastNameField.text);
    
    self.firstNameLabel.text = self.firstNameField.text;
    self.lastNameLabel.text = self.lastNameField.text;
    
    if ([self.firstNameField isFirstResponder]) {
        [self.firstNameField resignFirstResponder];
    } else if ([self.lastNameField isFirstResponder]) {
        [self.lastNameField resignFirstResponder];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.firstNameField]) {
        [self.lastNameField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark - Notification

- (void)notificationDidBeginEditingNotification:(NSNotification *)notification {
    NSLog(@"notificationDidBeginEditingNotification");
}

- (void)notificationDidEndEditingNotification:(NSNotification *)notification {
    NSLog(@"notificationDidEndEditingNotification");
}

- (void)notificationDidChangeNotification:(NSNotification *)notification {
    NSLog(@"notificationDidChangeNotification");
}

@end
