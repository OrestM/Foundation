//
//  Cat.h
//  Animal
//
//  Created by Admin on 11/2/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

@interface Cat : Animal {
    NSInteger Sleep;
}

- (id)initWithFavorites:(NSString *)name andAge:(NSInteger)age andColor:(NSString *)color andSleep:(NSInteger)sleep;

- (void)_nameSleep;

@end
