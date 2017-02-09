//
//  ContentTableViewCell.h
//  TableView
//
//  Created by Admin on 12/25/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageModel;
@class ContentTableViewCell;

@protocol ContentTableViewCellProtocol <NSObject>

- (void)ContentTableViewCell:(ContentTableViewCell*)cell didDownloadButtonCilck:(UIButton*)button forImageModel:(ImageModel*)model;

@end

@interface ContentTableViewCell : UITableViewCell

@property(nonatomic, weak) id<ContentTableViewCellProtocol> delegate;
@property(nonatomic, strong) ImageModel *imageModel;

- (void)setImageModel:(ImageModel*)model;
@end
