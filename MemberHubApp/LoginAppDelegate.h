//
//  LoginAppDelegate.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/9/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginResponse;

@interface LoginAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController * navControl;
@property (strong, nonatomic) NSString * loginToken;

@property (strong, nonatomic) NSString * loginID;

-(void)saveLoginDetailsToDisk :(LoginResponse *)resp;


@end
