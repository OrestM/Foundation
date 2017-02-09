//
//  TableViewCell.h
//  Delagete
//
//  Created by Admin on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyTableViewCell <NSObject>

@optional

- (void)pressButton:(UIButton*)click;

@end

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) id<MyTableViewCell> delegate;
@property (weak, nonatomic) IBOutlet UIButton *click;
@property (weak, nonatomic) IBOutlet UILabel *displayText;

@end
