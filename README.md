# AlertView
自定义弹窗

样式一


![Image](https://github.com/ruanqiaohua/AlertView/blob/master/Simulator%20Screen%20Shot%202017年4月14日%20下午5.26.21.png)


样式二


![Image](https://github.com/ruanqiaohua/AlertView/blob/master/Simulator%20Screen%20Shot%202017年4月14日%20下午5.26.26.png)


使用方法
```Objective-C

#import "ZQAlertViewController.h"

- (IBAction)alertBtnAction:(UIButton *)sender {
    
    if (sender == _alert1) {
        
        ZQAlertViewController *alertController = [ZQAlertViewController alertViewWithTitle:@"Try to be a rainbow in someone’s cloud.\n当乌云萦绕心头，我愿成为你的彩虹。" buttonStyle:ZQAlertButtonStyleCustom];
        [alertController addSureButton:@"是" cb:nil];
        [alertController addCancelButton:@"否" cb:nil];
        [alertController show];
    } else {
        
        ZQAlertViewController *alertController = [ZQAlertViewController alertViewWithTitle:@"Try to be a rainbow in someone’s cloud.\n当乌云萦绕心头，我愿成为你的彩虹。" buttonStyle:ZQAlertButtonStyleSystem];
        [alertController addSureButton:@"是" cb:nil];
        [alertController addCancelButton:@"否" cb:nil];
        [alertController show];
    }
}
```
