//
//  ViewController.m
//  SaveSegmentet
//
//  Created by Admin on 7/26/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

static NSString *kSeg = @"segmented";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self load];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)save {
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    [userD setInteger:self.segmented.selectedSegmentIndex forKey:kSeg];
}

- (void)load {
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    self.segmented.selectedSegmentIndex = [userD integerForKey:kSeg];
}

- (IBAction)actionSegment:(UISegmentedControl *)sender {
    [self save];
}

@end
