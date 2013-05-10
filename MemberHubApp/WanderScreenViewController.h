//
//  WanderScreenViewController.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/19/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WanderScreenCell.h"

@interface WanderScreenViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet WanderScreenCell *wanderTableCell;

@property (strong, nonatomic) IBOutlet UITableView *WTable;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage9;

@end
