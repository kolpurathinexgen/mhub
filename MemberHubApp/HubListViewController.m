//
//  HubListViewController.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/11/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "HubListViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "HubViewController.h"
#import "OptionViewController.h"


@interface HubListViewController ()

@end

@implementation HubListViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)backAction:(id)sender
{
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [self.navigationController popViewControllerAnimated:YES];

}

-(IBAction)profileAction:(id)sender
{
    //[self performSegueWithIdentifier:@"OptionsToProfile" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"HubListToWorshipTeam"])
    {
       HubViewController *controller = (HubViewController *)segue.destinationViewController;
        controller.currentHubTitle = self.selectedTitle;
        controller.currentOrganization = self.currentOrg;
        
    }


}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.hubsNameLabel.text = @"Your Hubs";
    self.hubListTable.layer.cornerRadius = 30;

    self.title = self.currentOrg.title;
    
    UIImage *image1 = [UIImage imageNamed:@"1136BG.png"];
    
    self.hubBackImage.image = image1;
    self.navigationItem.hidesBackButton = NO;
       
    
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc]
                                initWithTitle:@"Back"
                                style:UIBarButtonItemStylePlain
                                target:self
                                action:@selector(backAction:)];
   
    self.navigationItem.leftBarButtonItem = btnBack;

    
    /*UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lButton setFrame:CGRectMake(0,0,40,30)];
    //[lButton setImage:[UIImage imageNamed:@"HubblySpokeButton.png"] forState:UIControlStateNormal];
    [lButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *lBarButton = [[UIBarButtonItem alloc] initWithCustomView:lButton];
    self.navigationItem.leftBarButtonItem = lBarButton;*/
    
   /* UIButton *rButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rButton setFrame:CGRectMake(0,0,40,40)];
    [rButton setImage:[UIImage imageNamed:@"MemberOptions.png"] forState:UIControlStateNormal];
    [rButton addTarget:self action:@selector(profileAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rBarButton = [[UIBarButtonItem alloc] initWithCustomView:rButton];
    self.navigationItem.rightBarButtonItem = rBarButton;*/
    


    
      
    
        	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
       [self setHubBackImage:nil];
       [self setHubListTable:nil];
    [self setHubsNameLabel:nil];
       [super viewDidUnload];
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
    HubListCell* cell = (HubListCell *)[tableView dequeueReusableCellWithIdentifier:@"HubList"];
    
    if(cell == nil ) // !cell means that if cell is nil
    {
        cell = [[HubListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HubList"];
    }
    
    int row = indexPath.row;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (row == 0)
    {
        cell.hubListLabel.text = @"Worship Team";
                UIImage *cellImage = [UIImage imageNamed:@"hub.png"];
        cell.hubListImage.image = cellImage;
        cell.hubListLabel.tag = 100;
        
    }
    else if (row == 1)
    {
        cell.hubListLabel.text = @"Facility Group";
                UIImage *cellImage = [UIImage imageNamed:@"hub.png"];
        cell.hubListImage.image = cellImage;
        cell.hubListLabel.tag = 100;
    }
    if(row == 2)
    {
        cell.hubListLabel.text = @"Men's Ministry";
                UIImage *cellImage = [UIImage imageNamed:@"hub.png"];
        cell.hubListImage.image = cellImage;
        cell.hubListLabel.tag = 100;
        
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    if(row == 0)
    {
         self.selectedTitle = @"Worship Team";
    }
    else if(row == 1)
    {
         self.selectedTitle = @"Facility Group";
    }
    else if(row == 2)
    {
        self.selectedTitle = @"Men's Ministry";
    }
    [self performSegueWithIdentifier:@"HubListToWorshipTeam" sender:self];
                
}
@end
