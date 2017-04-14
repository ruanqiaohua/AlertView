//
//  ZQAlertViewController.m
//  IQEQOnline
//
//  Created by 阮巧华 on 2017/3/22.
//  Copyright © 2017年 iqeq. All rights reserved.
//

#import "ZQAlertViewController.h"
#import "UIView+Border.h"

@interface ZQAlertViewController ()

@property (nonatomic, strong) UIView *alertView;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, copy) ButtonCb sureCb;
@property (nonatomic, copy) ButtonCb cancelCb;
@property (nonatomic) ZQAlertButtonStyle buttonStyle;

@end

@implementation ZQAlertViewController

+ (instancetype)alertViewWithTitle:(NSString *)title buttonStyle:(ZQAlertButtonStyle)buttonStyle {
    
    ZQAlertViewController *alert = [[ZQAlertViewController alloc] init];
    alert.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [alert.view setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.4]];
    // alertView
    alert.alertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500/2, 360/2)];
    alert.alertView.center = alert.view.center;
    alert.alertView.backgroundColor = [UIColor whiteColor];
    alert.alertView.layer.cornerRadius = 10;
    alert.alertView.layer.masksToBounds = YES;
    alert.alertView.userInteractionEnabled = YES;
    [alert.view addSubview:alert.alertView];
    // titleLabel
    alert.titleLabel = [[UILabel alloc] init];
    alert.titleLabel.font = [UIFont systemFontOfSize:16];
    alert.titleLabel.textColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.00];
    alert.titleLabel.numberOfLines = 0;
    alert.titleLabel.attributedText = [alert mutableString:title];
    [alert.titleLabel sizeToFit];
    [alert.alertView addSubview:alert.titleLabel];

    if (CGRectGetWidth(alert.titleLabel.frame)> CGRectGetWidth(alert.alertView.frame)) {
        
        alert.alertView.bounds = CGRectMake(0, 0, CGRectGetWidth(alert.titleLabel.frame)+20, CGRectGetHeight(alert.alertView.frame));
    }
    alert.titleLabel.center = CGPointMake(CGRectGetWidth(alert.alertView.frame)/2, CGRectGetHeight(alert.alertView.frame)/2-60/2);

    alert.buttonStyle = buttonStyle;
    return alert;
}

- (NSMutableAttributedString *)mutableString:(NSString *)title {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:title];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:10.0f];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [title length])];
    
    return attributedString;
}

- (void)show {
    
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootViewController presentViewController:self animated:NO completion:nil];
}

- (void)ZQAlertSureBtnAction:(UIButton *)sender {
    
    [self dismiss];
    if (self.sureCb) {
        self.sureCb();
    }
}

- (void)ZQAlertCancelBtnAction:(UIButton *)sender {
    
    [self dismiss];
    if (self.cancelCb) {
        self.cancelCb();
    }
}

- (void)dismiss {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (UIButton *)addSureButton:(NSString *)title cb:(ButtonCb)cb {
    
    
    self.sureButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.sureButton setTitle:title forState:UIControlStateNormal];
    CGFloat buttonWidth = CGRectGetWidth(_alertView.frame)/2;
    CGFloat space = 0;
    CGFloat buttonHeight = 88/2;
    switch (self.buttonStyle) {
        case ZQAlertButtonStyleCustom:
        {
            space = 30/2;
            buttonWidth = (CGRectGetWidth(_alertView.frame)-30/2*3)/2;
            self.sureButton.backgroundColor = [UIColor orangeColor];
            self.sureButton.layer.cornerRadius = 6.0;
            self.sureButton.layer.masksToBounds = YES;
            [self.sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
            break;
        case ZQAlertButtonStyleSystem:
        {
            self.sureButton.backgroundColor = [UIColor whiteColor];
            buttonWidth = CGRectGetWidth(_alertView.frame)/2;
            [self.sureButton setTitleColor:[UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:1.00] forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
    
    // sureBtn
    self.sureButton.frame = CGRectMake(space, CGRectGetHeight(_alertView.frame)-space-buttonHeight, buttonWidth, buttonHeight);
    [self.sureButton addTarget:self action:@selector(ZQAlertSureBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.alertView addSubview:self.sureButton];

    // 顶部加一条线区分
    if (self.buttonStyle == ZQAlertButtonStyleSystem) {
        [self.sureButton addTopBorderWithColor:[UIColor colorWithRed:0.90 green:0.90 blue:0.90 alpha:1.00] andWidth:0.5];
    }
    if (cb) {
        self.sureCb = cb;
    }
    return self.sureButton;
}

- (UIButton *)addCancelButton:(NSString *)title cb:(ButtonCb)cb {
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    CGFloat buttonWidth = CGRectGetWidth(_alertView.frame)/2;
    CGFloat space = 0;
    CGFloat buttonHeight = 88/2;
    switch (self.buttonStyle) {
        case ZQAlertButtonStyleCustom:
        {
            space = 30/2;
            buttonWidth = (CGRectGetWidth(_alertView.frame)-30/2*3)/2;
            self.cancelButton.backgroundColor = [UIColor orangeColor];
            self.cancelButton.layer.cornerRadius = 6.0;
            self.cancelButton.layer.masksToBounds = YES;
            [self.cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
            break;
        case ZQAlertButtonStyleSystem:
        {
            self.cancelButton.backgroundColor = [UIColor colorWithRed:1.00 green:0.76 blue:0.32 alpha:1.00];
            buttonWidth = CGRectGetWidth(_alertView.frame)/2;
            [self.cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }

    // cancelBtn
    self.cancelButton.frame = CGRectMake(space+buttonWidth+space, CGRectGetHeight(_alertView.frame)-space-buttonHeight, buttonWidth, buttonHeight);
    [self.cancelButton setTitle:title forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(ZQAlertCancelBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.alertView addSubview:self.cancelButton];

    if (cb) {
        self.cancelCb = cb;
    }
    return self.cancelButton;
}

@end
