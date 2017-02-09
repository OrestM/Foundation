//
//  ViewController.h
//  UIPopoverTet
//
//  Created by Admin on 3/15/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addBarButton;

- (IBAction)actionAdd:(UIBarButtonItem *)sender;
- (IBAction)actionPressMe:(UIButton *)sender;

@end

