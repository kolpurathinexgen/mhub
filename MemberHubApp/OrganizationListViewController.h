//
//  OrganizationListViewController.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/10/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrganizationListCell.h"
#import "Organization.h"
#import "MHRequest.h"
#import "MHResponse.h"
#import "MHBaseViewController.h"

@interface OrganizationListViewController : MHBaseViewController


@property (strong, nonatomic) IBOutlet UITableView *orgListTable;
@property (strong, nonatomic) IBOutlet UIImageView *orgImageView
;
@property (strong, nonatomic) IBOutlet UILabel *OrgHeadLabel;

@property (strong, nonatomic) IBOutlet UIView *OrgListView;

@property (strong, nonatomic) IBOutlet UIImageView *logoImageOption;

@property (strong, nonatomic) Organization * org;

@end
