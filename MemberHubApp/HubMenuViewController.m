//
//  HubMenuViewController.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/20/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "HubMenuViewController.h"
#import "HubMenuCell.h"

@interface HubMenuViewController ()

@end

@implementation HubMenuViewController

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
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc]
                                initWithTitle:@"Back"
                                style:UIBarButtonItemStyleBordered
                                target:self
                                action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem = btnBack;
    

    
    UIButton *Button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Button1 setFrame:CGRectMake(0,0,40,40)];
    [Button1 setImage:[UIImage imageNamed:@"HubblySpokeButton.png"] forState:UIControlStateNormal];
    [Button1 addTarget:self action:@selector(hubCellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.hubCellButton = Button1;

    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    self.tableExpanded = FALSE;
    //[self.view endEditing:YES];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setHubTable:nil];
    [self setHubBackgroundImage:nil];
    [self setHubCellButton:nil];
    [super viewDidUnload];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.tableExpanded)
    {
        return 8;
    }
    else
        return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HubMenuCell * cell = (HubMenuCell *)[tableView dequeueReusableCellWithIdentifier:@"HMCell"];
    
    if(cell == nil ) // !cell means that if cell is nil
    {
        cell = [[HubMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HMCell"];
    }
    
    int row = indexPath.row;
    
    
    if (row == 0)
    {
        cell.hubMenuLabel.text = @"Home Page";
        
        UIImage *cellImage = [UIImage imageNamed:@"home_icon.png"];
        cell.hubMenuImageView.image = cellImage;
            }
    else if (row == 1)
    {
        cell.hubMenuLabel.text = @"Announcements";
        
        UIImage *cellImage = [UIImage imageNamed:@"announcements_icon.png"];
        cell.hubMenuImageView.image = cellImage;
               

    }
    else if(row == 2)
    {
        cell.hubMenuLabel.text = @"Calender";
        
        UIImage *cellImage = [UIImage imageNamed:@"calendar_icon.png"];
        cell.hubMenuImageView.image = cellImage;
           }
    else if(row == 3)
    {
        cell.hubMenuLabel.text = @"Discussions";
        
        UIImage *cellImage = [UIImage imageNamed:@"discussions_icon.png"];
        cell.hubMenuImageView.image = cellImage;
       
        
    }
    else if(row == 4)
    {
        cell.hubMenuLabel.text = @"Files";
        
        UIImage *cellImage = [UIImage imageNamed:@"files_icon.png"];
        cell.hubMenuImageView.image = cellImage;
               
    }
    else if(row == 5)
    {
        cell.hubMenuLabel.text = @"Members";
        
        UIImage *cellImage = [UIImage imageNamed:@"members_icon.png"];
        cell.hubMenuImageView.image = cellImage;
               
    }
    else if(row == 6)
    {
        cell.hubMenuLabel.text = @"Photos";
        
        UIImage *cellImage = [UIImage imageNamed:@"albums_icon.png"];
        cell.hubMenuImageView.image = cellImage;
               
    }
    else if(row == 7)
    {
        cell.hubMenuLabel.text = @"WhiteBoards";
        
        UIImage *cellImage = [UIImage imageNamed:@"whiteboard_icon.png"];
        cell.hubMenuImageView.image = cellImage;
               
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
        [self performSegueWithIdentifier:@"TriangleToProfile" sender:self];
    }
    if(row == 2)
    {
        [self performSegueWithIdentifier:@"TriangleToDirectory" sender:self];
    }
        
}

- (IBAction)hubSlideAction:(id)sender
{
    if(self.tableExpanded)
    {
       self.tableExpanded = FALSE;
    }
    else
    {
       self.tableExpanded = TRUE;
    }
    [self.hubTable reloadData];
    
}

- (IBAction)hubCellButtonAction:(id)sender
{
   [self dismissViewControllerAnimated:YES completion:nil];
}
@end
