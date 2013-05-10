//
//  OptionViewController.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/10/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionListCell.h"
#import "Organization.h"

@interface OptionViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *optionView;
@property (strong, nonatomic) IBOutlet UIImageView *OptionImageView;

@property (strong, nonatomic) IBOutlet UITableView *OptionViewTable;
@property (nonatomic, assign) Organization * currentOrganization;
- (IBAction)switchAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *switchButton;


@end
