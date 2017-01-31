//
//  Dancer.h
//  Protocol
//
//  Created by Admin on 2/2/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hospital.h"

@interface Dancer : NSObject <Patient>

@property (strong, nonatomic) NSString* favoriteDance;
@property (strong, nonatomic) NSString* name;

- (void)dance;

@end
