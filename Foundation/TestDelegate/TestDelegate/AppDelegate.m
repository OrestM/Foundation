//
//  AppDelegate.m
//  TestDelegate
//
//  Created by Admin on 1/25/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "Patient.h"
#import "Doctor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    Patient* patient1 = [Patient new];
    patient1.name = @"Vova";
    patient1.temperature = 36.6f;
    
    Patient* patient2 = [Patient new];
    patient2.name = @"Kolya";
    patient2.temperature = 39.2f;
    
    Patient* patient3 = [Patient new];
    patient3.name = @"Mila";
    patient3.temperature = 37.5f;
    
    Doctor* doctor = [Doctor new];
    
    patient1.delegate = doctor;
    patient2.delegate = doctor;
    patient3.delegate = doctor;
    
    NSLog(@"%@ are you ok? %@", patient1.name, [patient1 howAreYou] ? @"YES" : @"NO");
    NSLog(@"%@ are you ok? %@", patient2.name, [patient2 howAreYou] ? @"YES" : @"NO");
    NSLog(@"%@ are you ok? %@", patient3.name, [patient3 howAreYou] ? @"YES" : @"NO");
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
