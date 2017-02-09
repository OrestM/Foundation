//
//  Dog.h
//  Animal
//
//  Created by Admin on 11/1/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

@interface Dog : Animal {
    NSInteger Paws;
}

- (id)initWithFavorites:(NSString*)name andAge:(NSInteger)age andColor:(NSString*)color andPaws:(NSInteger)paws;

- (void)_namePaws;

@end
