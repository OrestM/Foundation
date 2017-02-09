//
//  ViewController.m
//  IventButtonPressed
//
//  Created by Admin on 4/2/16.
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

- (IBAction)actionDownPressed:(UIButton *)sender {
    
    NSLog(@"Toch Down");
    
}

- (IBAction)actionDownRepeat:(UIButton *)sender {
    
    NSLog(@"Touch Down Repeat");
    
}

- (IBAction)actionDragEnter:(UIButton *)sender {
    
    NSLog(@"Drag Enter");
    
}

- (IBAction)actionDragExit:(UIButton *)sender {
    
    NSLog(@"Drag Exit");
    
}

- (IBAction)actionDragInside:(UIButton *)sender {
    
    NSLog(@"Drag Inside");
    
}

- (IBAction)actionDragOutside:(UIButton *)sender {
 
    NSLog(@"Drag Outside");
    
}

@end
