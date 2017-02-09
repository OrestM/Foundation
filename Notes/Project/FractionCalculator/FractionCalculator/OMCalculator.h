//
//  OMCalculator.h
//  FractionCalculator
//
//  Created by Admin on 6/21/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OMFraction.h"

@interface OMCalculator : NSObject {
    
    OMFraction *operand1;
    OMFraction *operand2;
    OMFraction *accumulator;
    
}

@property (strong, nonatomic) OMFraction *operand1, *operand2, *accumulator;

- (OMFraction *)performOperation:(char)op;
- (void)clear;

@end
