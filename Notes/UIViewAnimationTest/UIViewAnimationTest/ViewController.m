//
//  ViewController.m
//  UIViewAnimationTest
//
//  Created by Admin on 4/20/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    for (UIView *view in _animationView) {
        
        [self animate:view];
        
    }
    
}

- (void)animate:(UIView *)view {
    
    __weak UIView *_view = view; //Need to weak refence in block, because if not want to retain circle
    
    CGFloat r = (CGFloat)arc4random_uniform(M_PI*2*10000) / 10000 - M_PI;
    
    CGFloat d = (CGFloat)(arc4random_uniform(20001)) / 10000 + 2;
    
    [UIView animateWithDuration:d delay:0.1f
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear | UIViewAnimationOptionBeginFromCurrentState
     
                     animations:^{
                         
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(r);
                         
                         view.transform = rotation;
        
        
    } completion:^(BOOL finished) {
        
        [self animate:_view];
        
    }];
    
}

- (void)showMessage:(NSString *)message withTitle:(NSString *)title {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK!" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - Toches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    CGPoint pointOnView = [touch locationInView:self.view];
    
    for (UIView *view in self.animationView) {
        
        if ([view.layer.presentationLayer hitTest:pointOnView]) {
            
            [self showMessage:@"Press OK!" withTitle:@"Animation test"];
            
        }
    }
}

@end
