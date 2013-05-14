//
//  OrgMenuViewController.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/20/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "OrgMenuViewController.h"
#import "HubMenuViewController.h"
#import "Organization.h"

@interface OrgMenuViewController ()

@end

@implementation OrgMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
        
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    self.tableExpand = FALSE;
    
    self.orgMenuTable.separatorColor = [UIColor clearColor];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
    [self setOrgMenuTable:nil];
    [self setOrgImageView:nil];
    [super viewDidUnload];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
       return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        if(section == 0)
        {
            return 1;
        }
        else if(section == 1)
        {
            return 4;
        }
        else if(section == 2)
        {
            return 3;
        }
        else if(section == 3)
        {
            return 2;
        }
      
    
}

- (NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section
{
            
        if(section == 0)
        {
            return nil;
        }
        else if(section == 1)
        {
            if(self.currentOrganization != nil)
            {
                return self.currentOrganization.title.uppercaseString;
            }
            else
                return @"  ";
        }
        else if(section == 2)
        {
            return @"YOUR HUBS";
        }
        else if(section == 3)
            
            return @"  ";
 
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if( tableView == self.orgMenuTable && section >= 0)
    {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)] ;
        
        [headerView setBackgroundColor:[UIColor colorWithRed:62.0f/225 green:69.0/225 blue:87.0/225 alpha:1]];
        
        UILabel *customLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 2, tableView.bounds.size.width-10, 20)] ;
        customLabel.backgroundColor = [UIColor clearColor];
        customLabel.text = [self tableView:tableView titleForHeaderInSection:section];
        customLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:12.0];
        customLabel.textColor = [UIColor whiteColor];
        
        [headerView addSubview:customLabel];
        
        return headerView;
    }
    else
        return nil;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    OrgMenuCell * cell = (OrgMenuCell *)[tableView dequeueReusableCellWithIdentifier:@"OMCell"];
    
    if(cell == nil ) // !cell means that if cell is nil
    {
        cell = [[OrgMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OMCell"];
    }
    
    int row = indexPath.row;
    int section = indexPath.section;
    
    if(section == 0)
    {
      cell.orgMenuLabel.text = @"Matt Harell";
      UIImage *cellImage = [UIImage imageNamed:@"images-5.jpeg"];
    cell.orgMenuImageView.image = cellImage;
        
  
    }
    else if(section == 1)
    {
        if (row == 0)
        {
            cell.orgMenuLabel.text = @"Dashboard";
            
            UIImage *cellImage = [UIImage imageNamed:@"hub_icon.png"];
            cell.orgMenuImageView.image = cellImage;
            
        }
        else if (row == 1)
        {
            cell.orgMenuLabel.text= @"Main Calender";
            
            UIImage *cellImage = [UIImage imageNamed:@"calendar_icon.png"];
            cell.orgMenuImageView.image = cellImage;
        }
        else if(row == 2)
        {
            cell.orgMenuLabel.text = @"Directory";
            
            UIImage *cellImage = [UIImage imageNamed:@"Images-5.jpeg"];
            cell.orgMenuImageView.image = cellImage;

        }
        else if(row == 3)
        {
            cell.orgMenuLabel.text = @"Admin Console";
            //cell.dashboardCellIcon.image = cellImage;

        }
        
    
    }
    else if(section == 2)
    {
        if (row == 0)
        {
            cell.orgMenuLabel.text = @"Hub A";
            
            UIImage *cellImage = [UIImage imageNamed:@"hub_icon.png"];
            cell.orgMenuImageView.image = cellImage;

            
        }
        else if (row == 1)
        {
            cell.orgMenuLabel.text= @"Hub B";
            
            UIImage *cellImage = [UIImage imageNamed:@"hub_icon.png"];
            cell.orgMenuImageView.image = cellImage;

        }
    }
    else if(section == 3)
    {
        if (row == 0)
        {
            cell.orgMenuLabel.text = @"Switch Organizations";
            
            UIImage *cellImage = [UIImage imageNamed:@"hub_icon.png"];
            cell.orgMenuImageView.image = cellImage;
            
        }
        else if (row == 1)
        {
            cell.orgMenuLabel.text= @"Logout";
            
            UIImage *cellImage = [UIImage imageNamed:@"user.png"];
            cell.orgMenuImageView.image = cellImage;

        }
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     int section = indexPath.section;
    int row = indexPath.row;
    if(section == 0)
    {
     [self performSegueWithIdentifier:@"DashBoardToProfile" sender:self];
    }
    
    if(section == 2)
    {
        if(row == 0)
        {
            [self performSegueWithIdentifier:@"DashboardToHub" sender:self];
 
        }
        
        if(row == 1)
        {
            [self performSegueWithIdentifier:@"DashboardToHub" sender:self];
            
        }

    }
    if(section == 3)
    {
        if(row == 1)
        {
                [self performSegueWithIdentifier:@"DashBoardToLogin" sender:self];
                
        }
     }
}


/*- (IBAction)dashBoardButtonAction:(id)sender
{
    HubMenuViewController *vc2 = [[HubMenuViewController alloc] initWithNibName:@"HubViewController" bundle:nil];
    [vc2 setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:vc2 animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)dashBoardSlideAction:(id)sender
{
    if(self.tableExpand)
    {
        self.tableExpand = FALSE;
    }
    else
    {
        self.tableExpand = TRUE;
    }
    [self.dashboardTable reloadData];

    
}*/

@end
