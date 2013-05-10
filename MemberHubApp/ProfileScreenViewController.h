//
//  ProfileScreenViewController.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/11/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileCell.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "OrgMenuCell.h"
#import "Organization.h"
#import "ProfileAddressCell.h"


@interface ProfileScreenViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, retain) NSMutableArray * orglist;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;




@property (nonatomic, assign) Organization * currentOrganization;


@property (strong, nonatomic) IBOutlet UITableView *orgMenuTable;


@property (strong,nonatomic) NSArray *menuArray;

@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;

@property (strong, nonatomic) IBOutlet UITableView *profileScreenTable;
@property (strong, nonatomic) IBOutlet UIImageView *profileImage;

@property (strong, nonatomic) IBOutlet UILabel *profileLabel;

@property (strong, nonatomic) IBOutlet ProfileCell *cProfile;
@property (strong, nonatomic) IBOutlet UITextView *profileAddressTextView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

- (IBAction)addressAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *addressButton;



@property (strong, nonatomic) IBOutlet UIView *profileFrontView;
@property (strong, nonatomic) IBOutlet UIView *profileMenuView;
@property (strong, nonatomic) IBOutlet UITableView *profileAddressTable;

@property (strong, nonatomic) NSString * selectedTitle;




@end
