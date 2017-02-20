//
//  ViewController.m
//  TestBlock
//
//  Created by Admin on 6/6/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"
#import "OMTestClass.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)name:(id)sender {
    
    OMTestClass *test = [[OMTestClass alloc] init];
    
    [test getText:^(NSString *text) {
        self.textField.text = [NSString stringWithFormat:@"%@ %@", text, self.textField.text];
    }];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passTxt" object:self.textField.text];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
    
}

@end
