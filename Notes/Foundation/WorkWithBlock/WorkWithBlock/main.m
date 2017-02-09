//
//  main.m
//  WorkWithBlock
//
//  Created by Admin on 2/1/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OMFirstBlock.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        void(^simpleBlock)(void) = ^ {
            NSLog(@"This is a Block");
        };
        simpleBlock();
        
        double(^multiplyTwoValues)(double, double) = ^(double firstValue, double secondValue) {
            return firstValue * secondValue;
        };
        double result = multiplyTwoValues(2, 6);
        NSLog(@"The result is %f", result);
        
        __block int anInteger = 42;
        
        void(^testBlock)(void) = ^ {
            NSLog(@"anInteger is %i", anInteger);
        };
        
        anInteger = 84;
        
        testBlock();
        
    }
    
    OMFirstBlock *objBlock = [OMFirstBlock new];
    [objBlock doSomthing:^{
        NSLog(@"This is block");
    }];
    
    return 0;
    
}
