//
//  AppDelegate.m
//  NSData
//
//  Created by Admin on 2/22/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "OMTimerDate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /*
    NSDate* date = [NSDate date];
    
    NSDateFormatter* formatterDate = [[NSDateFormatter alloc]init];
    [formatterDate setDateStyle:NSDateFormatterShortStyle];
    NSLog(@"%@", [formatterDate stringFromDate:date]);
    
    [formatterDate setDateStyle:NSDateFormatterMediumStyle];
    NSLog(@"%@", [formatterDate stringFromDate:date]);
    
    [formatterDate setDateStyle:NSDateFormatterShortStyle];
    NSLog(@"%@", [formatterDate stringFromDate:date]);
    
    [formatterDate setDateStyle:NSDateFormatterLongStyle];
    NSLog(@"%@", [formatterDate stringFromDate:date]);
    
    [formatterDate setDateStyle:NSDateFormatterFullStyle];
    NSLog(@"%@", [formatterDate stringFromDate:date]);
    
//    [formatterDate setDateFormat:@"yyyy MM MMM MMMM MMMMM"];
//    [formatterDate setDateFormat:@"yyyy/MM/dd EE EEEE EEEEE"];
//    [formatterDate setDateFormat:@"yyyy-MM-dd hh:mm:ss a"];
    
    NSLog(@"%@", [formatterDate stringFromDate:date]);
    */
    /*
    NSDate* date = [NSDate date];
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSDateComponents* components = [calendar components:NSCalendarUnitYear |NSCalendarUnitMonth |
                                    NSCalendarUnitDay | NSCalendarUnitHour |
                                    NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:date];
    NSLog(@"%@", components);
    */
    /*
    NSDate* date1 = [NSDate date];
    NSDate* date2 = [NSDate dateWithTimeIntervalSinceNow:-1000000];
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSDateComponents* components = [calendar components:NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:date2 toDate:date1 options:0];
    
    NSLog(@"%@", components);
    */
    
    OMTimerDate* obj = [[OMTimerDate alloc] init];
    
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
