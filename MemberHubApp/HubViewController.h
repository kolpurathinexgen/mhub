//
//  HubViewController.h
//  MemberHubApp
//
//  Created by Mubend on 28/04/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Organization.h"

@interface HubViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *worshipTeamTextView;
@property (weak, nonatomic) IBOutlet UIImageView *worshipTeamImageView;
@property (weak, nonatomic) IBOutlet UIToolbar *hubToolBar;

@property (weak, nonatomic) IBOutlet UITableView *hubMenuTable;

@property (weak, nonatomic) IBOutlet UIView *hubMenuView;
- (IBAction)switchButtonAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *TextLabel;
@property (strong, nonatomic) IBOutlet UIView *hubFrontView;
@property (nonatomic, assign) NSString * currentHubTitle;
@property (strong, nonatomic) IBOutlet UILabel *hubTitleLabel;
@property (strong, nonatomic) IBOutlet UITableView *orgMenuTable;

@property (strong, nonatomic) IBOutlet UIView *orgMenuView;
@property (nonatomic, assign) Organization * currentOrganization;


@end
