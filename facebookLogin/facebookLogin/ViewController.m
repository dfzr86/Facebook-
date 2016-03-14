//
//  ViewController.m
//  facebookLogin
//
//  Created by __zimu on 16/3/14.
//  Copyright © 2016年 ablecloud. All rights reserved.
//


#import "ViewController.h"


#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>



@interface ViewController () <FBSDKLoginButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    // Optional: Place the button in the center of your view.
    loginButton.center = self.view.center;
    loginButton.delegate = self;
    [self.view addSubview:loginButton];
}

- (BOOL)loginButtonWillLogin:(FBSDKLoginButton *)loginButton {
    NSLog(@"将要登录");
    return YES;
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    NSLog(@"退出登录");
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    
    
    FBSDKAccessToken *token = result.token;
    
    NSLog(@"\nappID:%@\n  declinedPermissions:%@\n  expirationDate:%@\n  permissions:%@\n refreshDate:%@\n tokenString:%@\n userID:%@\n",
          token.appID,
          token.declinedPermissions,
          token.expirationDate,
          token.permissions,
          token.refreshDate,
          token.tokenString,
          token.userID);
    NSLog(@"------------------");
    
    NSLog(@"grantedPermissions:%@ \n declinedPermissions:%@", result.grantedPermissions, result.declinedPermissions);
    
    
    
    
}
@end
