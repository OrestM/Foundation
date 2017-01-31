//
//  ViewController.m
//  UIImageViewAnimations
//
//  Created by Admin on 4/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageView.image = [UIImage imageNamed:@"pic1.png"];
    
    [self viewAnimation:self.imageView];
}

- (NSArray *)images {
    
    UIImage *image1 = [UIImage imageNamed:@"pic1.png"];
    UIImage *image2 = [UIImage imageNamed:@"pic2.png"];
    UIImage *image3 = [UIImage imageNamed:@"pic3.png"];
    
    return @[image1, image2, image3];
    
}

- (void)viewAnimation:(UIImageView *)view {
    
    [UIView animateWithDuration:1.f animations:^{
        
//        view.animationImages = [self images];
        view.animationImages = @[@"pic1.png", @"pic2.png", @"pic3.png"];
        view.animationDuration = 1.f;
        
    }];

}

#pragma mark - Action

- (IBAction)actionStartAnimation:(UIButton *)sender {
    
    [self.imageView startAnimating];
    
}

- (IBAction)actionStopAnimation:(UIButton *)sender {
    
    [self.imageView stopAnimating];
    
}

@end
