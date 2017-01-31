//
//  ConvectorModel.m
//  ConvectorUSDtoUAH
//
//  Created by Admin on 11/17/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "ConvectorModel.h"

@implementation ConvectorModel

+ (ConvectorModel*)shareManager {
    
    static ConvectorModel *object;
    
    if (object == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            object = [[ConvectorModel alloc]init];
        });
    }
    
    return object;
    
}

- (double)convertUsdtoUah:(double)usd {
    
    return usd * 24.6;
    
}

- (double)convertUahtoUsd:(double)uah {
    
    return uah / 24.6;
    
}

@end
