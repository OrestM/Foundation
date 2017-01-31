//
//  ViewController.m
//  UIView
//
//  Created by Admin on 2/8/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)randomZeroToOne {
    return (CGFloat)(arc4random() % 256) / 255;
}

- (UIColor*)randomColor {
    CGFloat r = [self randomZeroToOne];
    CGFloat g = [self randomZeroToOne];
    CGFloat b = [self randomZeroToOne];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

- (void)viewDidLayoutSubviews {
//    self.testViewCollections.backgroundColor = [self randomColor];
    for (UIView* view in self.testViewCollections) {
        view.backgroundColor = [self randomColor];
    }
}

@end
