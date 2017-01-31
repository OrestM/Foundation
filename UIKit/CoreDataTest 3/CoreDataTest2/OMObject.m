//
//  OMObject.m
//  CoreDataTest2
//
//  Created by Admin on 3/21/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMObject.h"

@implementation OMObject

// Insert code here to add functionality to your managed object subclass

- (BOOL)validateForDelete:(NSError **)error {
    
    NSLog(@"%@ validateForDelete", NSStringFromClass([self class]));
    
    return YES;
    
}

@end
