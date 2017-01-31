//
//  AppDelegate.m
//  WorkWithArray
//
//  Created by Admin on 2/5/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "Object.h"
#import "Child.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    NSArray* name = @[@"Vasil", @"Ivan"];
    //NSArray* name = [[NSArray alloc] initWithObjects:@"Vasil", @"Ivan", nil];
    
    /*
    for (NSString* string in name) {
        NSLog(@"%@", string);
        NSLog(@"index = %ld", [name indexOfObject:string]);
    }
     */
    /*
    for (long i = [name count] - 1; i >= 0; i--) {
        NSLog(@"%@", [name objectAtIndex:i]);
        NSLog(@"i = %ld", i);
    }
    
    for (int i = 0; i < [name count]; i++) {
        NSLog(@"%@", [name objectAtIndex:i]);
        NSLog(@"i = %d", i);
    }
    */
    /*
    NSMutableArray* age = [NSMutableArray arrayWithObjects:@23, @34, nil];
    
    NSLog(@"%@", age);
    
    [age insertObject:@51 atIndex:0];
    
    NSLog(@"%@", age);
    */
    /*
    NSString* lastName = @"Last name is Andriy";
    
    lastName = [lastName stringByReplacingOccurrencesOfString:@"Andriy" withString:@"Orest"];
    
    NSLog(@"%@", lastName);
    */
    
    Object* obj1 = [Object new];
    Object* obj2 = [Object new];
    Child* obj3 = [Child new];
    
    obj1.name = @"Tanya";
    obj2.name = @"Margo";
    obj3.name = @"Anna";
    
    obj3.lastName = @"Last Name";
    
    NSArray* array = [NSArray arrayWithObjects:obj1, obj2, obj3, nil];
    
    for (Object* obj in array) {
        NSLog(@"name = %@", obj.name);
        [obj action];
        
        if ([obj isKindOfClass:[Child class]]) {
            Child* child = (Child*)obj;
            NSLog(@"name = %@", child.lastName);
        }
    }
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    array = [array sortedArrayUsingDescriptors:@[sort]];
    
    for (Object *obj in array) {
         NSLog(@"%@", obj.name);
    }
    
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
