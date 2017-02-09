//
//  OMNavigationControllerEditSB.h
//  UINavigationEditStoryboard 2
//
//  Created by Admin on 3/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OMNavigationControllerEditSB : UITableViewController

@property (strong, nonatomic) NSString *path;

- (id)initWithFolderPath:(NSString *)path;
- (IBAction)actionInfo:(id)sender;

@end
