//
//  HubMenuViewController.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/20/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HubCell.h"

@interface HubMenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) BOOL tableExpanded;
@property (strong, nonatomic) IBOutlet UITableView *hubTable;

@property (strong, nonatomic) IBOutlet UIImageView *hubBackgroundImage;

- (IBAction)hubSlideAction:(id)sender;
- (IBAction)hubCellButtonAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *hubCellButton;

@end
