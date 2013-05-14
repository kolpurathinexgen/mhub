//
// OrgMenuViewController.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/20/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrgMenuCell.h"
#import "Organization.h"

@interface OrgMenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) BOOL tableExpand;

@property (strong, nonatomic) IBOutlet UITableView *orgMenuTable;

@property (strong, nonatomic) IBOutlet UIImageView *orgImageView;
@property (nonatomic, assign) Organization * currentOrganization;

@end
