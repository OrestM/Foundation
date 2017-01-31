//
//  Animal.m
//  Animal
//
//  Created by Admin on 11/1/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (id)initWithAnimal:(NSString *)name andAge:(NSInteger)age andColor:(NSString *)color {
    self = [super init];
    if (self) {
        Name = name;
        Age = age;
        Color = color;
    }
    return self;
}

- (void)_Voice {
    NSLog(@"Woof!");
}

- (void)_Run {
    NSLog(@"%@ very likes run.", Name);
}

@end


