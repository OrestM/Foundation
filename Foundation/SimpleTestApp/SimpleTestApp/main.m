//
//  main.m
//  SimpleTestApp
//
//  Created by Admin on 12/15/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        /*
        int i = 1;
        NSLog(@"...Testing");
        NSLog(@"... %i", i);
        NSLog(@"... %i", i + 1);
        NSLog(@"... %i", i + 2);
        
        int sum;
        sum = 25 + 37 - 19;
        NSLog(@"The aswer is %i", sum);
        
        int answer, result;
        answer = 100;
        result = answer - 10;
        NSLog(@"The result is %i\n", result + 5);
        */
        
        
        int j = 10;
        NSLog(@"%p", &j);
        
        int k = j;
        k = 5;
        NSLog(@"%d", k);
        
        NSLog(@"j = %d,\n k = %d", j, k);
        
        int *b;
        b = &j;
        NSLog(@"b = %d", *b);
        
        NSLog(@"j = %d,\n k = %d,\n b = %p", j, k, b);
        
        
        NSString *str;
        
        while (YES) {
            NSLog(@"Hello str %@", str);
            break;
        }
        */
    return 0;
        
    }
}
