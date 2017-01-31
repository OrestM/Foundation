//
//  AppDelegate.m
//  Notification
//
//  Created by Admin on 2/3/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "Government.h"
#import "Person.h"
#import "Pensioner.h"

@interface AppDelegate ()

@property (strong, nonatomic) Government* government;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(governmentNotification:) name:GovernmentTaxLevelNotification object:nil];
    
    _government = [Government new];
   
    Person* person = [Person new];
    Person* person1 = [Person new];
    Pensioner* pensioner = [Pensioner new];

    person.salary = person1.salary = _government.salary;
    person.averagePrice = person1.averagePrice = _government.averagePrice;
    pensioner.pansion = _government.pansion;
    
    _government.taxLevel = 5.5f;
    _government.salary = 1100;
    _government.pansion = 550;
    _government.averagePrice = 15;
    
    return YES;
}


- (void)governmentNotification:(NSNotification*)notification {
    NSLog(@"governmentNotification userInfo = %@", notification.userInfo);
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
