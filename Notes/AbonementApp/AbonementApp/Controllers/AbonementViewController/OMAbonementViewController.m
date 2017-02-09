//
//  OMAbonementViewController.m
//  AbonementApp
//
//  Created by Admin on 4/23/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMAbonementViewController.h"

@interface OMAbonementViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *anotherDataInfo;

@end

@implementation OMAbonementViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [_imageView setImage:_image];
    [_anotherDataInfo setText:_labelInfo];
    
}

@end
