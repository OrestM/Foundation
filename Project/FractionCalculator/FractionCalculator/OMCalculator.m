//
//  OMCalculator.m
//  FractionCalculator
//
//  Created by Admin on 6/21/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMCalculator.h"

@implementation OMCalculator

@synthesize operand1, operand2, accumulator;

- (instancetype)init
{
    self = [super init];
    if (self) {
        operand1 = [OMFraction new];
        operand2 = [OMFraction new];
        accumulator = [OMFraction new];
    }
    return self;
}

- (OMFraction *)performOperation:(char)op {
    
    OMFraction *result;
    
    switch (op) {
        case '+':
            result = [operand1 add:operand2];
            break;
            
        case '-':
            result = [operand1 subtract:operand2];
            break;
            
        case '*':
            result = [operand1 multiply:operand2];
            break;
            
        case '/':
            result = [operand1 divide:operand2];
            break;
            
        default:
            break;
    }
    
    accumulator.numerator = result.numerator;
    accumulator.denumirator = result.denumirator;
    
    return accumulator;
    
}

- (void)clear {
    
    if (accumulator) {
        
        accumulator.numerator = 0;
        accumulator.denumirator = 0;
        
    }
    
}

@end
