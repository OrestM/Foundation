//
//  OMMapViewController.h
//  OMListOfPeople
//
//  Created by Orest Mykha on 2/4/17.
//  Copyright © 2017 Orest Mykha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface OMMapViewController : UIViewController

+ (instancetype)sharedManager;

@property (assign, nonatomic) float latitude;
@property (assign, nonatomic) float longitude;

@end
