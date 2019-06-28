//
//  ViewController.m
//  TipMessageHUD
//
//  Created by iOS on 2019/6/28.
//  Copyright © 2019 TipMessageHUD. All rights reserved.
//

#import "ViewController.h"
#import "MessageHUD/TipMessageHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btn1:(id)sender {
    [TipMessageHUD showFailure:@"失败" superView:self.view];
}

- (IBAction)btn2:(id)sender {
    [TipMessageHUD showInfoMsg:@"提示信息" superView:self.view];
}
- (IBAction)btn3:(id)sender {
    [TipMessageHUD showLoading:@"等待，手动关闭" superView:self.view];
}
- (IBAction)btn4:(id)sender {
    [TipMessageHUD showMessage:@"只显示文字" superView:self.view];
}
- (IBAction)btn5:(id)sender {
    [TipMessageHUD showSuccess:@"成功" superView:self.view];
}
- (IBAction)btn6:(id)sender {
    [TipMessageHUD hide];
}

@end
