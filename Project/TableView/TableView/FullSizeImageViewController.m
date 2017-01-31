//
//  FullSizeImageViewController.m
//  TableView
//
//  Created by Admin on 12/25/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "FullSizeImageViewController.h"

@interface FullSizeImageViewController()

@property(nonatomic, strong) IBOutlet UIImageView *imageView;

@end

@implementation FullSizeImageViewController

- (void)viewDidLoad {
    [_imageView setImage:_image];
}


@end