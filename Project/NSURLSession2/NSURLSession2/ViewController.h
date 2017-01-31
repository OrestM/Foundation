//
//  ViewController.h
//  NSURLSession2
//
//  Created by Admin on 1/25/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UIButton* cancelButton;
@property (weak, nonatomic) IBOutlet UIButton* resumeButton;
@property (weak, nonatomic) IBOutlet UIImageView* imageView;
@property (weak, nonatomic) IBOutlet UIProgressView* progressView;

- (IBAction)resume:(id)sender;
- (IBAction)cancel:(id)sender;

@end

