//
//  OMStudent.m
//  MultiThreading
//
//  Created by Admin on 6/6/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMStudent.h"

@implementation OMStudent

- (id)initWithName:(NSString *)name {
    
    self = [super init];
    if (self) {
        
        self.name = name;
        self.randomNumber = arc4random_uniform(100);
        [self guessTheNumber:self.randomNumber];
        
        NSLog(@"%@ must guess: %i", self.name, self.randomNumber);
        
    }
    return self;
}

- (void)guessTheNumber:(NSInteger)number {
    
    NSLog(@"You want to guess number between 0 : 100");
    
    NSLog(@"Started");
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        double currentTime = CACurrentMediaTime();
        
        for (int i = 0; i <= 100; i++) {
            
            NSNumber *guessNumber = @(i);
            
            NSMutableArray *numbers = [NSMutableArray new];
            
            [numbers addObject:guessNumber];
            
            if (number == [guessNumber integerValue]) {
                
                NSLog(@"%@ find number: %i", self.name, number);
                NSLog(@"%@ finished at %f", self.name, CACurrentMediaTime() - currentTime);
                
            }
            
        }
        
    });
    
}

@end
