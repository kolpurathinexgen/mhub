//
//  LoginViewController.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/9/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginCell.h"
#import "MHBaseViewController.h"

@interface LoginViewController : MHBaseViewController

@property (strong, nonatomic) IBOutlet UITableView *loginTable;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (strong, nonatomic) IBOutlet LoginCell *cLogin;
- (IBAction)goAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *logoImage;
@property (strong, nonatomic) IBOutlet UIButton *goActionButton;

@end
