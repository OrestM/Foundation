//
//  ViewController.m
//  ConvectorUSDtoUAH
//
//  Created by Admin on 11/17/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "ViewController.h"
#import "ConvectorModel.h"

@interface ViewController () {
    
    ConvectorModel *_model;
    
}

@property (strong, nonatomic) IBOutlet UITextField *uah;
@property (strong, nonatomic) IBOutlet UITextField *usd;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _model = [ConvectorModel shareManager];
}

- (IBAction)done:(id)sender {
    
    double usd = [self.usd.text doubleValue];
    double result_usd = [_model convertUsdtoUah:usd];
    
    double uah = [self.uah.text doubleValue];
    double result_uah = [_model convertUahtoUsd:uah];
    
    self.uah.text = [NSString stringWithFormat:@"%1.2f", result_usd];
    self.usd.text = [NSString stringWithFormat:@"%1.2f", result_uah];
    
}

@end
