//
//  ViewController.h
//  SaveSegmentet
//
//  Created by Admin on 7/26/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;
- (IBAction)actionSegment:(UISegmentedControl *)sender;

@end

