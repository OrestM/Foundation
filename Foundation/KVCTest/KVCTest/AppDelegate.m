//
//  AppDelegate.m
//  KVCTest
//
//  Created by Admin on 3/18/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "OMStudent.h"
#import "OMGroup.h"

@interface AppDelegate ()

//@property (strong, nonatomic) OMStudent *student;
@property (strong, nonatomic) NSArray *groups;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
    OMStudent *student = [[OMStudent alloc] init];
    
    [student addObserver:self forKeyPath:@"name" options: NSKeyValueObservingOptionNew |
     NSKeyValueObservingOptionOld context:nil];
    
    student.name = @"Orest";
    student.age = 20;
    
    NSLog(@"%@", student);
    
    [student setValue:@"Roger" forKey:@"name"];
    [student setValue:@25 forKey:@"age"];
    
    NSLog(@"name1: %@, name2: %@", student.name, [student valueForKey:@"name"]);
    
    NSLog(@"%@", student);
    
    [student changeName];
    
    NSLog(@"%@", student);
    
    self.student = student;
    */
    
    OMStudent *student = [[OMStudent alloc] init];
    student.name = @"Orest";
    student.age = 20;
    
    OMStudent *student1 = [[OMStudent alloc] init];
    student1.name = @"Roger";
    student1.age = 25;
    
    OMStudent *student2 = [[OMStudent alloc] init];
    student2.name = @"Jeck";
    student2.age = 22;
    
    OMStudent *student3 = [[OMStudent alloc] init];
    student3.name = @"Vova";
    student3.age = 21;
    
    OMGroup *group = [[OMGroup alloc] init];
    
    group.students = @[student, student1, student2, student3];
    
    /*
    NSLog(@"%@", group.students);
    
    NSMutableArray *array = [group mutableArrayValueForKey:@"students"];
    
    [array removeLastObject];
    
    NSLog(@"%@", array);
    */
    
    /*
    self.student = student1;
    
    NSLog(@"name: %@", [self valueForKeyPath:@"student.name"]);
    
    NSString *name = @"Orest11";
    NSError *error = nil;
    
    if (![self.student validateValue:&name forKey:@"name" error:&error]) {
        NSLog(@"%@", error);
    }
    */
    
    OMStudent *student4 = [[OMStudent alloc] init];
    student4.name = @"Vasia";
    student4.age = 18;
    
    OMStudent *student5 = [[OMStudent alloc] init];
    student5.name = @"Petro";
    student5.age = 29;
    
    OMGroup *group1 = [[OMGroup alloc] init];
    
    group1.students = @[student4, student5];
    
    self.groups = @[group, group1];
    
    NSLog(@"Groups count %@", [self valueForKeyPath:@"groups.@count"]);
    
    NSArray *allStudent = [self valueForKeyPath:@"groups.@distinctUnionOfArrays.students"];
    
    NSLog(@"All students %@", allStudent);
    
    NSNumber *minAge = [allStudent valueForKeyPath:@"@min.age"];
    NSNumber *maxAge = [allStudent valueForKeyPath:@"@max.age"];
    NSNumber *sumAge = [allStudent valueForKeyPath:@"@sum.age"];
    NSNumber *avgAge = [allStudent valueForKeyPath:@"@avg.age"];
    
    NSLog(@"minAge %@", minAge);
    NSLog(@"maxAge %@", maxAge);
    NSLog(@"sumAge %@", sumAge);
    NSLog(@"avgAge %@", avgAge);
    
    NSArray *allNames = [allStudent valueForKeyPath:@"@distinctUnionOfObjects.name"];
    
    NSLog(@"allNames = %@", allNames);
    
    return YES;
}

- (void)dealloc {
    
//    [self.student removeObserver:self forKeyPath:@"name"];
    
}

#pragma mark - Observing

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSString*, id> *)change context:(nullable void *)context {
    
    NSLog(@"observeValueForKeyPath: %@\nofObject: %@\nchange: %@", keyPath, object, change);    
    
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
