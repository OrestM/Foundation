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

@property (strong, nonatomic) OMDog *dog;
@property (strong, nonatomic) OMCat *cat;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    _dog = [[OMDog alloc] init];
    _cat = [[OMCat alloc] init];
    
    _dog.delegate = self;
    
}

- (void)showMessage:(NSString *)message withTitle:(NSString *)title {
    
    UIAlertController *alert =
    [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        
    }];
    
    [alert addAction:actionOk];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (IBAction)actionTap:(id)sender {
    
    [_dog dogBiteCat:_cat];
    
}

#pragma mark - OMDogDelegate

- (void)showBiteAlert:(OMDog *)dog andCat:(OMCat *)cat {
    
    [self showMessage:[NSString stringWithFormat:@"%@ bites %@!", dog.name, cat.name] withTitle:@"Work with delegate"];
    
}

@end
