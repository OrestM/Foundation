//
//  ViewController.m
//  UIPopoverTet
//
//  Created by Admin on 3/15/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"
#import "OMDetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showDetailViewController:(UIViewController *)vc {
    
    [self presentViewController:vc
                       animated:YES
                     completion:^{
                         
                         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                             
                             [self dismissViewControllerAnimated:YES completion:^{
                                 
                             }];
                             
                         });
                         
                     }];
    
}

- (void)showController:(UIViewController *)vc inPopoverFromSender:(id)sender {
    
    if (!sender) {
        return;
    }
    
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        
        vc.modalPresentationStyle = UIModalPresentationPopover;
        
        UIView *targetView = (UIView *)[self.addBarButton performSelector:@selector(view)];
        CGRect rectAddBarButton = targetView.frame;
        
        vc.popoverPresentationController.sourceView = self.view;
        vc.popoverPresentationController.sourceRect = rectAddBarButton;
        vc.preferredContentSize = CGSizeMake(300, 300);
        
        [self showDetailViewController:vc];
        
    } else if ([sender isKindOfClass:[UIButton class]]) {
        
        vc.modalPresentationStyle = UIModalPresentationPopover;
        
        vc.popoverPresentationController.sourceView = self.view;
        vc.popoverPresentationController.sourceRect = [(UIButton *)sender frame];
        vc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
        
        [self showDetailViewController:vc];
        
    }
    
}

#pragma mark - Actions

- (IBAction)actionAdd:(UIBarButtonItem *)sender {
    
    OMDetailsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OMDetailsViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {

        [self showController:vc inPopoverFromSender:sender];
        
    } else {
        
        [self showDetailViewController:vc];
        
    }
    
}

- (IBAction)actionPressMe:(UIButton *)sender {
    
    OMDetailsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OMDetailsViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        [self showController:vc inPopoverFromSender:sender];
        
    } else {
        
        [self showDetailViewController:vc];
        
    }
    
}

@end
