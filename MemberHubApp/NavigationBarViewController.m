//
//  NavigationBarViewController.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/25/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "NavigationBarViewController.h"


@interface NavigationBarViewController ()

@end

@implementation NavigationBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)homePageAction:(id)sender
{
    
}
-(IBAction)profilePageAction:(id)sender
{
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem=nil;
    
    
       
    
    
    
    UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lButton setFrame:CGRectMake(0,0,40,30)];
    [lButton setImage:[UIImage imageNamed:@"HubblySpokeButton.png"] forState:UIControlStateNormal];
    [lButton addTarget:self action:@selector(homePageAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *lBarButton = [[UIBarButtonItem alloc] initWithCustomView:lButton];
    self.navigationItem.leftBarButtonItem = lBarButton;
    
    //Button in title bar right
    
    UIButton *rButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rButton setFrame:CGRectMake(0,0,40,40)];
    [rButton setImage:[UIImage imageNamed:@"MemberOptions.png"] forState:UIControlStateNormal];
    [rButton addTarget:self action:@selector(profilePageAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rBarButton = [[UIBarButtonItem alloc] initWithCustomView:rButton];
    self.navigationItem.rightBarButtonItem = rBarButton;
    
    

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
