//
//  NLKAppDelegate.m
//  FacebookSocialLogin
//
//  Created by Ievgen Naloiko on 6/16/14.
//  Copyright (c) 2014 com.naloiko. All rights reserved.
//

#import "NLKAppDelegate.h"
#import "NLKInitialViewController.h"
#import <FacebookSDK/Facebook.h>

@implementation NLKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    NLKInitialViewController *initialViewController = [NLKInitialViewController new];
    self.window.rootViewController = initialViewController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    BOOL wasHandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    return wasHandled;
}

@end
