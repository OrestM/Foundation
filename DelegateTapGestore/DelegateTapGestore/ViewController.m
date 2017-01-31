//
//  ViewController.m
//  DelegateTapGestore
//
//  Created by Admin on 5/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"
#import "OMBonusView.h"

@interface ViewController () <OMBonusViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OMBonusView *view = [[OMBonusView alloc] init];
    [view addGestureRecognizer:self.view];
    [self.view addSubview:view];
    
    view.delegate = self;
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPressTap) name:@"Tap" object:nil];
        
}

- (void)didPressTap {
    
    self.textLabel.text = @"Show text through delegate.";
    
}
/*
- (void)dealloc {    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
*/
@end
