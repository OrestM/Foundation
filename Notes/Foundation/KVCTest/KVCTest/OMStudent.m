//
//  OMStudent.m
//  KVCTest
//
//  Created by Admin on 3/18/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMStudent.h"

@implementation OMStudent

- (void)setName:(NSString *)name {
    
    _name = name;
    
    NSLog(@"Student setName %@", name);
    
}

- (void)setAge:(NSInteger)age {
 
    _age = age;
    
    NSLog(@"Student setAge %li", age);
    
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Student: %@ %li", self.name, self.age];
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    NSLog(@"Student setValue:%@ forKey:%@", value, key);
    
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    NSLog(@"setValueForUndefinedKey");
    
}

- (id)valueForUndefinedKey:(NSString *)key {
    
    NSLog(@"valueForUndefinedKey");
    
    return nil;
    
}

- (void)changeName {
    
    [self willChangeValueForKey:@"name"];
    _name = @"FakeName";
    [self didChangeValueForKey:@"name"];
    
}
/*
- (BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKey:(NSString *)inKey error:(out NSError * _Nullable __autoreleasing *)outError {
    
    if ([inKey isEqualToString:@"name"]) {
        
        NSString *newName = *ioValue;
        
        if (![newName isKindOfClass:[NSString class]]) {
            
            *outError = [[NSError alloc] initWithDomain:@"Not string" code:123 userInfo:nil];
            
            return NO;
            
        }
        
        if ([newName rangeOfString:@"1"].location != NSNotFound) {
            
            *outError = [[NSError alloc] initWithDomain:@"Has number" code:324 userInfo:nil];
            
            return NO;
            
        }
        
    }
    
    return YES;
}
*/

/*
- (BOOL)validateName:(inout id  _Nullable __autoreleasing *)ioValue error:(out NSError * _Nullable __autoreleasing *)outError {
    
    NSLog(@"AAAA");
    
    return YES;
    
}
*/
@end
