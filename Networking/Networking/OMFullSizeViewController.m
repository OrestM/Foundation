//
//  OMFullSizeViewController.m
//  Networking
//
//  Created by Admin on 5/27/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMFullSizeViewController.h"

@interface OMFullSizeViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation OMFullSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"Image full size";
    
    [self.imageView setImage:self.image];
}

@end
