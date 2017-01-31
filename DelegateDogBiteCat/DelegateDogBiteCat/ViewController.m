//
//  ViewController.m
//  DelegateDogBiteCat
//
//  Created by Admin on 5/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"
#import "OMDog.h"
#import "OMCat.h"

@interface ViewController () <OMDogDelegate>

@property (strong, nonatomic) UIAlertController *alert;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    OMDog *dog = [[OMDog alloc] init];
    OMCat *cat = [[OMCat alloc] init];
    
    dog.delegate = self;
    
    [dog dogBiteCat:cat];
    
}

- (void)showMessage:(NSString *)message withTitle:(NSString *)title {
    
    self.alert =
    [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        
    }];
    
    [self.alert addAction:actionOk];
    
    [self presentViewController:self.alert animated:YES completion:nil];
    
}

#pragma mark - OMDogDelegate

- (void)showBiteAlert:(OMDog *)dog andCat:(OMCat *)cat {
    
    [self showMessage:[NSString stringWithFormat:@"%@ bites %@!", dog.name, cat.name] withTitle:@"Work with delegate"];
    
}

@end
