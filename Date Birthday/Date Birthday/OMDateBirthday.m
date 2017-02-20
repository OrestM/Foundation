//
//  OMDateBirthday.m
//  Date Birthday
//
//  Created by Admin on 3/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMDateBirthday.h"
#import "OMAge.h"

@implementation OMDateBirthday

- (NSInteger)dateOfMyBirthday {
    
    return 1991;

}

- (NSString *)calculateDateBirthday {
    
    OMAge *objAge = [[OMAge alloc] init];
    
    self.dateOfMyBirthday = self.dateOfMyBirthday + objAge.age;
    
    NSInteger mounth = arc4random_uniform(11) + 1;
    NSInteger day = arc4random_uniform(30) + 1;
    
    return [NSString stringWithFormat:@"%ld/%ld/%ld", mounth, day, self.dateOfMyBirthday];
    
}

- (void)printCurrentDate {
    
    NSLog(@"\nYour birth of date: %@", [self calculateDateBirthday]);
    
}

@end
