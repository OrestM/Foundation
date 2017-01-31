//
//  ViewController.h
//  UIView
//
//  Created by Admin on 2/8/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//@property (weak, nonatomic) IBOutlet UIView* testView;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *testViewCollections;

@end

