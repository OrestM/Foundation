//
//  ViewController.h
//  Calculator
//
//  Created by Admin on 2/29/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    double x, y;
    NSInteger operation;
    BOOL enterFlag;
    BOOL yFlag;
}

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

- (IBAction)clear:(UIButton*)sender;
- (IBAction)clearAll:(UIButton*)sender;

- (IBAction)digit:(UIButton*)sender;
- (IBAction)operation:(UIButton*)sender;

- (IBAction)inverseSign:(UIButton*)sender;

@end

