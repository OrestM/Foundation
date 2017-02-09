//
//  OMTestTableViewController.h
//  UITableViewStaticCell
//
//  Created by Admin on 3/5/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OMTestTableViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *levelSegmentControl;
@property (weak, nonatomic) IBOutlet UISwitch *enableSwitch;

@property (weak, nonatomic) IBOutlet UISlider *soundSlider;
@property (weak, nonatomic) IBOutlet UISlider *musicSlider;

- (IBAction)actionTextChange:(UITextField *)sender;
- (IBAction)actionValueChange:(id)sender;

@end
