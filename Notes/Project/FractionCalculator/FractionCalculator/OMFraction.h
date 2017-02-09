//
//  OMFraction.h
//  FractionCalculator
//
//  Created by Admin on 6/21/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OMFraction : NSObject {
    
    NSInteger numerator;
    NSInteger denumirator;
    
}

@property (assign, nonatomic) NSInteger numerator, denumirator;

- (void)print;
- (void)setTo:(NSInteger)n over:(NSInteger)d;
- (OMFraction *)add:(OMFraction *)f;
- (OMFraction *)subtract:(OMFraction *)f;
- (OMFraction *)multiply:(OMFraction *)f;
- (OMFraction *)divide:(OMFraction *)f;

- (void)reduce;
- (double)convertToNum;
- (NSString *)convertToString;

@end
