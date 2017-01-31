//
//  Hospital.h
//  Protocol
//
//  Created by Admin on 2/2/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Patient;

@interface Hospital : NSObject 

@end

@protocol Patient <NSObject>

@property (strong, nonatomic) NSString* name;

- (BOOL)areYouOkey;
- (void)takePill;
- (void)makeShots;

@optional

- (NSString*)howYourFamily;
- (NSString*)howYourJob;

@end
