//
//  PersonModel.m
//  OMListOfPeople
//
//  Created by Orest Mykha on 2/4/17.
//  Copyright © 2017 Orest Mykha. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

+ (instancetype)sharedManager {
    static PersonModel *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[PersonModel alloc] initPrivate];
    });
    return sharedManager;
}

- (instancetype) initPrivate {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        @throw [NSException exceptionWithName:@"Singltone" reason:@"This class is singltone" userInfo:nil];
    }
    return self;
}

- (NSDictionary *)getInfoOfPerson {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"JsonListPeople" ofType:@"json"];
    NSData *personData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    //convert JSON NSData to a usable NSDictionary
    NSError *error;
    NSDictionary *personInfo = [NSJSONSerialization JSONObjectWithData:personData
                                                          options:NSJSONReadingMutableContainers
                                                            error:&error];
    
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    } else {
        return personInfo;
    }
    
    return nil;
    
}

@end
