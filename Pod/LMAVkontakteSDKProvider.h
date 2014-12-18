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

 @"access_token" => NSString. String token for use in request parameters
 @"expires_in" => NSString. Time when token expires
 @"user_id" => NSString. Current user id for this token
 @"email" => NSString. User email (if passed)
 @"created" => NSNumber(NSTimeInterval). Indicates time of token creation
 @"scope" => NSArray of NSString. Permissions assosiated with token
 @"secret" => NSString. User secret to sign requests (if nohttps used)
 @"https_required" => NSNumber(BOOL). If user sets "Always use HTTPS" setting in his profile, it will be true
 */
@interface LMAVkontakteSDKProvider : NSObject <LMAProvider>

@end
