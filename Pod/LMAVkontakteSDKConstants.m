//
//  LMAVkontakteSDKConstants.m
//  LetMeAuth-VkontakteSDK-iOS
//
//  Created by Alexey Aleshkov on 18/12/14.
//  Copyright (c) 2014 Webparadox, LLC. All rights reserved.
//


//#import "LMAVkontakteSDKConstants.h"
#import <LetMeAuth/LetMeAuth.h>


NSString *LMAVkontakteSDKClientId = @"client_id";
NSString *LMAVkontakteSDKScope = @"scope";
NSString *const LMAVkontakteSDKRevokeAccess = @"revoke";
NSString *const LMAVkontakteSDKForceOAuth = @"force_oauth";
NSString *const LMAVkontakteSDKAuthorizeInApp = @"inapp";


__attribute__((constructor))
static void initializeConstants()
{
    LMAVkontakteSDKClientId = LMAOAuth2ClientId;
    LMAVkontakteSDKScope = LMAOAuth2Scope;
}
