//
//  ViewController.h
//  Delagete
//
//  Created by Admin on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MyTableViewCell> 

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

