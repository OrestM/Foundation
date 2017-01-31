//
//  ViewController.h
//  FractionCalculator
//
//  Created by Admin on 6/21/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OMCalculator;

@interface ViewController : UIViewController {
    
    UILabel *display;
    char op;
    NSInteger currentNumber;
    NSMutableString *displayString;
    BOOL firstOperand, isNumerator;
    OMCalculator *myCalculator;
    
}

@property (strong, nonatomic) IBOutlet UILabel *display;
@property (strong, nonatomic) NSMutableString *displayString;

- (void)proccesDigit:(NSInteger) digit;
- (void)proccesOp:(char)op;
- (void)storeFracPart;

//Number key
- (IBAction)clickDigit:(id)sender;

//Number arifmetic operation
- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickMultiply:(id)sender;
- (IBAction)clickDivide:(id)sender;

//Other key
- (IBAction)clickOver:(id)sender;
- (IBAction)clickEquals:(id)sender;
- (IBAction)clickClear:(id)sender;

@end

