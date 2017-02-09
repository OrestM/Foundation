//
//  main.m
//  Fibonacii
//
//  Created by Admin on 6/28/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        int maxNumber = 15;
        
        NSMutableArray *arrayFibonaciiNumbers = [NSMutableArray new];
        
        for (int n = 0; n <= maxNumber; n++) {
            
            if (n < 2) {
                
                [arrayFibonaciiNumbers addObject:[NSString stringWithFormat:@"%i", n]];
                continue;
                
            } else {
                
                int fibonacii = [[arrayFibonaciiNumbers objectAtIndex:n - 2] intValue] + [[arrayFibonaciiNumbers objectAtIndex:n - 1] intValue];
                [arrayFibonaciiNumbers addObject:[NSString stringWithFormat:@"%i", fibonacii]];
                
            }
            
        }
        
        NSLog(@"%@", arrayFibonaciiNumbers);
        
    }
    return 0;
}
