//
//  OMBonusView.h
//  DelegateTapGestore
//
//  Created by Admin on 5/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OMBonusViewDelegate;

@interface OMBonusView : UIView

@property (weak, nonatomic) id<OMBonusViewDelegate> delegate;

- (void)addGestureRecognizer:(UIView *)touchView;

@end

@protocol OMBonusViewDelegate <NSObject>

- (void)didPressTap;

@end
