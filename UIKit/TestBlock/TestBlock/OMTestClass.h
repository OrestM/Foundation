//
//  OMTestClass.h
//  TestBlock
//
//  Created by Admin on 6/6/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TestBlock)(NSString *text);

@interface OMTestClass : NSObject

- (void)getText:(TestBlock)text;

@end
