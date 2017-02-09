//
//  OMMapViewController.m
//  OMListOfPeople
//
//  Created by Orest Mykha on 2/4/17.
//  Copyright © 2017 Orest Mykha. All rights reserved.
//

#import "OMMapViewController.h"

@interface OMMapViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation OMMapViewController

+ (instancetype)sharedManager {
    static OMMapViewController *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[OMMapViewController alloc] initPrivate];
    });
    return sharedManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        @throw [NSException exceptionWithName:@"Singlton" reason:@"This class is singlton" userInfo:nil];
    }
    return self;
}

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MKCoordinateRegion region = [_mapView regionThatFits:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(_latitude, _longitude), 2000, 2000)];
    [_mapView setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
