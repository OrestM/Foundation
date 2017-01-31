//
//  AppDelegate.m
//  NSStirng
//
//  Created by Admin on 2/21/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
    NSString* string = @"Hello World!";
    
    NSLog(@"%@", string);
    
    NSRange range = [string rangeOfString:@"world" options:NSCaseInsensitiveSearch];
    
    if (range.location != NSNotFound) {
        NSLog(@"range - %@", NSStringFromRange(range));
    } else {
        NSLog(@"Not found");
    }
    */
    
    NSString* text = @"A string object presents itself as an array of Unicode characters (Unicode is a registered trademark of Unicode, Inc.). You can determine how many characters a string object contains with the length method and can retrieve a specific character with the characterAtIndex: method. These two “primitive” methods provide basic access to a string object.Most use of strings, however, is at a higher level, with the strings being treated as single entities: You compare strings against one another, search them for substrings, combine them into new strings, and so on. If you need to access string objects character by character, you must understand the Unicode character encoding, specifically issues related to composed character sequences. For details see The Unicode Standard, Version 4.0 (The Unicode Consortium, Boston: Addison-Wesley, 2003, ISBN 0-321-18578-1) and the Unicode Consortium web site: http://www.unicode.org/. See also Characters and Grapheme Clusters in String Programming Guide.Localized string comparisons are based on the Unicode Collation Algorithm, as tailored for different languages by CLDR (Common Locale Data Repository). Both are projects of the Unicode Consortium.";
    
//    text = [text substringToIndex:10];
    /*
    NSRange range = [text rangeOfString:@"These two “primitive” methods"];
    
    if (range.location != NSNotFound) {
        text = [text substringToIndex:range.location];
    }
    
    NSLog(@"%@", text);
    */
    
    /*
    NSRange searchRange = NSMakeRange(0, text.length);
    
    NSInteger counter = 0;
    
    while (YES) {
        NSRange range = [text rangeOfString:@"Unicode" options:0 range:searchRange];
        
        if (range.location != NSNotFound) {
            NSInteger index = range.location + range.length;
            
            searchRange.location = index;
            
            searchRange.length = [text length] - index;
            
            counter++;
        } else {
            break;
        }
        
    }
     */
    
//    text = [text stringByReplacingOccurrencesOfString:@"Unicode" withString:@"Unicef"];
    
    NSLog(@"%@", text);
    
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
