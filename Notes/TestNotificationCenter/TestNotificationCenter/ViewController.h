//
//  ViewController.h
//  TestNotificationCenter
//
//  Created by Admin on 6/13/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString* const textFieldNotification;
extern NSString* const textFieldNotificationKey;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *getTextFromTextField;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)textField:(UITextField *)sender;

@end

