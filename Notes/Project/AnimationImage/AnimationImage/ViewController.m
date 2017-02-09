//
//  ViewController.m
//  AnimationImage
//
//  Created by Admin on 11/25/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize animationImageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //Load images
    NSArray *imagesName = [[NSArray alloc] initWithObjects:
                           [UIImage imageNamed:@"win_1.png"],
                           [UIImage imageNamed:@"win_2.png"],
                           [UIImage imageNamed:@"win_3.png"],
                           [UIImage imageNamed:@"win_4.png"],
                           [UIImage imageNamed:@"win_5.png"],
                           [UIImage imageNamed:@"win_6.png"],
                           [UIImage imageNamed:@"win_7.png"],
                           [UIImage imageNamed:@"win_8.png"],
                           [UIImage imageNamed:@"win_9.png"],
                           [UIImage imageNamed:@"win_10.png"],
                           [UIImage imageNamed:@"win_11.png"],
                           [UIImage imageNamed:@"win_12.png"],
                           [UIImage imageNamed:@"win_13.png"],
                           [UIImage imageNamed:@"win_14.png"],
                           [UIImage imageNamed:@"win_15.png"],
                           [UIImage imageNamed:@"win_16.png"], nil];
    
    //Start image normal   
    animationImageView.animationImages = imagesName;
    animationImageView.animationDuration = 1;

    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
