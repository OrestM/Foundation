//
//  ViewController.h
//  UIWebTest
//
//  Created by Admin on 3/25/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardButtonItem;

- (IBAction)actionBack:(id)sender;
- (IBAction)actionForward:(id)sender;
- (IBAction)actionRefresh:(id)sender;

@end

