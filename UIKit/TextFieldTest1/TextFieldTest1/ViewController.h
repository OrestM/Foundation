//
//  ViewController.h
//  TextFieldTest1
//
//  Created by Admin on 3/3/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;

- (IBAction)actionEditingChanged:(UITextField *)sender;
- (IBAction)actionLog:(id)sender;

@end

