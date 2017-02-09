//
//  ViewController.m
//  UIViewTestAnimation
//
//  Created by Admin on 2/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView* testView;

//@property (weak, nonatomic) UIImageView* testImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    UIImageView* view = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    view.backgroundColor = [UIColor clearColor];
    /*
    UIImage* image1 = [UIImage imageNamed:@"pic1.png"];
    UIImage* image2 = [UIImage imageNamed:@"pic2.png"];
    UIImage* image3 = [UIImage imageNamed:@"pic3.png"];
    
    NSArray* images = [NSArray arrayWithObjects:image1, image2, image1, image3, nil];
    
    view.animationImages = images;
    view.animationDuration = 1.f;
    [view startAnimating];
    */
    [self.view addSubview:view];
    
    self.testView = view;
//    self.testImageView = view;
}

- (UIColor*)randomColor {
    CGFloat r = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat g = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat b = (CGFloat)(arc4random() % 256) / 255.f;

    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

- (void)moveView:(UIView*)view {
    /*
     [UIView animateWithDuration:5
     animations:^{
     self.testView.center = CGPointMake(CGRectGetWidth(self.view.bounds) - (CGRectGetWidth(self.testView.frame) / 2), 150);
     }];
     */
    
    CGRect rect = self.view.bounds;
    
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    
    CGFloat x = arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMinX(rect);
    CGFloat y = arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMinY(rect);
    
    CGFloat s = (CGFloat)(arc4random() % 151) / 100.f + 0.5f;
    
    CGFloat r = (CGFloat)(arc4random() % (int)(M_PI*2*10000)) / 10000 - M_PI;
    
    CGFloat d = (CGFloat)(arc4random() % 20001) / 10000 + 2;
    
    [UIView animateWithDuration:d
                          delay:1
                        options:UIViewAnimationOptionCurveLinear /*| UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse*/
                     animations:^{
                         view.center = CGPointMake(x, y);
                         view.backgroundColor = [self randomColor];
                         
                         CGAffineTransform scale = CGAffineTransformMakeScale(s, s);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(r);
                         
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         
                         view.transform = transform;
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"Animation finish %d", finished);
                         NSLog(@"\nView frame: %@\nView bounds: %@", NSStringFromCGRect(view.frame), NSStringFromCGRect(view.bounds));
                         
                         __weak UIView* viewMove = view;
                         [self moveView:viewMove];
                     }];
    
    /*
     double delayInSeconds = 6;
     dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
     dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
     [self.testView.layer removeAllAnimations];
     
     [UIView animateWithDuration:4
     delay:0
     options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
     animations:^{
     self.testView.center = CGPointMake(500, 500);
     }
     completion:^(BOOL finished) {
     NSLog(@"Animation finish %d", finished);
     }];
     });
     */
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self moveView:self.testView];
//    [self moveView:self.testImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
