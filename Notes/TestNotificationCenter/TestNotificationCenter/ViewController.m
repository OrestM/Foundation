//
//  ViewController.m
//  TestNotificationCenter
//
//  Created by Admin on 6/13/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

NSString* const textFieldNotification = @"textFieldNotification";
NSString* const textFieldNotificationKey = @"textFieldNotificationKey";

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getText) name:textFieldNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getText:) name:textFieldNotification object:nil];
    
}

/*
- (void)getText {
    
    _getTextFromTextField.text = _textField.text;
    
}
*/
 
- (void)getText:(NSNotification *)notification {
    
    _getTextFromTextField.text = notification.object;
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textField:(UITextField *)sender {
    
//    _textField = sender;
//    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:sender.text forKey:textFieldNotificationKey];
//    [[NSNotificationCenter defaultCenter] postNotificationName:textFieldNotification object:dictionary];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:textFieldNotification object:sender.text];
    
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
    
}

@end
