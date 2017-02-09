//
//  OMListPeopleTableViewCell.h
//  OMListOfPeople
//
//  Created by Orest Mykha on 2/4/17.
//  Copyright © 2017 Orest Mykha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OMListPeopleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *gender;
@property (weak, nonatomic) IBOutlet UILabel *birth;
@property (weak, nonatomic) IBOutlet UILabel *place;
@property (weak, nonatomic) IBOutlet UIButton *more;
@property (weak, nonatomic) IBOutlet UIButton *showOnMap;

@property (weak, nonatomic) NSURLSession *session;
@property (weak, nonatomic) NSCache *cashe;

- (void)loadImageWithUrl:(NSURL *)url;

@end
