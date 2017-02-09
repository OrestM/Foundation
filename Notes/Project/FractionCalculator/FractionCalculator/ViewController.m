//
//  ViewController.m
//  FractionCalculator
//
//  Created by Admin on 6/21/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"
#import "OMCalculator.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize display, displayString;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    firstOperand = YES;
    isNumerator = YES;
    self.displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [OMCalculator new];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)proccesDigit:(NSInteger) digit {
    
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%li", digit]];
    [display setText:displayString];
    
}

- (IBAction)clickDigit:(UIButton *)sender {
    
    NSInteger digit = sender.tag;
    
    [self proccesDigit:digit];
}

- (void)proccesOp:(char)theOp {
    
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @"+";
            break;
            
        case '-':
            opStr = @"-";
            break;
        
        case '*':
            opStr = @"*";
            break;
            
        case '/':
            opStr = @"/";
            break;
            
        default:
            break;
    }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString:opStr];
    [display setText:displayString];
    
}

- (void)storeFracPart {
    
    if (firstOperand) {
        
        if (isNumerator) {
            
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denumirator = 1;
            
        } else {
            
            myCalculator.operand1.denumirator = currentNumber;
            
        }
        
    }
    
    else if (isNumerator) {
        
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denumirator = 1;
        
    } else {
        
        myCalculator.operand2.denumirator = currentNumber;
        firstOperand = YES;
        
    }
    
    currentNumber = 0;
    
}

- (IBAction)clickOver:(id)sender {
    
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    [display setText:displayString];
    
}

- (IBAction)clickPlus:(id)sender {
    
    [self proccesOp:'+'];
    
}

- (IBAction)clickMinus:(id)sender {
    
    [self proccesOp:'-'];
    
}

- (IBAction)clickMultiply:(id)sender {
    
    [self proccesOp:'*'];
    
}

- (IBAction)clickDivide:(id)sender {
    
    [self proccesOp:'/'];
    
}

- (IBAction)clickEquals:(id)sender {
    
    [self storeFracPart];
    [myCalculator performOperation:op];
    [displayString appendString:@" = "];
    [displayString appendString:[myCalculator.accumulator convertToString]];
    [display setText:displayString];
    
    currentNumber = 0;
    isNumerator = YES;
    firstOperand = YES;
    [displayString setString:@""];
    
}

- (IBAction)clickClear:(id)sender {
    
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString appendString:@""];
    [display setText:displayString];
    
}

@end
