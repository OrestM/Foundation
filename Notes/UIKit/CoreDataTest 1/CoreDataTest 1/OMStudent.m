//
//  OMStudent.m
//  CoreDataTest 1
//
//  Created by Admin on 3/20/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMStudent.h"

@implementation OMStudent

// Insert code here to add functionality to your managed object subclass

- (void)setFirstName:(NSString *)firstName {
    
    [self willChangeValueForKey:@"firstName"];
    [self setPrimitiveValue:firstName forKey:@"firstName"];
    [self didChangeValueForKey:@"firstName"];
    
//    NSLog(@"Set firstName");
    
}

- (NSString *)firstName {
    
    NSString *string = nil;
    
    [self willAccessValueForKey:@"firstName"];
    string = [self primitiveValueForKey:@"firstName"];
    [self didAccessValueForKey:@"firstName"];
 
//    NSLog(@"Get firstName");
    
    return string;
}

/*
- (BOOL)validateValue:(id  _Nullable __autoreleasing *)value forKey:(NSString *)key error:(NSError * _Nullable __autoreleasing *)error {
    
    if ([key isEqualToString:@"lastName"]) {
        *error = [NSError errorWithDomain:@"Bad lastName" code:123 userInfo:nil];
    }
    
    return NO;
    
}
*/
@end