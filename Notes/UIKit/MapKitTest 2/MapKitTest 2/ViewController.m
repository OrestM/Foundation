//
//  ViewController.m
//  MapKitTest 2
//
//  Created by Admin on 3/16/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "OMAnnotaion.h"
#import "UIView+OMMKAnnotationView.h"

@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong, nonatomic) CLGeocoder *geocoder;
@property (strong, nonatomic) MKDirections *directions;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
    UIBarButtonItem *addButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAdd:)];
    
    UIBarButtonItem *zoomButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(actionShowAll:)];
    
    self.navigationItem.rightBarButtonItems = @[addButton, zoomButton];
    
    UISegmentedControl *mapTypeControll =
    [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Satellite", @"Hybrid", @"Standart", nil]];
    UIBarButtonItem *segmentButton = [[UIBarButtonItem alloc] initWithCustomView:mapTypeControll];
    [mapTypeControll addTarget:self action:@selector(actionChangeMapType:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.leftBarButtonItem = segmentButton;
    
    [self addGestureRecognizer];
    
    self.geocoder = [[CLGeocoder alloc] init];
}

- (void)addGestureRecognizer {
    
    UILongPressGestureRecognizer *addPin =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(actionAddPinn:)];
    addPin.minimumPressDuration = 0.2f;
    
    [self.mapView addGestureRecognizer:addPin];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    if ([self.geocoder isGeocoding]) {
        [self.geocoder cancelGeocode];
    }

    if ([self.directions isCalculating]) {
        [self.directions cancel];
    }
    
}

#pragma mark - Alert

- (void)showAlertWithMessage:(NSString *)message withTitle:(NSString *)title {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"Click actionInfo");
        
    }];
    
    [alert addAction:action];
    
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    
    [vc presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - MKMapViewDelegate

- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    static NSString *identifier = @"Annotation";
    
    MKPinAnnotationView *pin = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (!pin) {
        
        pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        pin.animatesDrop = YES;
        pin.draggable = YES;
        pin.pinTintColor = [UIColor purpleColor];
        pin.canShowCallout = YES;
        
        UIButton *descriptionButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [descriptionButton addTarget:self action:@selector(actionDescription:) forControlEvents:UIControlEventTouchUpInside];
        pin.rightCalloutAccessoryView = descriptionButton;
        
        UIButton *directionButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [directionButton addTarget:self action:@selector(actionDirection:) forControlEvents:UIControlEventTouchUpInside];
        pin.leftCalloutAccessoryView = directionButton;
               
    } else {
        
        pin.annotation = annotation;
        
    }

    return pin;
    
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view
                                    didChangeDragState:(MKAnnotationViewDragState)newState
                                    fromOldState:(MKAnnotationViewDragState)oldState {
    
    if (newState == MKAnnotationViewDragStateEnding)
    {
        CLLocationCoordinate2D touchMapCoordinate = view.annotation.coordinate;
        
        OMAnnotaion *annotation = [[OMAnnotaion alloc] init];
        
        CLLocation *location =
        [[CLLocation alloc] initWithLatitude:touchMapCoordinate.latitude longitude:touchMapCoordinate.longitude];
        
        [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            
            CLPlacemark *placeMark = [placemarks lastObject];
            
            annotation.title = [NSString stringWithFormat:@"%@", placeMark.name];
            annotation.subtitle = [NSString stringWithFormat:@"{%f, %f}", touchMapCoordinate.latitude, touchMapCoordinate.longitude];
            annotation.coordinate = touchMapCoordinate;
            
        }];
        
        [self.mapView addAnnotation:annotation];
        
    }
        
        CLLocationCoordinate2D coordinate = view.annotation.coordinate;
        
        MKMapPoint point = MKMapPointForCoordinate(coordinate);
        
        NSLog(@"location = {%f, %f}\npoint = %@", coordinate.latitude, coordinate.longitude, MKStringFromMapPoint(point));
    
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay {
    
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        
        MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
        renderer.lineWidth = 2.f;
        renderer.strokeColor = [UIColor colorWithRed:0.f green:0.5f blue:1.f alpha:0.8f];
        return renderer;
        
    }
    
    return nil;
    
}

#pragma mark - Actions

- (void)actionAddPinn:(UILongPressGestureRecognizer *)gestureRecognaizer {
    
    if (gestureRecognaizer.state != UIGestureRecognizerStateEnded)
        return;
    
    CGPoint touchPoint = [gestureRecognaizer locationInView:self.mapView];
    
    CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    OMAnnotaion *annotation = [[OMAnnotaion alloc] init];
    
    CLLocation *location =
    [[CLLocation alloc] initWithLatitude:touchMapCoordinate.latitude longitude:touchMapCoordinate.longitude];
    
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        CLPlacemark *placeMark = [placemarks lastObject];
        
        annotation.title = [NSString stringWithFormat:@"%@", placeMark.name];
        annotation.subtitle = [NSString stringWithFormat:@"{%f, %f}", touchMapCoordinate.latitude, touchMapCoordinate.longitude];
        annotation.coordinate = touchMapCoordinate;
        
    }];
    
    [self.mapView addAnnotation:annotation];
    
}

- (void)actionChangeMapType:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
            
        case 1:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
            
        case 2:
            self.mapView.mapType = MKMapTypeStandard;
            break;
            
        default:
            break;
    }
    
}

- (void)actionAdd:(UIBarButtonItem *)sender {
    
    OMAnnotaion *annotation = [[OMAnnotaion alloc] init];
    
    CLLocationCoordinate2D coordinate = self.mapView.region.center;
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        CLPlacemark *placeMark = [placemarks lastObject];
        
        annotation.title = [NSString stringWithFormat:@"%@", placeMark.name];
        annotation.subtitle = [NSString stringWithFormat:@"{%f, %f}", coordinate.latitude, coordinate.longitude];
        annotation.coordinate = coordinate;
        
    }];
    
    [self.mapView addAnnotation:annotation];
}

- (void)actionShowAll:(UIBarButtonItem *)sender {
    
    MKMapRect zoomRect = MKMapRectNull;
    
    for (id <MKAnnotation> annotation in self.mapView.annotations) {
        
        CLLocationCoordinate2D location = annotation.coordinate;
        
        MKMapPoint center = MKMapPointForCoordinate(location);
        
        static double delta = 2000;
        
        MKMapRect rect = MKMapRectMake(center.x - delta, center.y - delta, delta * 2, delta * 2);
        
        zoomRect = MKMapRectUnion(zoomRect, rect);
        
    }
    
    zoomRect = [self.mapView mapRectThatFits:zoomRect];
    
    [self.mapView setVisibleMapRect:zoomRect edgePadding:UIEdgeInsetsMake(10, 10, 10, 10) animated:YES];
    
}

- (void)actionDescription:(UIButton *)sender {
    
    MKAnnotationView *annotationView = [sender superAnnotationView];
    
    if (!annotationView) {
        return;
    }
    
    CLLocationCoordinate2D coordinate = annotationView.annotation.coordinate;
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    
    if ([self.geocoder isGeocoding]) {
        [self.geocoder cancelGeocode];
    }
    
    [self.geocoder
     reverseGeocodeLocation:location
     completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
         
         NSString *message = nil;
         
         if (error) {
             
             message = [error localizedDescription];
             
         } else {
             
             if (placemarks > 0) {
                 
                 CLPlacemark *placeMark = [placemarks firstObject];
                 
                 message = [placeMark.addressDictionary description];
                 
             } else {
                 
                 NSLog(@"Message no plasemarks");
                 
             }
             
             [self showAlertWithMessage:message withTitle:@"Location"];
             
         }
         
     }];
    
}

- (void)actionDirection:(UIButton *)sender {
    
    MKAnnotationView *annotationView = [sender superAnnotationView];
    
    if (!annotationView) {
        return;
    }
    
    if ([self.directions isCalculating]) {
        [self.directions cancel];
    }
    
    CLLocationCoordinate2D coordinate = annotationView.annotation.coordinate;
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    
    request.source = [MKMapItem mapItemForCurrentLocation];
    
    MKPlacemark *placeMark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
    
    MKMapItem *destination = [[MKMapItem alloc] initWithPlacemark:placeMark];
    
    request.destination = destination;
    
    request.transportType = MKDirectionsTransportTypeAny;
    
    request.requestsAlternateRoutes = YES;
    
    self.directions = [[MKDirections alloc] initWithRequest:request];
    
    [self.directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            
            [self showAlertWithMessage:[error localizedDescription] withTitle:@"Error"];
            
        } else if ([response.routes count]  == 0) {
            
            [self showAlertWithMessage:@"No routs found" withTitle:@"Error"];
            
        } else {
            
            [self.mapView removeOverlays:[self.mapView overlays]];
            
            NSMutableArray *array = [NSMutableArray array];
            
            for (MKRoute *rout in response.routes) {
                
                [array addObject:rout.polyline];
                
            }
            
            [self.mapView addOverlays:array level:MKOverlayLevelAboveRoads];
            
        }
        
    }];
}

@end
