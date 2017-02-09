//
//  ViewController.m
//  UIButton
//
//  Created by Admin on 2/29/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor lightGrayColor];
    button.frame = CGRectMake(200, 200, 200, 200);
    
    /*
    NSDictionary* attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:30],
                                 NSForegroundColorAttributeName: [UIColor orangeColor]};
    
    NSAttributedString* title = [[NSAttributedString alloc] initWithString:@"Button" attributes:attributes];
    
    [button setAttributedTitle:title forState:UIControlStateNormal];
    
    NSDictionary* attributes2 = @{NSFontAttributeName: [UIFont systemFontOfSize:20],
                                 NSForegroundColorAttributeName: [UIColor redColor]};
    
    NSAttributedString* title2 = [[NSAttributedString alloc] initWithString:@"Button Pressed" attributes:attributes2];
    
    [button setAttributedTitle:title2 forState:UIControlStateHighlighted];
    */
    
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button setTitle:@"Button Pressed" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    
//    UIEdgeInsets insets = UIEdgeInsetsMake(100, 50, 0, 0);
//    button.titleEdgeInsets = insets;
    
//    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(actionInside:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(actionOutside:) forControlEvents:UIControlEventTouchUpOutside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action

- (void)actionInside:(UIButton*) button {
    NSLog(@"Pressed Inside");
}

- (void)actionOutside:(UIButton*) button {
    NSLog(@"Pressed Outside");
}

- (IBAction)actionTest2:(UIButton *)sender {
    NSLog(@"Test 2 == tag %ld", sender.tag);
    
    self.indicatorLabel.text = [NSString stringWithFormat:@"%ld", sender.tag];
}

- (IBAction)actionTouchDown:(UIButton *)sender {
//    NSLog(@"Touch Down");
}
@end
