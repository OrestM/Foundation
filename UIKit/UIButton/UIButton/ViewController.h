//
//  ViewController.h
//  UIButton
//
//  Created by Admin on 2/29/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)actionTest2:(UIButton *)sender;
- (IBAction)actionTouchDown:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *indicatorLabel;

@end

