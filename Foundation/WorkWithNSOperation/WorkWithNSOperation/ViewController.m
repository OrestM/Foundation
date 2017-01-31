//
//  ViewController.m
//  WorkWithNSOperation
//
//  Created by Admin on 6/6/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self printCount];
}

- (void)startCounting {
    
    NSInvocationOperation *countinOp = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(printCount) object:nil];
    
    NSOperationQueue *theQue = [[NSOperationQueue alloc] init];
    [theQue addOperation:countinOp];
    
}

- (void)printCount {
    
    for (int i = 0; i <= 10; i++) {
        NSLog(@"%i", i);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
