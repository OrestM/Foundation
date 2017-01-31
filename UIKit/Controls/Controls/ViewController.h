//
//  ViewController.h
//  Controls
//
//  Created by Admin on 3/1/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel* displayValueRGB;
@property (weak, nonatomic) IBOutlet UILabel* displayValueHSV;

@property (weak, nonatomic) IBOutlet UISlider* redSlider;
@property (weak, nonatomic) IBOutlet UISlider* greenSlider;
@property (weak, nonatomic) IBOutlet UISlider* blueSlider;

@property (weak, nonatomic) IBOutlet UISlider *hueSlider;
@property (weak, nonatomic) IBOutlet UISlider *saturationSlider;
@property (weak, nonatomic) IBOutlet UISlider *brightnessSlider;

@property (weak, nonatomic) IBOutlet UISegmentedControl* segmentControlLabel;

- (IBAction)actionSlider:(UISlider *)sender;
- (IBAction)actionSwitch:(UISwitch *)sender;

@end

