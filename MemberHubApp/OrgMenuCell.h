//
//  OrgMenuCell.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/26/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Organization.h"

@interface OrgMenuCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *menuLabel;

@property (strong, nonatomic) IBOutlet UIImageView *menuImageView;

@property (strong, nonatomic) IBOutlet UIImageView *orgMenuImageView;
@property (strong, nonatomic) IBOutlet UILabel *orgMenuLabel;


@end
