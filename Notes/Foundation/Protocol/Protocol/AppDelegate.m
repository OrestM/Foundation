//
//  AppDelegate.m
//  Protocol
//
//  Created by Admin on 2/2/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "Hospital.h"
#import "Student.h"
#import "Dancer.h"
#import "Developer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    Student* student1 = [Student new];
    Student* student2 = [Student new];
    
    Dancer* dancer1 = [Dancer new];
    Dancer* dancer2 = [Dancer new];
    
    Developer* developer = [Developer new];
    
    student1.name = @"student1";
    student2.name = @"student2";
    
    dancer1.name = @"dancer1";
    dancer2.name = @"dancer2";
    
    developer.name = @"developer";
    
    NSArray* patients = [NSArray arrayWithObjects:student1, student2, dancer1, dancer2, developer, nil];
    
    for (id <Patient> patient in patients) {
        NSLog(@"Patient name = %@.", patient.name);
        
        if ([patient respondsToSelector:@selector(howYourFamily)]) {
            NSLog(@"How is your family? \n %@.", [patient howYourFamily]);
        }
        
        if ([patient respondsToSelector:@selector(howYourJob)]) {
            NSLog(@"How is your job? \n %@.", [patient howYourJob]);
        }
        
        if (![patient areYouOkey]) {
            [patient takePill];
        
        if (![patient areYouOkey]) {
            [patient makeShots];
        }
      }
    }
    
    /*
    for (int i = 0; i < [patients count]; i++) {
        id <Patient> patient = [patients objectAtIndex:i];
    }
    */
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
