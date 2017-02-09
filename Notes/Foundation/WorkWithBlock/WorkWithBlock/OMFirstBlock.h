//
//  OMFirstBlock.h
//  WorkWithBlock
//
//  Created by Admin on 6/2/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OMFirstBlock : NSObject

- (void)doSomthing:(void(^)(void))block;

@end
