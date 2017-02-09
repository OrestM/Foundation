//
//  ViewController.m
//  Calculator
//
//  Created by Admin on 2/29/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

enum {
    OP_PLUS  = 101,
    OP_MINUS = 102,
    OP_MULT  = 103,
    OP_DIV   = 104
};

@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clear:(UIButton*)sender {
    x = 0;
    
    [self calcScrean];
}

- (IBAction)clearAll:(UIButton*)sender {
    x = 0;
    y = 0;
    
    enterFlag = NO;
    yFlag = NO;
    
    [self calcScrean];
}

- (IBAction)digit:(UIButton*)sender {
    
    if (enterFlag) {
        y = x;
        x = 0;
        enterFlag = NO;
    }
    
    x = (10.0f * x) + sender.tag;
    
    [self calcScrean];
}

- (IBAction)operation:(UIButton*)sender {
    
    if (yFlag && !enterFlag) {
        
        switch (operation) {
            case OP_PLUS:
                x = y + x;
                break;
                
            case OP_MINUS:
                x = y - x;
                break;
                
            case OP_MULT:
                x = y * x;
                break;
                
            case OP_DIV:
                x = y / x;
                break;
                
            default:
                break;
        }
        
    }
    
    y = x;
    enterFlag = YES;
    yFlag = YES;
    operation = sender.tag;
    
    [self calcScrean];
}

- (IBAction)inverseSign:(UIButton*)sender {
    x = -x;
    
    [self calcScrean];
}

- (void)calcScrean {
    NSString* str = [NSString stringWithFormat:@"%g", x];
    self.displayLabel.text = str;
}

@end
