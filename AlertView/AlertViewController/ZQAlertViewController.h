//
//  ZQAlertViewController.h
//  IQEQOnline
//
//  Created by 阮巧华 on 2017/3/22.
//  Copyright © 2017年 iqeq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonCb)();
@interface ZQAlertViewController : UIViewController

typedef NS_ENUM(NSInteger, ZQAlertButtonStyle) {
    ZQAlertButtonStyleCustom = 0,
    ZQAlertButtonStyleSystem
};

/**
 初始化

 @param title 标题
 @param buttonStyle 按钮样式
 */
+ (instancetype)alertViewWithTitle:(NSString *)title buttonStyle:(ZQAlertButtonStyle)buttonStyle;
/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 确定按钮的点击回调 */
- (UIButton *)addSureButton:(NSString *)title cb:(ButtonCb)cb;
/** 取消按钮的点击回调 */
- (UIButton *)addCancelButton:(NSString *)title cb:(ButtonCb)cb;
/** 显示 */
- (void)show;

@end
