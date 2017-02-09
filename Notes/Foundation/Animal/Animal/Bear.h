//
//  Bear.h
//  Animal
//
//  Created by Admin on 11/2/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

@interface Bear : Animal {
    NSString* Hunter;
}

- (id)initWithFavorites:(NSString *)name andAge:(NSInteger)age andColor:(NSString *)color andHunter:(NSString*)hunt;

- (void)_hunter;

@end
