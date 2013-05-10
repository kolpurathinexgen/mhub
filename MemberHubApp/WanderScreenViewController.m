//
//  WanderScreenViewController.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/19/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "WanderScreenViewController.h"

@interface WanderScreenViewController ()

@end

@implementation WanderScreenViewController

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
    
    
    UIImage *image1 = [UIImage imageNamed:@"1136BG.png"];
    
    self.backgroundImage9.image = image1;
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.backBarButtonItem=nil;
    
    UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lButton setFrame:CGRectMake(0,0,40,40)];
    [lButton setImage:[UIImage imageNamed:@"HubblySpokeButton.png"] forState:UIControlStateNormal];
    [lButton addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *lBarButton = [[UIBarButtonItem alloc] initWithCustomView:lButton];
    self.navigationItem.leftBarButtonItem = lBarButton;
    
    UIButton *rButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rButton setFrame:CGRectMake(0,0,40,40)];
    [rButton setImage:[UIImage imageNamed:@"MemberOptions.png"] forState:UIControlStateNormal];
    [rButton addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rBarButton = [[UIBarButtonItem alloc] initWithCustomView:rButton];
    self.navigationItem.rightBarButtonItem = rBarButton;
    


	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {

    [self setWanderTableCell:nil];
    [self setWTable:nil];
    [self setBackgroundImage9:nil];
    [super viewDidUnload];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
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
    
    WanderScreenCell * cell = (WanderScreenCell *)[tableView dequeueReusableCellWithIdentifier:@"WCell"];
    
    if(cell == nil ) // !cell means that if cell is nil
    {
        cell = [[WanderScreenCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WCell"];
    }
    
    int row = indexPath.row;
    
    
    if (row == 0)
    {
        cell.wanderLabel.text = @"Your Hub";
        
        UIImage *cellImage = [UIImage imageNamed:@"hub_icon.png"];
        cell.wanderImageView.image = cellImage;
        
    }
    else if (row == 1)
    {
        cell.wanderLabel.text = @"Your Profile";
        
        UIImage *cellImage = [UIImage imageNamed:@"user.png"];
        cell.wanderImageView.image = cellImage;
    }
    else if(row == 2)
    {
        cell.wanderLabel.text = @"Directory";
        
        UIImage *cellImage = [UIImage imageNamed:@"Images-5.jpeg"];
        cell.wanderImageView.image = cellImage;
    }
    else if(row == 3)
    {
        cell.wanderLabel.text = @"Admin Console";
        
        UIImage *cellImage = [UIImage imageNamed:@"Images-5.jpeg"];
        cell.wanderImageView.image = cellImage;
        
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row  = indexPath.row;
    /*if(row == 0)
    {
        [self performSegueWithIdentifier:@"ChurchToHubofChurch" sender:self];
    }*/
    
    if(row == 1)
    {
        [self performSegueWithIdentifier:@"WanderScreenToProfile" sender:self];
    }
    if(row == 2)
    {
        [self performSegueWithIdentifier:@"WanderToDirectory" sender:self];
    }
    
}

@end
