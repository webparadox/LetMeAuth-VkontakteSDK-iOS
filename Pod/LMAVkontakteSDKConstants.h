//
//  LMAVkontakteSDKConstants.h
//  LetMeAuth-VkontakteSDK-iOS
//
//  Created by Alexey Aleshkov on 18/12/14.
//  Copyright (c) 2014 Webparadox, LLC. All rights reserved.
//


#import <Foundation/Foundation.h>


// NSString
// Same as LMAOAuth2ClientId
extern NSString *const LMAVkontakteSDKClientId;
// NSArray of NSString
// Same as LMAOAuth2Scope
extern NSString *const LMAVkontakteSDKScope;
// NSNumber
// @"revoke"
extern NSString *const LMAVkontakteSDKRevokeAccess;
// NSNumber
// @"force_oauth"
extern NSString *const LMAVkontakteSDKForceOAuth;
// NSNumber
// @"inapp"
extern NSString *const LMAVkontakteSDKAuthorizeInApp;


@interface LMAVkontakteSDKConstants : NSObject

@end
