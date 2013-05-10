//
//  TriangleViewController.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/19/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TriangleCell.h"

@interface TriangleViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *triangleTable;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView10;
- (IBAction)switchAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *switchButton;

@end
