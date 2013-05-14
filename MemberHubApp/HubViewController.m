//
// HubViewController.m
//  MemberHubApp
//
//  Created by Mubend on 28/04/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "HubViewController.h"
#import "HubMenuCell.h"
#import "OrgMenuCell.h"

@interface HubViewController ()

@end

@implementation HubViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}
-(IBAction)hubPageAction:(id)sender
{
    [self.view sendSubviewToBack:self.orgMenuView];
    
    if(self.hubFrontView.frame.origin.x == 0)
    {
        [self slideFrontToLeft];
        [self.hubMenuTable reloadData];

    }
    else
        [self bringFrontToNormal];
    
    
}
   
    //[self performSegueWithIdentifier:@"OptionToOrganization" sender:self];


-(IBAction)profilePageAction:(id)sender
{
    [self.view sendSubviewToBack:self.hubMenuView];

    if(self.hubFrontView.frame.origin.x == 0)
    {
        [self slideFrontToRight];
        [self.orgMenuTable reloadData];
    }
    else
        [self bringFrontToNormal];
    


    //[self performSegueWithIdentifier:@"WorshipToProfile" sender:self];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.currentHubTitle;
    
    [self.view bringSubviewToFront:self.hubFrontView];
    [self.hubMenuView bringSubviewToFront:self.hubMenuTable];
    
    
            
    self.hubMenuTable.separatorColor = [UIColor clearColor];

    self.hubMenuView.frame = CGRectMake(self.hubMenuView.frame.origin.x, self.hubMenuView.frame.origin.y, self.hubMenuView.frame.size.width, self.view.frame.size.height );
    
    self.orgMenuView.frame = CGRectMake(self.orgMenuView.frame.origin.x, self.orgMenuView.frame.origin.y, self.orgMenuView.frame.size.width, self.view.frame.size.height );
    
    /*self.worshipTeamTextView.frame = CGRectMake(self.worshipTeamTextView.frame.origin.x, self.worshipTeamTextView.frame.origin.y, self.worshipTeamTextView.frame.size.width, self.hubFrontView.frame.size.height );*/
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem = nil;
    
    
     UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
     [lButton setFrame:CGRectMake(0,0,40,30)];
     [lButton setImage:[UIImage imageNamed:@"Hub-Navigation.png"] forState:UIControlStateNormal];
     [lButton addTarget:self action:@selector(hubPageAction:) forControlEvents:UIControlEventTouchUpInside];
     UIBarButtonItem *lBarButton = [[UIBarButtonItem alloc] initWithCustomView:lButton];
    
               
    //Button in title bar right
    
                                        
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIButton *rButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rButton setFrame:CGRectMake(0,0,40,30)];
    [rButton setImage:[UIImage imageNamed:@"Org-Navigation.png"] forState:UIControlStateNormal];
    [rButton addTarget:self action:@selector(profilePageAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rBarButton = [[UIBarButtonItem alloc] initWithCustomView:rButton];
    
    self.hubToolBar.items = [NSArray arrayWithObjects:lBarButton, flexible, rBarButton, nil];
    
    //self.navigationItem.rightBarButtonItem = rBarButton;
    
    self.TextLabel.text = @"Worship Team Home Page";
    

    	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.hubTitleLabel.text = self.currentHubTitle;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setWorshipTeamTextView:nil];
    [self setWorshipTeamImageView:nil];
    [self setHubMenuTable:nil];
    [self setHubMenuView:nil];
    [self setHubToolBar:nil];
    [self setTextLabel:nil];
    [self setHubFrontView:nil];
        
    [self setHubTitleLabel:nil];
    [self setOrgMenuTable:nil];
    [self setOrgMenuView:nil];
   
    [super viewDidUnload];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(tableView == self.hubMenuTable)
    {
        return 1;
    }
    else if(tableView == self.orgMenuTable)
    {
        return 4;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.hubMenuTable)
    {
        if(section == 0)
        {
            return 8;
        }
    }
    else if (tableView == self.orgMenuTable)
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
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if(tableView == self.hubMenuTable )
        //return 0.0;
        return 30.0;
    else if( tableView == self.orgMenuTable)
    {
        if(section == 0 )
            return 0.0;
        else
            return 30.0;
    }
}

/*
-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}*/

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   
    if(tableView == self.hubMenuTable)
    {
        //return nil;
        if(section == 0)
        {
            return @"HUB NAVIGATION";
        }
    }
    else if(tableView == self.orgMenuTable)
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
                NSLog(@"%@",self.currentOrganization.title);
            }
            else{
                 NSLog(@"%@",self.currentOrganization.title);
                return @"ORGANIZATION NAME";
            }
        }
        else if(section == 2)
        {
            return @"YOUR HUBS";
        }
        else if(section == 3)
            
            return @"  ";
    }
    
    
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
        //customLabel.font= [UIFont systemFontOfSize:12.0];
        customLabel.textColor = [UIColor whiteColor];
        [headerView addSubview:customLabel];
    
        return headerView;
    }
    else if(tableView == self.hubMenuTable && section == 0)
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      if(tableView == self.hubMenuTable)
      {
            HubMenuCell * cell = (HubMenuCell *)[tableView dequeueReusableCellWithIdentifier:@"HMCell"];
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
            if(cell == nil ) // !cell means that if cell is nil
            {
                cell = [[HubMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HMCell"];
                UIView *bgColorView = [[UIView alloc] init];
                [bgColorView setBackgroundColor:[UIColor colorWithRed:41.0/255 green:47.0/255 blue:61.0/255 alpha:1]];
                [cell setSelectedBackgroundView:bgColorView];
            }
            UIView *bgColorView = [[UIView alloc] init];
            [bgColorView setBackgroundColor:[UIColor colorWithRed:41.0/255 green:47.0/255 blue:61.0/255 alpha:1]];
            [cell setSelectedBackgroundView:bgColorView];
          
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, cell.contentView.frame.size.height - 1.0, cell.contentView.frame.size.width, 1)];
          
            lineView.backgroundColor = [UIColor darkGrayColor];
            [cell.contentView addSubview:lineView];

            int row = indexPath.row;
            int section = indexPath.section;
          
          if(section == 0)
          {
              
            if (row == 0)
            {
                cell.hubMenuLabel.text = @"Home Page";
            
                UIImage *cellImage = [UIImage imageNamed:@"home.png"];
                cell.hubMenuImageView.image = cellImage;
            
            }
            else if (row == 1)
            {
                cell.hubMenuLabel.text = @"Announcements";
                
                UIImage *cellImage = [UIImage imageNamed:@"announcements_icon.png"];
                cell.hubMenuImageView.image= cellImage;
                
                
                
            }
            else if(row == 2)
            {
                cell.hubMenuLabel.text = @"Calender";
                
                UIImage *cellImage = [UIImage imageNamed:@"calendar.png"];
                cell.hubMenuImageView.image = cellImage;
            }
            else if(row == 3)
            {
                cell.hubMenuLabel.text = @"Discussions";
                
                UIImage *cellImage = [UIImage imageNamed:@"discussion.png"];
               cell.hubMenuImageView.image = cellImage;
                
                
                
            }
            else if(row == 4)
            {
                cell.hubMenuLabel.text = @"Files";
                
                UIImage *cellImage = [UIImage imageNamed:@"files.png"];
                cell.hubMenuImageView.image= cellImage;
                
            }
            else if(row == 5)
            {
                cell.hubMenuLabel.text = @"Members";
                
                UIImage *cellImage = [UIImage imageNamed:@"members.png"];
               cell.hubMenuImageView.image= cellImage;
                
                
            }
            else if(row == 6)
            {
                cell.hubMenuLabel.text= @"Photos";
                
                UIImage *cellImage = [UIImage imageNamed:@"albums.png"];
               cell.hubMenuImageView.image = cellImage;
                
            }
            else if(row == 7)
            {
                cell.hubMenuLabel.text = @"WhiteBoards";
                
                UIImage *cellImage = [UIImage imageNamed:@"whiteboard_icon.png"];
                cell.hubMenuImageView.image = cellImage;
            }
           
          }
            return cell;

      }
        else if(tableView == self.orgMenuTable)
        {
            
            
            
            OrgMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OMCell"];
            
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            
            
            if(cell == nil ) // !cell means that if cell is nil
            {
                cell = [[OrgMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OMCell"];
            }
            UIView *bgColorView = [[UIView alloc] init];
            [bgColorView setBackgroundColor:[UIColor colorWithRed:41.0/255 green:47.0/255 blue:61.0/255 alpha:1]];
            [cell setSelectedBackgroundView:bgColorView];
            
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, cell.contentView.frame.size.height - 1.0, cell.contentView.frame.size.width, 1)];
            
            lineView.backgroundColor = [UIColor darkGrayColor];
            [cell.contentView addSubview:lineView];


            int row = indexPath.row;
            
            int section = indexPath.section;
            
            if(section == 0)
            {
                cell.orgMenuLabel.text = @"Matt Harell";
                UIImage *cellImage = [UIImage imageNamed:@"avatar.png"];
                cell.orgMenuImageView.image = cellImage;
                
                
            }
            else if(section == 1)
            {
                if (row == 0)
                {
                    cell.orgMenuLabel.text = @"Dashboard";
                    
                    UIImage *cellImage = [UIImage imageNamed:@"hub.png"];
                    cell.orgMenuImageView.image = cellImage;
                    
                }
                else if (row == 1)
                {
                    cell.orgMenuLabel.text= @"Main Calender";
                    
                    UIImage *cellImage = [UIImage imageNamed:@"calendar.png"];
                    cell.orgMenuImageView.image = cellImage;
                }
                else if(row == 2)
                {
                    cell.orgMenuLabel.text = @"Directory";
                    
                    UIImage *cellImage = [UIImage imageNamed:@"directory.png"];
                    cell.orgMenuImageView.image = cellImage;
                    
                }
                else if(row == 3)
                {
                    cell.orgMenuLabel.text = @"Admin Console";
                    UIImage *cellImage = [UIImage imageNamed:@"hub.png"];
                    cell.orgMenuImageView.image = cellImage;
                    
                    
                }
                
                
            }
            else if(section == 2)
            {
                if (row == 0)
                {
                    cell.orgMenuLabel.text = @"Worship Team";
                    
                    UIImage *cellImage1 = [UIImage imageNamed:@"hub.png"];
                    cell.orgMenuImageView.image = cellImage1;
                    
                    
                }
                else if (row == 1)
                {
                    cell.orgMenuLabel.text= @"Facility Group";
                    
                    UIImage *cellImage2 = [UIImage imageNamed:@"hub.png"];
                    cell.orgMenuImageView.image = cellImage2;
                    
                }
                else if (row == 2)
                {
                    cell.orgMenuLabel.text= @"Men's Ministry";
                    
                    UIImage *cellImage3 = [UIImage imageNamed:@"hub.png"];
                    cell.orgMenuImageView.image = cellImage3;
                    
                }
                
            }
            else if(section == 3)
            {
                if (row == 0)
                {
                    cell.orgMenuLabel.text = @"Switch Organizations";
                    
                    UIImage *cellImage = [UIImage imageNamed:@"hub.png"];
                    cell.orgMenuImageView.image = cellImage;
                    
                }
                else if (row == 1)
                {
                    cell.orgMenuLabel.text= @"Logout";
                    
                    UIImage *cellImage = [UIImage imageNamed:@"logout.png"];
                    cell.orgMenuImageView.image = cellImage;
                    
                }
                
                
            }
        
            return cell;
            
            
  
}

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
     int section = indexPath.section;
    if(tableView == self.orgMenuTable)
    {
        if(section == 3)
        {
        if(row == 0)
        {
            [self performSegueWithIdentifier:@"WorshipToOrganizationList" sender:self];
    
        }
            if(row == 1)
            {
                [self performSegueWithIdentifier:@"HubToLogin" sender:self];
                
            }

        }
    }
}

-(void)dismissKeyboard
{
    [self.worshipTeamTextView resignFirstResponder];
    [self.hubTitleLabel resignFirstResponder];
    
    CGPoint p = CGPointMake(0, 0);
    [self.worshipTeamTextView setContentOffset: p];
    

    
    
}
-(void)bringFrontToNormal{
          
        [UIView animateWithDuration:.2 delay:.1 options:UIViewAnimationOptionTransitionFlipFromTop
                     animations:^{
                         
            [self.hubFrontView setFrame:CGRectMake(0, 0, self.hubFrontView.frame.size.width, self.hubFrontView.frame.size.height)];
                     
                     
        }completion:^(BOOL finished){
                         NSLog(@"Done!");  }];
   
    
    
}

-(void)slideFrontToLeft{
    //slide the content view to the left to hide the menu
      
    [UIView animateWithDuration:.2 delay:.1 options:UIViewAnimationOptionTransitionFlipFromTop
                     animations:^{
                         
             
             [self.hubFrontView setFrame:CGRectMake(260, 0, self.hubFrontView.frame.size.width, self.hubFrontView.frame.size.height)];
             
                     
            }completion:^(BOOL finished){
                         NSLog(@"Done!");}];
            
}

-(void)slideFrontToRight{
    //slide the content view to the left to hide the menu
    
    [UIView animateWithDuration:.2 delay:.1 options:UIViewAnimationOptionTransitionFlipFromTop
                     animations:^{
                         
                         
                         [self.hubFrontView setFrame:CGRectMake(-260, 0, self.hubFrontView.frame.size.width, self.hubFrontView.frame.size.height)];
                         
                         
                     }completion:^(BOOL finished){
                         NSLog(@"Done!");}];
    
}



- (IBAction)switchButtonAction:(id)sender
{
    [self hubPageAction:sender];
}
@end
