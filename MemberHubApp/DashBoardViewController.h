//
//  DashBoardViewController.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/10/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashBoardCell.h"
#import "Organization.h"

@interface DashBoardViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *dashBoardImage;

@property (nonatomic, assign) Organization * currentOrganization;
- (IBAction)switchAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *switchButton;

@property (strong, nonatomic) IBOutlet UIView *dashBoardView;
@property (strong, nonatomic) IBOutlet UITableView *dashBoardTable;

@end
