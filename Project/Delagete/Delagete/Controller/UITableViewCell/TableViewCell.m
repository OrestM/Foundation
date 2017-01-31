//
//  TableViewCell.m
//  Delagete
//
//  Created by Admin on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (IBAction)press:(id)sender {
    if ([_delegate respondsToSelector:@selector(pressButton:) ]) {
        [_delegate pressButton:_click];
        
    }
}

@end
