//
//  TriangleViewController.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/19/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "TriangleViewController.h"

@interface TriangleViewController ()

@end

@implementation TriangleViewController

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
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.backBarButtonItem=nil;
    
     UIBarButtonItem *btnBack = [[UIBarButtonItem alloc]
                     initWithTitle:@"Back"
                     style:UIBarButtonItemStyleBordered
                     target:self
                     action:@selector(backAction:)];
    
    self.navigationItem.leftBarButtonItem = btnBack;

    
    /*UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [lButton setFrame:CGRectMake(0,0,40,40)];
    [lButton setImage:[UIImage imageNamed:@"HubblySpokeButton.png"] forState:UIControlStateNormal];
    [lButton addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *lBarButton = [[UIBarButtonItem alloc] initWithCustomView:lButton];
    self.navigationItem.leftBarButtonItem = lBarButton;*/
    
    UIButton *rButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rButton setFrame:CGRectMake(0,0,40,40)];
    [rButton setImage:[UIImage imageNamed:@"HubblySpokeButton.png"] forState:UIControlStateNormal];
    [rButton addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rBarButton = [[UIBarButtonItem alloc] initWithCustomView:rButton];
    self.navigationItem.rightBarButtonItem = rBarButton;

    

    UIImage *image1 = [UIImage imageNamed:@"1136BG.png"];
    
    self.backgroundImageView10.image = image1;
    
	// Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTriangleTable:nil];
    [self setBackgroundImageView10:nil];
    [self setSwitchButton:nil];
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
    
    TriangleCell * cell = (TriangleCell *)[tableView dequeueReusableCellWithIdentifier:@"TCell"];
    
    if(cell == nil ) // !cell means that if cell is nil
    {
        cell = [[TriangleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TCell"];
    }
    
    int row = indexPath.row;
    
    
    if (row == 0)
    {
        cell.triangleLabel.text = @"Your Hub";
        
        UIImage *cellImage = [UIImage imageNamed:@"hub_icon.png"];
        cell.triangleImage.image = cellImage;
        
    }
    else if (row == 1)
    {
        cell.triangleLabel.text = @"Your Profile";
        
        UIImage *cellImage = [UIImage imageNamed:@"user.png"];
        cell.triangleImage.image = cellImage;
    }
    else if(row == 2)
    {
        cell.triangleLabel.text = @"Directory";
        
        UIImage *cellImage = [UIImage imageNamed:@"Images-5.jpeg"];
        cell.triangleImage.image = cellImage;
    }
    else if(row == 3)
    {
        cell.triangleLabel.text = @"Admin Console";
        
        UIImage *cellImage = [UIImage imageNamed:@"Images-5.jpeg"];
        cell.triangleImage.image = cellImage;
        
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

- (IBAction)switchAction:(id)sender {
}
@end
