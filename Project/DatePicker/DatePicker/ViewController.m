//
//  ViewController.m
//  DatePicker
//
//  Created by Admin on 11/25/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize label;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.myDatePicker addTarget:self action:@selector(datePickerMode:) forControlEvents:UIControlEventValueChanged];
    
    [label setFont: [UIFont fontWithName:@"LittleLordFontleroyNF" size:46]];
    self.label.text = @"This is my new Font";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)datePickerMode:(UIDatePicker *)datepicker {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yy HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:datepicker.date];
    self.selectDate.text = strDate;
}

@end
