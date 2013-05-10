//
//  DirectoryViewController.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/16/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DirectoryCustomCell.h"

@interface DirectoryViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic, retain) NSMutableArray * memberInfo;
@property (nonatomic, retain) NSMutableArray * filteredSearch;

@property (strong, nonatomic) IBOutlet DirectoryCustomCell *directoryTableView;
@property (strong, nonatomic) IBOutlet UITableView *dTable;
@property IBOutlet UISearchBar *searchMembers;


@property (strong, nonatomic) IBOutlet UIImageView *backGroundImage11;

@end
