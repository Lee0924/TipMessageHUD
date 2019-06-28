//
//  TipMessageHUD.h
//  TipMessageHUD
//
//  Created by iOS on 2019/6/28.
//  Copyright © 2019 TipMessageHUD. All rights reserved.
//


#import <MBProgressHUD/MBProgressHUD.h>
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, TipMessageHUDStatus) {
    
    /** 成功 */
    TipMessageHUDStatusSuccess,
    
    /** 失败 */
    TipMessageHUDStatusError,
    
    /** 提示 */
    TipMessageHUDStatusInfo,
    
    /** 等待 */
    TipMessageHUDStatusWaitting
};

@interface TipMessageHUD : MBProgressHUD
/**
 *  是否正在显示
 */
@property (nonatomic, assign, getter=isShowNow) BOOL showNow;

/** 返回一个 HUD 的单例 */
+ (instancetype)sharedHUD;

/** 在 view 上添加一个 HUD */
+ (void)showStatus:(TipMessageHUDStatus)status text:(NSString *)text superView:(UIView *)superView;


#pragma mark - 建议使用的方法

/** 在 view 上添加一个只显示文字的 HUD */
+ (void)showMessage:(NSString *)text superView:(UIView *)superView;

/** 在 view 上添加一个提示`信息`的 HUD */
+ (void)showInfoMsg:(NSString *)text superView:(UIView *)superView;

/** 在 view 上添加一个提示`失败`的 HUD */
+ (void)showFailure:(NSString *)text superView:(UIView *)superView;

/** 在 view 上添加一个提示`成功`的 HUD */
+ (void)showSuccess:(NSString *)text superView:(UIView *)superView;

/** 在 view 上添加一个提示`等待`的 HUD, 需要手动关闭 */
+ (void)showLoading:(NSString *)text superView:(UIView *)superView;

/** 手动隐藏 HUD */
+ (void)hide;

@end

NS_ASSUME_NONNULL_END
