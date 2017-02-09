//
//  OMAnimal.h
//  AnimalInfo
//
//  Created by Admin on 3/30/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OMAnimal : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *color;
@property (assign, nonatomic) NSInteger age;

- (void)voice;

@end
