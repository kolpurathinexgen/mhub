//
//  DashBoardViewController.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/20/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "DashBoardViewController.h"
#import "HubMenuViewController.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
        
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    self.tableExpand = FALSE;
    
    self.dashboardTable.separatorColor = [UIColor clearColor];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setDashboardTable:nil];
    [self setDashboardImage:nil];
    [self setDashBoardButton:nil];
    [super viewDidUnload];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(self.tableExpand)
    {
        return 1;
        
    }
    else 
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
        return 2;
     }
     else
        return 2;
        

}

- (NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return nil;
    }
    else if(section == 1)
    {
        //if(self.currentOrganization == nil)
        //{
            return @"";
        //}
       // else
            //return self.currentOrganization.title;
    }
    else if(section == 2)
    {
        return @"YOUR HUBS";
    }
    else
        return @"";

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DashBoardCell * cell = (DashBoardCell *)[tableView dequeueReusableCellWithIdentifier:@"DBCell"];
    
    if(cell == nil ) // !cell means that if cell is nil
    {
        cell = [[DashBoardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DBCell"];
    }
    
    int row = indexPath.row;
    int section = indexPath.section;
    
    if(section == 0)
    {
      cell.dashboardCellLabel.text = @"Matt Harell";
      UIImage *cellImage = [UIImage imageNamed:@"images-5.jpeg"];
    cell.dashboardCellIcon.image = cellImage;
        
  
    }
    else if(section == 1)
    {
        if (row == 0)
        {
            cell.dashboardCellLabel.text = @"Dashboard";
            
            UIImage *cellImage = [UIImage imageNamed:@"hub_icon.png"];
            cell.dashboardCellIcon.image = cellImage;
            
        }
        else if (row == 1)
        {
            cell.dashboardCellLabel.text= @"Main Calender";
            
            UIImage *cellImage = [UIImage imageNamed:@"calendar_icon.png"];
            cell.dashboardCellIcon.image = cellImage;
        }
        else if(row == 2)
        {
            cell.dashboardCellLabel.text = @"Directory";
            
            UIImage *cellImage = [UIImage imageNamed:@"Images-5.jpeg"];
            cell.dashboardCellIcon.image = cellImage;

        }
        else if(row == 3)
        {
            cell.dashboardCellLabel.text = @"Admin Console";
            //cell.dashboardCellIcon.image = cellImage;

        }
        
    
    }
    else if(section == 2)
    {
        if (row == 0)
        {
            cell.dashboardCellLabel.text = @"Hub A";
            
            UIImage *cellImage = [UIImage imageNamed:@"hub_icon.png"];
            cell.dashboardCellIcon.image = cellImage;

            
        }
        else if (row == 1)
        {
            cell.dashboardCellLabel.text= @"Hub B";
            
            UIImage *cellImage = [UIImage imageNamed:@"hub_icon.png"];
            cell.dashboardCellIcon.image = cellImage;

        }
    }
    else if(section == 3)
    {
        if (row == 0)
        {
            cell.dashboardCellLabel.text = @"Switch Organizations";
            
            UIImage *cellImage = [UIImage imageNamed:@"hub_icon.png"];
            cell.dashboardCellIcon.image = cellImage;
            
        }
        else if (row == 1)
        {
            cell.dashboardCellLabel.text= @"Logout";
            
            UIImage *cellImage = [UIImage imageNamed:@"user.png"];
            cell.dashboardCellIcon.image = cellImage;

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


- (IBAction)dashBoardButtonAction:(id)sender
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

    
}
@end
