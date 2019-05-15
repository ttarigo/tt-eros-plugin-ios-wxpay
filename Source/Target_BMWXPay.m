//
//  Target_BMWXPay.m
//  ErosPluginWXPay
//
//  Created by XHY on 2018/4/25.
//

#import "Target_BMWXPay.h"
#import "BMPayManager.h"

@implementation Target_BMWXPay

- (BOOL)Action_PayHandleOpenURL:(NSDictionary *)info
{
    return [[BMPayManager shareInstance] applicationOpenURL:info[@"url"]];
}

@end
