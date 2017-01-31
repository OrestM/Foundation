//
//  ViewController.m
//  Controls
//
//  Created by Admin on 3/1/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

typedef enum {
    
    SegmentTypeRGB,
    SegmentTypeHSV
    
} SegmentType;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self refreshScreen];
    
    self.segmentControlLabel.selectedSegmentIndex = SegmentTypeRGB;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshScreen {
    
    CGFloat red = self.redSlider.value;
    CGFloat green = self.greenSlider.value;
    CGFloat blue = self.blueSlider.value;

    CGFloat hue = self.hueSlider.value;
    CGFloat saturation = self.saturationSlider.value;
    CGFloat brightness = self.brightnessSlider.value;
    
    CGFloat alpha;
    
    UIColor* color = nil;
    
    if (self.segmentControlLabel.selectedSegmentIndex == SegmentTypeRGB) {
        
        color = [UIColor colorWithRed:red green:green blue:blue alpha:1.f];
        
    } else {
        
        color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1.f];
        
    }
    
    NSString* RGB, *HSV = @"";
    
    if ([color getRed:&red green:&green blue:&blue alpha:&alpha]) {
        
        RGB = [NSString stringWithFormat:@"RGB: {%1.2f %1.2f %1.2f}", red * 255, green * 255, blue * 255];
        
    } else {
        
        RGB = [NSString stringWithFormat:@"RGB: {NO DATA}"];
        
    }
    
    if ([color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
        
        HSV = [NSString stringWithFormat:@"HSV: {%1.2f %1.2f %1.2f}", hue * 255, saturation * 255, brightness * 255];
        
    } else {
        
        HSV = [NSString stringWithFormat:@"HSV: {NO DATA}"];
        
    }

    if (self.segmentControlLabel.selectedSegmentIndex == SegmentTypeRGB) {
        
        self.displayValueRGB.text = RGB;
        
    } else {
        
        self.displayValueHSV.text = HSV;
        
    }
    
    self.view.backgroundColor = color;
}

#pragma mark - Actions

- (IBAction)actionSlider:(UISlider *)sender {
    
    [self refreshScreen];
    
}

- (IBAction)actionSwitch:(UISwitch *)sender {
    
    self.redSlider.enabled = self.greenSlider.enabled = self.blueSlider.enabled = sender.isOn;
    self.hueSlider.enabled = self.saturationSlider.enabled = self.brightnessSlider.enabled = sender.isOn;
    
}

@end
