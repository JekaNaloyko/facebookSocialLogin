//
//  NLKInitialViewController.m
//  FacebookSocialLogin
//
//  Created by Ievgen Naloiko on 6/16/14.
//  Copyright (c) 2014 com.naloiko. All rights reserved.
//

#import "NLKInitialViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <Parus/Parus.h>

@interface NLKInitialViewController () <FBLoginViewDelegate>

@property (strong) UITextView* textView;

@end

@implementation NLKInitialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
   
    FBLoginView *loginView = [[FBLoginView alloc] init];
    {
        loginView.translatesAutoresizingMaskIntoConstraints = NO;
        loginView.delegate = self;
        loginView.frame = CGRectOffset(loginView.frame, (self.view.center.x - (loginView.frame.size.width / 2)), 5);
        [self.view addSubview:loginView];
    }
    
    UITextView *textView = [UITextView new];
    {
        textView.translatesAutoresizingMaskIntoConstraints = NO;
        textView.backgroundColor = [UIColor lightTextColor];
        self.textView = textView;
        
        
        textView.layer.masksToBounds = NO;
        textView.layer.cornerRadius = 8;
        textView.layer.shadowOffset = CGSizeMake(-5, 5);
        textView.layer.shadowRadius = 5;
        textView.layer.shadowOpacity = 0.5;
        
        [self.view addSubview:textView];
    }
    
    [self.view addConstraints:PVGroup(@[
                                        PVTopOf(loginView).equalTo.topOf(loginView.superview).plus(20),
                                        PVCenterXOf(loginView).equalTo.centerXOf(loginView.superview),
                                        PVTopOf(textView).equalTo.bottomOf(loginView).plus(20),
                                        PVBottomOf(textView).equalTo.bottomOf(textView.superview).minus(20),
                                        PVWidthOf(textView).equalTo.widthOf(textView.superview).minus(40),
                                        PVLeftOf(textView).equalTo.leftOf(textView.superview).plus(20)
                                        ]).withViews(NSDictionaryOfVariableBindings(loginView, textView)).asArray];
    
    
}

#pragma mark FBLoginViewDelegate

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    self.textView.text = [NSString stringWithFormat:@"%@\n\nThe view is now in logged in mode.", self.textView.text];
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user
{

    self.textView.text = [NSString stringWithFormat:@"%@\n\nWe have fetched user info:\nName:%@,\nFirst name: %@,\nMiddle name: %@,\nLast name: %@,\nLink: %@, \nUsername: %@, \nBirthday: %@, \nLocation: %@ ",
                          self.textView.text,
                          user.name ? user.name : @"undefined",
                          user.first_name ? user.first_name : @"undefined",
                          user.middle_name ? user.middle_name : @"undefined",
                          user.last_name ? user.last_name : @"undefined",
                          user.link ? user.link : @"undefined",
                          user.username ? user.username : @"undefined",
                          user.birthday ? user.birthday : @"undefined",
                          user.location.name ? user.location.name : @"undefined"];
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    self.textView.text = [NSString stringWithFormat:@"%@\n\nThe view is now in logged out mode.", self.textView.text];
}

- (void)loginView:(FBLoginView *)loginView
      handleError:(NSError *)error
{
    self.textView.text = [NSString stringWithFormat:@"%@\n\nThe view is now in logged out mode.", self.textView.text];
}

@end
