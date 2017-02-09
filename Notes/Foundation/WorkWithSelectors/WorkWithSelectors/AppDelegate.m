//
//  AppDelegate.m
//  WorkWithSelectors
//
//  Created by Admin on 2/13/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "Text.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Text* obj = [Text new];
    
    /*
    SEL selector1 = @selector(testMethod);
    SEL selector2 = @selector(testMethod:);
    SEL selector3 = @selector(testMethod:parametr2:);
    */
     
    [self performSelector:@selector(testMethod)];
    [obj performSelector:@selector(testMethod)];
    
    NSString* secret = [obj performSelector:@selector(secretText)];
    
    NSLog(@"secret - %@", secret);
    
    [self performSelector:@selector(testMethod:) withObject:@"test string"];
    [self performSelector:@selector(testMethod:parametr2:) withObject:@"string1" withObject:@"string2"];
    
    return YES;
}

- (void)testMethod {
    NSLog(@"testMethod");
}

- (void)testMethod:(NSString*)string {
    NSLog(@"testMethod: %@", string);
}

- (void)testMethod:(NSString*)string parametr2:(NSString*)string2 {
    NSLog(@"testMethod:parametr2: %@, %@", string, string2);
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
