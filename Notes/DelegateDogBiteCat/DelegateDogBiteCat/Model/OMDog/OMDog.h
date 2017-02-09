//
//  OMDog.h
//  DelegateDogBiteCat
//
//  Created by Admin on 5/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OMCat;

@protocol OMDogDelegate;

@interface OMDog : NSObject

@property (weak, nonatomic) id<OMDogDelegate> delegate;

@property (copy, nonatomic) NSString *name;

- (void)dogBiteCat:(OMCat *)cat;

@end

@protocol OMDogDelegate <NSObject>

- (void)showBiteAlert:(OMDog *)dog andCat:(OMCat *)cat;

@end