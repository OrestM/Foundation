//
//  PersonModel.h
//  OMListOfPeople
//
//  Created by Orest Mykha on 2/4/17.
//  Copyright © 2017 Orest Mykha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonModel : NSObject

+ (instancetype)sharedManager;
- (NSDictionary *)getInfoOfPerson;

@end
