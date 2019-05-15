//
//  BMPayModule.m
//  WeexDemo
//
//  Created by XHY on 2017/2/7.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMPayModule.h"
#import "BMPayManager.h"
#import <WechatOpenSDK/WXApi.h>
#import <WeexPluginLoader/WeexPluginLoader.h>

WX_PlUGIN_EXPORT_MODULE(bmWXPay, BMPayModule)

@interface BMPayModule ()
@property (nonatomic, assign) BOOL WXAppIsInstall;
@end

@implementation BMPayModule

@synthesize weexInstance;

WX_EXPORT_METHOD_SYNC(@selector(isInstallWXApp))
WX_EXPORT_METHOD_SYNC(@selector(initWX:))
WX_EXPORT_METHOD(@selector(pay:callback:))

/** 判断是否安装了微信 */
-(BOOL)isInstallWXApp
{
    dispatch_sync(dispatch_get_main_queue(), ^{
        self.WXAppIsInstall = [WXApi isWXAppInstalled];
    });
    return self.WXAppIsInstall;
}

- (void)initWX:(NSString *)appkey
{
    [WXApi registerApp:appkey];
}

- (void)pay:(NSDictionary *)info callback:(WXModuleCallback)callback
{
    [[BMPayManager shareInstance] payByWechat:info callback:callback];
}

@end
