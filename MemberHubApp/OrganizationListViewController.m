//
//  OrganizationListViewController.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/10/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "OrganizationListViewController.h"
#import "OrganizationListCell.h"
#import "OptionViewController.h"
#import "Organization.h"
#import <QuartzCore/QuartzCore.h>


@interface OrganizationListViewController ()

@end

@implementation OrganizationListViewController

@synthesize orgListTable;
@synthesize orgImageView;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        // Custom initialization
    }
    return self;
}

-(IBAction)hubPageAction:(id)sender
{
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [self.navigationController popViewControllerAnimated:YES];

    self.org = nil;
    [self performSegueWithIdentifier:@"OptionToOrganization" sender:self];
}

-(IBAction)profilePageAction:(id)sender
{
    [self performSegueWithIdentifier:@"OptionToProfile" sender:self];
}

 -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"OptionToOrganization"])
    {
        OptionViewController *controller = (OptionViewController *)segue.destinationViewController;
        controller.currentOrganization = self.org;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.orgListTable.scrollEnabled = NO;

    
    self.OrgHeadLabel.text  = @"Organizations";
   
    
    self.orgListTable.layer.cornerRadius = 30;
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = nil;
    
    
    UIImage *image1 = [UIImage imageNamed:@"1136BG.png"];
    self.orgImageView.image = image1;
    
    UIImage *image2 = [UIImage imageNamed:@"logo_revised_small.png"];
    self.logoImageOption.image = image2;
    

    MHRequest* request = [MHRequest alloc];
    request.requestKey = @"listOrg";
    
    MHResponse* res = [super executeService:request];
    
    RKObjectRequestOperation* operation = [res rro];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *op, RKMappingResult *mappingResult) {
        NSLog(@"success..%@", [mappingResult array] );
    } failure:nil];
    
    [operation start];
    
    
   /* UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
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
    self.navigationItem.rightBarButtonItem = rBarButton;*/
    
  
    
}

- (void)viewDidUnload
{
   
    [self setLogoImageOption:nil];
    [self setOrgListView:nil];
    [self setOrgHeadLabel:nil];
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
    OrganizationListCell * cell = (OrganizationListCell *)[tableView dequeueReusableCellWithIdentifier:@"OLCell"];
    
   if(cell == nil ) // !cell means that if cell is nil
    {
       cell = [[OrganizationListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OLcell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
          
    int row = indexPath.row;
    
      
    if (row == 0)
    {
        cell.orgCellLabel.text = @"Wander years of Learning";
               
        
        NSString * filepath = [[NSBundle mainBundle]  pathForResource:@"hub" ofType:@"png"];
        UIImage * cellImage = [UIImage imageWithContentsOfFile:filepath];

        cell.orgCellImageView.image = cellImage;
        
        cell.orgCellLabel.tag = 100;
        
    }
    else if (row == 1)
    {
        cell.orgCellLabel.text = @"Church of the Apostles";
        
        NSString * filepath = [[NSBundle mainBundle]  pathForResource:@"hub" ofType:@"png"];
        UIImage * cellImage = [UIImage imageWithContentsOfFile:filepath];
        cell.orgCellImageView.image = cellImage;
        cell.orgCellLabel.tag = 100;
    }
    if(row == 2)
    {
        cell.orgCellLabel.text = @"YMCA of the Triangle";
        NSString * filepath = [[NSBundle mainBundle]  pathForResource:@"hub" ofType:@"png"];
        UIImage * cellImage = [UIImage imageWithContentsOfFile:filepath];
        cell.orgCellImageView.image = cellImage;
        cell.orgCellLabel.tag = 100;

    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    Organization * tmp = [[Organization alloc] init];
    self.org = tmp;
    if(row == 0)
    {
        self.org.title = @"Wander years of Learning";
 
    }
    if(row == 1)
    {
       self.org.title = @"Church of the Apostles";
        
    }

     else if(row == 2)
    {
        self.org.title = @"YMCA of the Triangle";        
    }

    
    [self performSegueWithIdentifier:@"OptionToOrganization" sender:self];
}

@end
