//
//  DashBoardViewController.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/20/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashBoardCell.h"
#import "Organization.h"

@interface DashBoardViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) BOOL tableExpand;



@property (strong, nonatomic) IBOutlet UITableView *dashboardTable;

@property (strong, nonatomic) IBOutlet UIImageView *dashboardImage;


- (IBAction)dashBoardSlideAction:(id)sender;
- (IBAction)dashBoardButtonAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *dashBoardButton;


@end
