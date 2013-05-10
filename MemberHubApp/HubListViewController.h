//
//  HubListViewController.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/11/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HubListCell.h"
#import "Organization.h"

@interface HubListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *hubBackImage;
@property (strong, nonatomic) IBOutlet UITableView *hubListTable;
@property (nonatomic, assign) Organization * currentOrg;

@property (strong, nonatomic) IBOutlet UILabel *hubsNameLabel;

@property (strong, nonatomic) NSString * selectedTitle;


@end
