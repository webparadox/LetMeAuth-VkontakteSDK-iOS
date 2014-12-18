//
//  LMAVkontakteSDKProvider.h
//  LetMeAuth-VkontakteSDK-iOS
//
//  Created by Evgeniy Yurtaev on 21.11.14.
//  Copyright (c) 2014 Webparadox, LLC. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <LetMeAuth/LetMeAuth.h>
#import "LMAVkontakteSDKConstants.h"


/*
 Return

 LMAOAuth2AccessToken => NSString. String token for use in request parameters
 LMAOAuth2ExpiresIn => NSNumber. Token lifetime
 LMAOAuth2Scope => NSArray of NSString. Permissions assosiated with token
 LMAIssuedAt => NSDate. Indicates time of token creation
 LMAExpiresAt => NSDate. Time when token expires
 LMAUserId => NSString. Current user id for this token
 @"email" => NSString. User email (if passed)
 @"secret" => NSString. User secret to sign requests (if nohttps used)
 @"https_required" => NSNumber(BOOL). If user sets "Always use HTTPS" setting in his profile, it will be true
 */
@interface LMAVkontakteSDKProvider : NSObject <LMAProvider>

@end
