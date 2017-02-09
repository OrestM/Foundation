//
//  OMFirstBlock.m
//  WorkWithBlock
//
//  Created by Admin on 6/2/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMFirstBlock.h"

@implementation OMFirstBlock

- (void)doSomthing:(void(^)(void))block {
    
    block();
    
}

@end
