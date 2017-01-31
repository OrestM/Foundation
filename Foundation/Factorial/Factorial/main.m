//
//  main.m
//  Factorial
//
//  Created by Admin on 6/28/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

int factorial(int value);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"6! = %i", factorial(6));
//        
//        int factorial = 1;
//        
//        for (int y = 1; y <= 10; y++) {
//            
//            factorial *= y;
//            
//            NSLog(@"%i! = %d", y, factorial);
//        }
//
        int n, i;
        int factorial;
        
        for(n = 1; n < 11; n++) {
            i = n - 1;
            factorial = n;
            while (i >= 1) {
                factorial *= i;
                --i;
            }
            NSLog(@"%i! = %i", n, factorial);
        }
        
    }
    
    return 0;
}

int factorial(int value) {
    
    if (value == 1) {
        return value;
    } else {
        return value = value * factorial(value-1);
    }
    
}
