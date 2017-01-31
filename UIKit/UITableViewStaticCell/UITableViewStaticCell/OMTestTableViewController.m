//
//  OMTestTableViewController.m
//  UITableViewStaticCell
//
//  Created by Admin on 3/5/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMTestTableViewController.h"

static NSString *kLoginField            = @"login";
static NSString *kPasswordField         = @"password";
static NSString *kLevelSegmentControl   = @"level";
static NSString *kEnableSwitch          = @"enable";
static NSString *kSoundSlider           = @"sound";
static NSString *kMusicSlider           = @"music";

@implementation OMTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setContentInset:UIEdgeInsetsMake(20, 0, 20, 0)];
    
    [self loadSettings];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(notificationWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(notificationWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
 
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)saveSettings {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:self.loginField.text forKey:kLoginField];
    [userDefaults setObject:self.passwordField.text forKey:kPasswordField];
    
    [userDefaults setInteger:self.levelSegmentControl.selectedSegmentIndex forKey:kLevelSegmentControl];
    [userDefaults setBool:self.enableSwitch.isOn forKey:kEnableSwitch];
    
    [userDefaults setDouble:self.soundSlider.value forKey:kSoundSlider];
    [userDefaults setDouble:self.musicSlider.value forKey:kMusicSlider];
    
}

- (void)loadSettings {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.loginField.text = [userDefaults objectForKey:kLoginField];
    self.passwordField.text = [userDefaults objectForKey:kPasswordField];
    
    self.levelSegmentControl.selectedSegmentIndex = [userDefaults integerForKey:kLevelSegmentControl];
    self.enableSwitch.on = [userDefaults boolForKey:kEnableSwitch];
    
    self.soundSlider.value = [userDefaults doubleForKey:kSoundSlider];
    self.musicSlider.value = [userDefaults doubleForKey:kMusicSlider];
    
}

- (IBAction)actionTextChange:(UITextField *)sender {
    
    [self saveSettings];
    
}

- (IBAction)actionValueChange:(id)sender {
    
    [self saveSettings];
    
}

#pragma mark - Notification

- (void)notificationWillShowNotification:(NSNotification *)notification {
    NSLog(@"notificationWillShowNotification:\n%@", notification.userInfo);
}

- (void)notificationWillHideNotification:(NSNotification *)notification {
    NSLog(@"notificationWillHideNotification:\n%@", notification.userInfo);
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField; {
    
    if ([textField isEqual:self.loginField]) {
        
        [self.passwordField becomeFirstResponder];
        
    } else {
        
        [textField resignFirstResponder];
        
    }
    
    return YES;
}

@end
