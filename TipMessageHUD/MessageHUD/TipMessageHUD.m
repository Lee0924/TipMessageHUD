//
//  TipMessageHUD.m
//  TipMessageHUD
//
//  Created by iOS on 2019/6/28.
//  Copyright © 2019 TipMessageHUD. All rights reserved.
//

#import "TipMessageHUD.h"
// 背景视图的宽度/高度
#define BGVIEW_WIDTH 100.0f
// 文字大小
#define TEXT_FONT 14.0f

@implementation TipMessageHUD
+ (instancetype)sharedHUD {
    static TipMessageHUD *hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        hud = [[TipMessageHUD alloc] init];
    });
    return hud;
}
+ (void)showStatus:(TipMessageHUDStatus)status text:(NSString *)text superView:(UIView *)superView{
    TipMessageHUD *hud = [TipMessageHUD sharedHUD];
    [hud showAnimated:YES];
    [hud setShowNow:YES];
    hud.label.text = text;
    [hud setRemoveFromSuperViewOnHide:YES];
    [hud.label setFont:[UIFont systemFontOfSize:TEXT_FONT]];
    [hud setMinSize:CGSizeMake(BGVIEW_WIDTH, BGVIEW_WIDTH)];
    [superView addSubview:hud];
//    hud.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];整个视图的蒙层
//    hud.bezelView.backgroundColor = [UIColor redColor];       包含文字和图片的小view视图
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"TipMessageHUD" ofType:@"bundle"];

    switch (status) {
            case TipMessageHUDStatusSuccess: {
                NSString *sucPath = [bundlePath stringByAppendingPathComponent:@"hud_success@2x.png"];
                UIImage *sucImage = [UIImage imageWithContentsOfFile:sucPath];
                
                hud.mode = MBProgressHUDModeCustomView;
                UIImageView *sucView = [[UIImageView alloc] initWithImage:sucImage];
                hud.customView = sucView;
                [hud hideAnimated:YES afterDelay:2.0f];
            } break;
            
            case TipMessageHUDStatusError: {
                NSString *errPath = [bundlePath stringByAppendingPathComponent:@"hud_error@2x.png"];
                UIImage *errImage = [UIImage imageWithContentsOfFile:errPath];
                
                hud.mode = MBProgressHUDModeCustomView;
                UIImageView *errView = [[UIImageView alloc] initWithImage:errImage];
                hud.customView = errView;
                [hud hideAnimated:YES afterDelay:2.0f];
            } break;
            
            case TipMessageHUDStatusWaitting: {
                hud.mode = MBProgressHUDModeIndeterminate;
            } break;
            
            case TipMessageHUDStatusInfo: {
                NSString *infoPath = [bundlePath stringByAppendingPathComponent:@"hud_info@2x.png"];
                UIImage *infoImage = [UIImage imageWithContentsOfFile:infoPath];
                
                hud.mode = MBProgressHUDModeCustomView;
                UIImageView *infoView = [[UIImageView alloc] initWithImage:infoImage];
                hud.customView = infoView;
                [hud hideAnimated:YES afterDelay:2.0f];
            } break;
            
        default:
            break;
    }
}

+ (void)showMessage:(NSString *)text superView:(UIView *)superView {
    TipMessageHUD *hud = [TipMessageHUD sharedHUD];
    [hud showAnimated:YES];
    [hud setShowNow:YES];
    [hud.label setText:text];
    [hud setMinSize:CGSizeZero];
    [hud setMode:MBProgressHUDModeText];
    [hud setRemoveFromSuperViewOnHide:YES];
    [hud.label setFont:[UIFont systemFontOfSize:TEXT_FONT]];
    
    [superView addSubview:hud];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+ (void)showInfoMsg:(NSString *)text superView:(UIView *)superView{
    [self showStatus:TipMessageHUDStatusInfo text:text  superView:superView];
}

+ (void)showFailure:(NSString *)text superView:(UIView *)superView{
    [self showStatus:TipMessageHUDStatusError text:text superView:superView];
}

+ (void)showSuccess:(NSString *)text superView:(UIView *)superView {
    [self showStatus:TipMessageHUDStatusSuccess text:text superView:superView];
}

+ (void)showLoading:(NSString *)text superView:(UIView *)superView {
    [self showStatus:TipMessageHUDStatusWaitting text:text superView:superView];
}

+ (void)hide {
    [[TipMessageHUD sharedHUD] setShowNow:NO];
    [[TipMessageHUD sharedHUD] hideAnimated:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
