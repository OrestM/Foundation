//
//  ViewController.m
//  GesturesTest
//
//  Created by Admin on 2/24/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) UIView* testView;

@property (assign, nonatomic) CGFloat testViewScale;
@property (assign, nonatomic) CGFloat testViewRotation;
@property (assign, nonatomic) CGPoint touchOfSet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - 50,
                                                           CGRectGetMidY(self.view.bounds) - 50,
                                                           100, 100)];
    view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    self.testView = view;
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hadleTap:)];
    [self.view addGestureRecognizer:tapGesture];
    
    UITapGestureRecognizer* doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(doubleHadleTap:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTapGesture];
    
    UITapGestureRecognizer* doubleTapDoubleTouchesGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(doubleHadleDoubleTouchesTap:)];
    doubleTapDoubleTouchesGesture.numberOfTapsRequired = 2;
    doubleTapDoubleTouchesGesture.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:doubleTapDoubleTouchesGesture];
    [tapGesture requireGestureRecognizerToFail:doubleTapGesture];
    
    
    UIPinchGestureRecognizer* pinchGesture =
    [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    pinchGesture.delegate = self;
    [self.view addGestureRecognizer:pinchGesture];
    
    UIRotationGestureRecognizer* rotationGesture =
    [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    rotationGesture.delegate = self;
    [self.view addGestureRecognizer:rotationGesture];
    
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGesture.delegate = self;
    [self.view addGestureRecognizer:panGesture];
    
    UISwipeGestureRecognizer* verticalSwipeGesture =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleVerticalSwipe:)];
    [self.view addGestureRecognizer:verticalSwipeGesture];
    verticalSwipeGesture.direction = UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;
    
    UISwipeGestureRecognizer* horizontalSwipeGesture =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleHorizontalSwipe:)];
    [self.view addGestureRecognizer:horizontalSwipeGesture];
    horizontalSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

- (UIColor*)randomColor {
    CGFloat r = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat g = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat b = (CGFloat)(arc4random() % 256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

#pragma mark - Gestures

- (void)hadleTap:(UITapGestureRecognizer*)tapGesture {
    NSLog(@"Tap: %@", NSStringFromCGPoint([tapGesture locationInView:self.view]));
    
    self.testView.backgroundColor = [self randomColor];
}

- (void)doubleHadleTap:(UITapGestureRecognizer*)tapGesture {
    NSLog(@"Double Tap: %@", NSStringFromCGPoint([tapGesture locationInView:self.view]));
    
    CGAffineTransform currentTransform = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, 1.2f, 1.2f);
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.testView.transform = newTransform;
                     }];
    self.testViewScale = 1.2f;
}

- (void)doubleHadleDoubleTouchesTap:(UITapGestureRecognizer*)tapGesture {
    NSLog(@"Double Tap Double Touches: %@", NSStringFromCGPoint([tapGesture locationInView:self.view]));
    
    CGAffineTransform currentTransform = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, 0.8f, 0.8f);
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.testView.transform = newTransform;
                     }];
    self.testViewScale = 0.8f;
}

- (void)handlePinch:(UIPinchGestureRecognizer*)pinchGesture {
    NSLog(@"handlePinch %1.3f", pinchGesture.scale);
    
    if (pinchGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewScale = 1.f;
    }
    
    CGFloat newScale = 1.f + pinchGesture.scale - self.testViewScale;
    
    CGAffineTransform currentTransform = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, newScale, newScale);
    
    self.testView.transform = newTransform;
    
    self.testViewScale = pinchGesture.scale;
}

- (void)handleRotation:(UIRotationGestureRecognizer*)rotationGesture {
    NSLog(@"handleRotation %1.3f", rotationGesture.rotation);
    
    if (rotationGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewRotation = 0;
    }
    
    CGFloat newRotation = rotationGesture.rotation - self.testViewRotation;
    
    CGAffineTransform currentTransform = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, newRotation);
    
    self.testView.transform = newTransform;
    
    self.testViewRotation = rotationGesture.rotation;
}

- (void)handlePan:(UIPanGestureRecognizer*)panGesture {
    NSLog(@"handlePan");
    
    self.testView.center = [panGesture locationInView:self.view];
}

- (void)handleVerticalSwipe:(UISwipeGestureRecognizer*)swipeGesture {
    NSLog(@"Vertical Swipe");
}

- (void)handleHorizontalSwipe:(UISwipeGestureRecognizer*)swipeGesture {
    NSLog(@"Horizontal Swipe");
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]];
}

@end
