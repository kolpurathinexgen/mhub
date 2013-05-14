//
// DashBoardViewController.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/10/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "DashBoardViewController.h"
#import "DashBoardCell.h"
#import "HubListViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ProfileScreenViewController.h"

@interface DashBoardViewController ()

@end

@implementation DashBoardViewController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)profilePageAction:(id)sender
{
    [self performSegueWithIdentifier:@"OptionsToProfile" sender:self];
}
-(IBAction)hubListPageAction:(id)sender
{
    
    self.currentOrganization = nil;
    [self performSegueWithIdentifier:@"OptionToLogin" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"OrganizationToHubList"])
    {
        HubListViewController *controller = ( HubListViewController *)segue.destinationViewController;
        controller.currentOrg = self.currentOrganization;
    }
    else if([segue.identifier isEqualToString:@"OrganizationToProfile"])
    {
        ProfileScreenViewController *controller = ( ProfileScreenViewController *)segue.destinationViewController;
        controller.currentOrganization = self.currentOrganization;
 
            
    }

}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.currentOrganization.title;
    

    
    self.dashBoardTable.layer.cornerRadius = 30;
    self.dashBoardTable.scrollEnabled = NO;


    self.navigationItem.hidesBackButton = YES;
    
        
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    UIImage *image1 = [UIImage imageNamed:@"1136BG.png"];
    self.dashBoardImage.image = image1;
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.backBarButtonItem=nil;
     /*UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
     [lButton setFrame:CGRectMake(0,0,40,30)];
     [lButton setImage:[UIImage imageNamed:@"HubblySpokeButton.png"] forState:UIControlStateNormal];
     [lButton addTarget:self action:@selector(homePageAction:) forControlEvents:UIControlEventTouchUpInside];
     UIBarButtonItem *lBarButton = [[UIBarButtonItem alloc] initWithCustomView:lButton];
     self.navigationItem.leftBarButtonItem = lBarButton;*/

    
    /*UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
     [lButton setFrame:CGRectMake(0,0,40,30)];
     [lButton setImage:[UIImage imageNamed:@"images-12.jpeg"] forState:UIControlStateNormal];
     [lButton setTitle:@"LogOut" forState:UIControlStateNormal];
     [lButton addTarget:self action:@selector(hubListPageAction:) forControlEvents:UIControlEventTouchUpInside];
    lButton.titleLabel.textColor = [UIColor whiteColor];
     lButton.backgroundColor = [UIColor grayColor];
    [lButton.layer setBorderColor: [[UIColor grayColor] CGColor]];

     UIBarButtonItem *lBarButton = [[UIBarButtonItem alloc] initWithCustomView:lButton];
     self.navigationItem.leftBarButtonItem = lBarButton;*/

    
       
    //UIBarButtonItem* deleteItem = [[UIBarButtonItem alloc] initWithCustomView:lbutton];
    
    /*UIButton *rButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rButton setFrame:CGRectMake(0,0,40,40)];
    [rButton setImage:[UIImage imageNamed:@"MemberOptions.png"] forState:UIControlStateNormal];
    [rButton addTarget:self action:@selector(profilePageAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rBarButton = [[UIBarButtonItem alloc] initWithCustomView:rButton];
    self.navigationItem.rightBarButtonItem = rBarButton;*/
    
        

    
 
    
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setSwitchButton:nil];
    [self setDashBoardView:nil];
    [self setDashBoardImage:nil];
    [self setDashBoardTable:nil];
    [super viewDidUnload];
    
    
    UITapGestureRecognizer* tapRecon = [[UITapGestureRecognizer alloc]
                                        initWithTarget:self action:@selector(navigationBarDoubleTap:)];
    tapRecon.numberOfTapsRequired = 2;

    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}


-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   DashBoardCell * cell = (DashBoardCell *)[tableView dequeueReusableCellWithIdentifier:@"DCell"];
    
    if(cell == nil ) // !cell means that if cell is nil
    {
        cell = [[DashBoardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DCell"];
    }
    
    int row = indexPath.row;
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (row == 0)
    {
        cell.dashBoardLabel.text = @"Your Hubs";
        
        UIImage *cellImage = [UIImage imageNamed:@"hub.png"];
        cell.dashBoardImageView.image = cellImage;
               
    }
    else if (row == 1)
    {
        cell.dashBoardLabel.text = @"Your Profile";
        
        UIImage *cellImage = [UIImage imageNamed:@"members.png"];
        cell.dashBoardImageView.image = cellImage;
    }
    else if(row == 2)
    {
        cell.dashBoardLabel.text = @"Directory";
        
        UIImage *cellImage = [UIImage imageNamed:@"directory.png"];
        cell.dashBoardImageView.image = cellImage;
    }
   /* else if(row == 3)
    {
        cell.optionListLabel.text = @"Admin Console";
        
        UIImage *cellImage = [UIImage imageNamed:@"Images-5.jpeg"];
        cell.OptionListImageView.image = cellImage;

    }*/
        
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
          
    if(row == 0)
    {
        [self performSegueWithIdentifier:@"OrganizationToHubList" sender:self];

    }
    if(row == 1)
    {
        [self performSegueWithIdentifier:@"OrganizationToProfile" sender:self];

     }
    if(row == 2)
    {
            [self performSegueWithIdentifier:@"OrganizationToDirectory" sender:self];
     }
       
}


- (IBAction)switchAction:(id)sender
{
    [self performSegueWithIdentifier:@"OrganizationToOption" sender:self];

}

@end
