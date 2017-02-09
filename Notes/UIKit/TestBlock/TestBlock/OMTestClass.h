//
//  OMTestClass.h
//  TestBlock
//
//  Created by Admin on 6/6/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef NSString *(^TestBlock)(void);

@interface OMTestClass : NSObject

- (void)getText:(NSString *(^)(void))block;

@end
