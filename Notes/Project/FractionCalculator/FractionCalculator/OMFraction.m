//
//  OMFraction.m
//  FractionCalculator
//
//  Created by Admin on 6/21/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMFraction.h"

@implementation OMFraction

@synthesize numerator, denumirator;

- (void)setTo:(NSInteger)n over:(NSInteger)d {
    
    numerator = n;
    denumirator = d;
    
}

- (void)print {
    
    NSLog(@"%li/%li", numerator, denumirator);
    
}

- (double)convertToNum {
    
    if (denumirator != 0) {
        
        return (double)numerator / denumirator;
        
    } else {
        
        return 1.0f;
        
    }
    
}

- (NSString *)convertToString {
    
    if (numerator == denumirator) {
        
        if (numerator == 0) {
            
            return @"0";
            
        } else {
            
            return @"1";
            
        }
        
    }
    
    if (denumirator == 1) {
        
        return [NSString stringWithFormat:@"%li", numerator];
        
    } else {
        
        return [NSString stringWithFormat:@"%li/%li", numerator, denumirator];
        
    }
    
}

- (OMFraction *)add:(OMFraction *)f {
    
    OMFraction *result = [OMFraction new];
    NSInteger resultNum, resultDenum;
    
    resultNum = numerator * f.denumirator + denumirator * f.numerator;
    resultDenum = denumirator * f.denumirator;
    
    [result setTo:resultNum over:resultDenum];
    [result reduce];
    return result;
    
}

- (OMFraction *)subtract:(OMFraction *)f {
    
    OMFraction *result = [OMFraction new];
    NSInteger resultNum, resultDenum;
    
    resultNum = numerator * f.denumirator - denumirator * f.numerator;
    resultDenum = denumirator * f.denumirator;
    
    [result setTo:resultNum over:resultDenum];
    [result reduce];
    return result;
    
}

- (OMFraction *)multiply:(OMFraction *)f {
    
    OMFraction *result = [OMFraction new];
    
    [result setTo:numerator * f.numerator over:denumirator * f.denumirator];
    [result reduce];
    return result;
    
}

- (OMFraction *)divide:(OMFraction *)f {
    
    OMFraction *result = [OMFraction new];
    
    [result setTo:numerator * f.denumirator over:denumirator * f.numerator];
    [result reduce];
    return result;
    
}


- (void)reduce {
    
    NSInteger u = numerator;
    NSInteger v = denumirator;
    NSInteger temp;
    
    if (u == 0) {
        
        return;
        
    } else if (u < 0) {
    
        u = -u;
        
    }
    
    while (v != 0) {
        
        temp = u % v;
        u = v;
        v = temp;
        
    }
    
    numerator /= u;
    denumirator /= u;
    
}

@end
