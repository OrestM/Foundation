//
//  ViewController.m
//  Gestore
//
//  Created by Admin on 11/29/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController 

@synthesize tapGestore;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - gestore Action

- (IBAction)tapGestore:(UITapGestureRecognizer *)recognizer {
    
        [UIView animateWithDuration:1.0 animations:^ {
            [tapGestore setCenter:CGPointMake(200, 310)];
            [tapGestore setBackgroundColor:[UIColor orangeColor]];
        }];
    
}

- (IBAction)rotateGestore:(UIRotationGestureRecognizer *)rotate {
    
    tapGestore.transform = CGAffineTransformRotate(self.tapGestore.transform, rotate.rotation);
    rotate.rotation = 0.0;
    
}

- (IBAction)pinchGestore:(UIPinchGestureRecognizer *)scalling {
    
    scalling.scale = 1.0;
    tapGestore.transform = CGAffineTransformScale(self.tapGestore.transform, scalling.scale, scalling.scale);
    
}

- (IBAction)panGestore:(UIPanGestureRecognizer *)panning {
    
    CGPoint translation = [panning translationInView:self.view];
    panning.view.center = CGPointMake(panning.view.center.x + translation.x,
                                      panning.view.center.y + translation.y);
    [panning setTranslation:CGPointMake(0, 0) inView:self.view];
    
}

@end
