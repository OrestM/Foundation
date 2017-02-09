//
//  Animal.h
//  Animal
//
//  Created by Admin on 11/1/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject {
    NSString* Name;
    NSInteger Age;
    NSString* Color;
}

- (id)initWithAnimal:(NSString*)name andAge:(NSInteger)age andColor:(NSString*)color;

- (void)_Voice;

- (void)_Run;

@end


