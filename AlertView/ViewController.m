//
//  ViewController.m
//  AlertView
//
//  Created by 阮巧华 on 2017/4/14.
//  Copyright © 2017年 阮巧华. All rights reserved.
//

#import "ViewController.h"
#import "ZQAlertViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *alert1;
@property (weak, nonatomic) IBOutlet UIButton *alert2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
