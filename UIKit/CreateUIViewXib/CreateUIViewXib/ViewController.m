//
//  ViewController.m
//  CreateUIViewXib
//
//  Created by Admin on 7/27/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"
#import "Custom.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Custom *customView = [Custom new];
    customView.frame = self.view.frame;
    [self.view addSubview:customView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
