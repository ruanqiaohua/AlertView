//
//  UIView+Border.h
//  IQEQOnline
//
//  Created by 阮巧华 on 2017/4/14.
//  Copyright © 2017年 iqeq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Border)

-(void)addBottomBorderWithColor:(UIColor *) color andWidth:(CGFloat) borderWidth;
-(void)addLeftBorderWithColor:(UIColor *) color andWidth:(CGFloat) borderWidth;
-(void)addRightBorderWithColor:(UIColor *) color andWidth:(CGFloat) borderWidth;
-(void)addTopBorderWithColor:(UIColor *) color andWidth:(CGFloat) borderWidth;

@end
