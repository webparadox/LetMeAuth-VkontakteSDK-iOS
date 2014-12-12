//
//  LMAVkontakteSDKProvider.m
//  LetMeAuth-VkontakteSDK-iOS
//
//  Created by Evgeniy Yurtaev on 21.11.14.
//  Copyright (c) 2014 Webparadox, LLC. All rights reserved.
//


#import "LMAVkontakteSDKProvider.h"
#import <VK-ios-sdk/VKSdk.h>


NSString *const LMAVkontakteSDKClientId = @"LMAVkontakteSDKClientId";
NSString *const LMAVkontakteSDKScope = @"LMAVkontakteSDKScope";


@interface LMAVkontakteSDKProvider () <VKSdkDelegate>

@property (copy, nonatomic) NSString *clientId;
@property (copy, nonatomic) NSArray *scope;

- (void)didAuthenticateWithData:(NSDictionary *)data;
- (void)didFailWithError:(NSError *)error;
- (void)didCancel;
- (void)finish;

@end


@implementation LMAVkontakteSDKProvider

@synthesize providerDelegate = _providerDelegate;

- (id)initWithConfiguration:(NSDictionary *)configuration
{
    NSString *clientId = [configuration objectForKey:LMAVkontakteSDKClientId];
    NSArray *scope = [configuration objectForKey:LMAVkontakteSDKScope];

	NSParameterAssert(clientId != nil);
	NSParameterAssert(scope != nil && [scope count] != 0);

	self = [super init];
	if (!self) {
        return nil;
	}

    self.clientId = clientId;
    self.scope = [[[NSSet alloc] initWithArray:scope] allObjects];

    return self;
}

- (void)start
{
    [VKSdk initializeWithDelegate:self andAppId:self.clientId];
	[VKSdk authorize:self.scope revokeAccess:YES forceOAuth:YES inApp:YES];
}

- (void)cancel
{
    [self didCancel];
}

- (BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
	return [VKSdk processOpenURL:url fromApplication:sourceApplication];
}

- (void)handleDidBecomeActive
{
    [self didCancel];
}

#pragma mark Private methods

- (void)didAuthenticateWithData:(NSDictionary *)data
{
    [self.providerDelegate provider:self didAuthenticateWithData:data];
    [self finish];
}

- (void)didFailWithError:(NSError *)error
{
    [self.providerDelegate provider:self didFailWithError:error];
    [self finish];
}

- (void)didCancel
{
    [self.providerDelegate providerDidCancel:self];
    [self finish];
}

- (void)finish
{
    [VKSdk initializeWithDelegate:nil andAppId:nil];
}

#pragma mark -
#pragma mark VKSdkDelegate

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError;
{
	UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;

	VKCaptchaViewController *viewController = [VKCaptchaViewController captchaControllerWithError:captchaError];
	[viewController presentIn:rootViewController];
}

- (void)vkSdkUserDeniedAccess:(VKError *)authorizationError
{
	NSError *error = authorizationError.httpError;
	if (error) {
        [self didFailWithError:error];
	} else {
        [self didCancel];
	}
}

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
	[rootViewController presentViewController:controller animated:YES completion:nil];
}

- (void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken
{
}

- (void)vkSdkReceivedNewToken:(VKAccessToken *)newToken
{
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithCapacity:8];

    [data setValue:newToken.accessToken forKey:@"access_token"];
    [data setValue:newToken.expiresIn forKey:@"expires_in"];
    [data setValue:newToken.userId forKey:@"user_id"];
    [data setValue:newToken.email forKey:@"email"];
    [data setValue:@(newToken.created) forKey:@"created"];
    [data setValue:newToken.permissions forKey:@"scope"];
    [data setValue:newToken.secret forKey:@"secret"];
    [data setValue:@(newToken.httpsRequired) forKey:@"https_required"];

    [self didAuthenticateWithData:data];
}

@end
