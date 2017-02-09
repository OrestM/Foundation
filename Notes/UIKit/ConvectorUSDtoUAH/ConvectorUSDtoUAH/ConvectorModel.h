//
//  ConvectorModel.h
//  ConvectorUSDtoUAH
//
//  Created by Admin on 11/17/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConvectorModel : NSObject 

+ (ConvectorModel*)shareManager;

- (double)convertUsdtoUah:(double)usd;
- (double)convertUahtoUsd:(double)uah;

@end
