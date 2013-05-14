//
//  OrganizationListViewController.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/10/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "OrganizationListViewController.h"
#import "OrganizationListCell.h"
#import "DashBoardViewController.h"
#import "Organization.h"
#import <QuartzCore/QuartzCore.h>
#import "LoginAppDelegate.h"
#import <RestKit/RestKit.h>



@interface OrganizationListViewController ()

@end

@implementation OrganizationListViewController

@synthesize orgListTable;
@synthesize orgImageView;




- (void)loadOrganizations
{
    // Load the object model via RestKit
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    
    
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[Organization class]];
    [responseMapping addAttributeMappingsFromDictionary:@{
     @"id" : @"orgID",
     @"name" : @"title"
     }];
    
    
    // Register our mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseMapping   pathPattern:nil   keyPath:@""  statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [objectManager addResponseDescriptor:responseDescriptor];
    
    
    LoginAppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
    NSString * orgPath = [NSString stringWithFormat:@"/api2/v1/orgs?token=%@", appDelegate.loginToken];
    
    [objectManager getObjectsAtPath:orgPath
                         parameters:nil
                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult)
     {
         NSArray* statuses = [mappingResult array];
         NSLog(@"Loaded statuses: %@", statuses);
         myOrganizations = statuses;
         [self.orgListTable reloadData];
     }
                            failure:^(RKObjectRequestOperation *operation, NSError *error)
     {
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                         message:@"Could not fetch the organizations list"delegate:nil
                                               cancelButtonTitle:@"OK" otherButtonTitles:nil];
         [alert show];
         NSLog(@"Organization server fetch error: %@", error);
     }];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadOrganizations];
}


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
        DashBoardViewController *controller = (DashBoardViewController *)segue.destinationViewController;
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
    if( myOrganizations != nil )
        return [myOrganizations count];
    else
        return 0;
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
    
    Organization * org = [myOrganizations objectAtIndex:row];
    cell.orgCellLabel.text = org.title;
    NSString * filepath = [[NSBundle mainBundle]  pathForResource:@"hub" ofType:@"png"];
    UIImage * cellImage = [UIImage imageWithContentsOfFile:filepath];
    cell.orgCellImageView.image = cellImage;
    cell.tag = 100 + row;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    Organization * tmp = [myOrganizations objectAtIndex:row];
    self.org = tmp;
    
    [self performSegueWithIdentifier:@"OptionToOrganization" sender:self];
}

@end
