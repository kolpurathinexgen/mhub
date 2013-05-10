//
//  ProfileScreenViewController.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/11/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "ProfileScreenViewController.h"
#import "Profile.h"
#import "ProfileCell.h"
#import <QuartzCore/QuartzCore.h>
#import "OrganizationListViewController.h"
#import "OrgMenuCell.h"
#import "ProfileAddressCell.h"
#import "HubListViewController.h"
#import "HubViewController.h"
#import "AddressScreenViewController.h"

@interface ProfileScreenViewController ()

@end

@implementation ProfileScreenViewController
@synthesize addressButton;

@synthesize profileScreenTable;
@synthesize profileImage;

@synthesize profileLabel;

@synthesize cProfile;
@synthesize profileAddressTextView;

static int selectedPhoneRow = 0;

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
   
}

-(IBAction)profilePageAction:(id)sender
{
    NSLog(@"ProfilePageAction called");
    if(self.profileFrontView.frame.origin.x == 0)
    {
        [self.orgMenuTable reloadData];
        [self showMenu];
        
    }
    else
    {
        [self hideMenu];
    }
    


    [self performSegueWithIdentifier:@"ProfileToOption" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"ProfileToWorship"])
    {
        HubViewController *controller = ( HubViewController *)segue.destinationViewController;
        controller.currentHubTitle = self.selectedTitle;
    }
    else if([segue.identifier isEqualToString:@"ProfileToAddress"])
    {
        AddressScreenViewController *controller = ( AddressScreenViewController *)segue.destinationViewController;
        controller.selectedPhoneNumberTag = selectedPhoneRow;
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view sendSubviewToBack:self.backgroundImageView];
    
    self.profileAddressTable.scrollEnabled = NO;
    self.profileScreenTable.scrollEnabled = NO;
    self.orgMenuTable.scrollEnabled = NO;

   
    [[self navigationController] setNavigationBarHidden:YES animated:YES];

    self.profileAddressTextView.layer.cornerRadius = 10;
    
    CALayer *layer = addressButton.layer;
    layer.backgroundColor = [[UIColor clearColor] CGColor];
    
    UIImage *image1 = [UIImage imageNamed:@"1136BG.png"];
    
    self.profileImageView.image = image1;

    self.profileMenuView.frame = CGRectMake(self.profileMenuView.frame.origin.x, self.profileMenuView.frame.origin.y, self.profileMenuView.frame.size.width, self.view.frame.size.height);
    
    self.backgroundImageView.image = image1;
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.backBarButtonItem=nil;
    

    
    
   
    
    UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lButton setFrame:CGRectMake(0,0,40,30)];
    //[lButton setFrame:CGRectMake(,0,500,30)];
    [lButton setImage:[UIImage imageNamed:@"Org-Navigation.png"] forState:UIControlStateNormal];
    [lButton addTarget:self action:@selector(hubPageAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *lBarButton = [[UIBarButtonItem alloc] initWithCustomView:lButton];
    lButton.hidden = YES;
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIButton *rButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rButton setFrame:CGRectMake(0,0,40,30)];
    //[lButton setFrame:CGRectMake(,0,500,30)];
    [rButton setImage:[UIImage imageNamed:@"Org-Navigation.png"] forState:UIControlStateNormal];
    [rButton addTarget:self action:@selector(hubPageAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rBarButton = [[UIBarButtonItem alloc] initWithCustomView:rButton];
    
       
    
   
    /*UIBarButtonItem *btnDirectory = [[UIBarButtonItem alloc]
                                initWithTitle:@"Directory"
                                style:UIBarButtonItemStyleBordered
                                target:self
                                action:@selector(profilePageAction::)];
   // self.navigationItem.rightBarButtonItem = btnDirectory;*/
    
    
    
/*  UIButton *rButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rButton setFrame:CGRectMake(0,0,40,30)];
    [rButton setImage:[UIImage imageNamed:@"MemberOptions.png"] forState:UIControlStateNormal];
    [rButton addTarget:self action:@selector(profilePageAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rBarButton = [[UIBarButtonItem alloc] initWithCustomView:]; */
    //self.navigationItem.rightBarButtonItem = rBarButton;
    
    self.toolBar.items  = [NSArray arrayWithObjects:lBarButton,flexible,rBarButton,nil];
    

    

    
    
    [self.view bringSubviewToFront:self.profileFrontView];
   
    self.profileImage.userInteractionEnabled = YES;
    UITapGestureRecognizer * sTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapImage:)];
    
    [self.profileImage addGestureRecognizer:sTap];
    
    [self.profileFrontView bringSubviewToFront:self.addressButton];
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setProfileScreenTable:nil];
    [self setProfileImage:nil];
    [self setProfileLabel:nil];
    
    
    [self setCProfile:nil];
    
    
    [self setAddressButton:nil];
    [self setProfileFrontView:nil];
    [self setProfileMenuView:nil];
    [self setProfileImageView:nil];
    [self setToolBar:nil];
    [self setProfileAddressTable:nil];
    [self setOrgMenuTable:nil];
    [self setBackgroundImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIImage *cellImage = [UIImage imageNamed:@"avatar.png"];
    self.profileImage.image = cellImage;
    //[self.profileScreenTable reloadData];
    [self.profileAddressTable reloadData];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.profileScreenTable)
    {
        return 1;
    }
    else if (tableView == self.orgMenuTable)
    {
        return 4;
    }
    else if (tableView == self.profileAddressTable)
    {
        return 1;
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.profileScreenTable)
    {
        return 3;
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
    else if (tableView == self.profileAddressTable)
    {
            return 1;
    }
  
    
}

- (NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section
{
    if(aTableView == self.profileScreenTable)
    {
        return @"";
    }
    else if(aTableView == self.profileAddressTable)
    {
        return @"";
    }   
    else if (aTableView == self.orgMenuTable)
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


/*-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(tableView == profileScreenTable)
    {
        return nil;
    }

    else if(tableView == self.hubMenuTable)
    {
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 728, 40)];
    sectionView.backgroundColor = [UIColor grayColor];
    
    //For using an image use this:
    //sectionView.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"whiteBackground.png"]];
    
    return sectionView;
    }
}*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.profileScreenTable)
    {
        ProfileCell * cell = (ProfileCell *)[tableView dequeueReusableCellWithIdentifier:@"PCell"];
    
        if(cell == nil ) // !cell means that if cell is nil
        {
            [[NSBundle mainBundle] loadNibNamed:@"ProfileScreen" owner:self options:nil];
        }
        
        cell = self.cProfile;
        self.cProfile = nil;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        int row = indexPath.row;
        
        
        
        self.profileLabel.text = @"Matt Harell";
        
        if(row == 0)
        {
            cell.profileLabel.text = @"Mobile";
            cell.profileTextLabel.text = @" 919 -222-2222";
        }
        
        if(row == 1)
        {
            cell.profileLabel.text = @"Home";
            cell.profileTextLabel.text = @"(919)-912-1234";
        }
        
        if(row == 2)
        {
            cell.profileLabel.text = @"Work";
            cell.profileTextLabel.text = @"(919)-912-1234";
        }
        
                
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        return cell;

    }
    else if(tableView == self.orgMenuTable)
    {
        
        

        OrgMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OCell"];
        
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
        if(cell == nil ) // !cell means that if cell is nil
        {
            cell = [[OrgMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OCell"];
        }
        UIView *bgColorView = [[UIView alloc] init];
        [bgColorView setBackgroundColor:[UIColor colorWithRed:41.0/255 green:47.0/255 blue:61.0/255 alpha:1]];
        [cell setSelectedBackgroundView:bgColorView];
        
        /*UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, cell.contentView.frame.size.height - 1.0, cell.contentView.frame.size.width, 1)];
        
        lineView.backgroundColor = [UIColor darkGrayColor];
        [cell.contentView addSubview:lineView];*/
        

        int row = indexPath.row;
        
        int section = indexPath.section;
        
        if(section == 0)
        {
            cell.menuLabel.text = @"Matt Harell";
            UIImage *cellImage = [UIImage imageNamed:@"avatar.png"];
            cell.menuImageView.image = cellImage;
            
            
        }
        else if(section == 1)
        {
            if (row == 0)
            {
                cell.menuLabel.text = @"Dashboard";
                
                UIImage *cellImage = [UIImage imageNamed:@"hub.png"];
                cell.menuImageView.image = cellImage;
                
            }
            else if (row == 1)
            {
                cell.menuLabel.text= @"Main Calender";
                
                UIImage *cellImage = [UIImage imageNamed:@"calendar.png"];
                cell.menuImageView.image = cellImage;
            }
            else if(row == 2)
            {
                cell.menuLabel.text = @"Directory";
                
                UIImage *cellImage = [UIImage imageNamed:@"directory.png"];
                cell.menuImageView.image = cellImage;
                
            }
            else if(row == 3)
            {
                cell.menuLabel.text = @"Admin Console";
                UIImage *cellImage = [UIImage imageNamed:@"hub.png"];
                cell.menuImageView.image = cellImage;

                
            }
            
            
        }
        else if(section == 2)
        {
            if (row == 0)
            {
                cell.menuLabel.text = @"Worship Team";
                
                UIImage *cellImage1 = [UIImage imageNamed:@"hub.png"];
                cell.menuImageView.image = cellImage1;
                
                
            }
            else if (row == 1)
            {
                cell.menuLabel.text= @"Facility Group";
                
                UIImage *cellImage2 = [UIImage imageNamed:@"hub.png"];
                cell.menuImageView.image = cellImage2;
                
            }
            else if (row == 2)
            {
                cell.menuLabel.text= @"Men's Ministry";
                
                UIImage *cellImage3 = [UIImage imageNamed:@"hub.png"];
                cell.menuImageView.image = cellImage3;
                
            }

        }
        else if(section == 3)
        {
            if (row == 0)
            {
                cell.menuLabel.text = @"Switch Organizations";
                
                UIImage *cellImage = [UIImage imageNamed:@"hub.png"];
                cell.menuImageView.image = cellImage;
                
            }
            else if (row == 1)
            {
                cell.menuLabel.text= @"Logout";
                
                UIImage *cellImage = [UIImage imageNamed:@"logout.png"];
                cell.menuImageView.image = cellImage;
                
            }
            
            
        }
        return cell;
    
    }
    else if(tableView == self.profileAddressTable)
    {
        ProfileAddressCell * cell = (ProfileAddressCell *)[tableView dequeueReusableCellWithIdentifier:@"PACell"];
        
        if(cell == nil ) // !cell means that if cell is nil
        {
            cell = [[ProfileAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PACell"];
        }
        
        
        int row = indexPath.row;
        
        
        
        cell.profileAddressLabel1.text = @"511 Harvey Street";
        cell.profileAddressLabel2.text = @"Roleigh NC 27608 ";
        cell.profileAddressLabel3.text = @"United States";
        
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];    
        return cell;
            
            
    }
    
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
          
    int section = indexPath.section;
    int row = indexPath.row;
    if(tableView == self.orgMenuTable)
    {
        if(section == 2)
        {
            if(row == 0)
            {   self.selectedTitle = @"Worship Team";
                
            }
            if(row == 1)
            {
                self.selectedTitle = @"Facility Group";
                
            }
            if(row == 2)
            {
                self.selectedTitle = @"Men's Ministry";
            }
            [self performSegueWithIdentifier:@"ProfileToWorship" sender:self];
        }
       if(section == 3)
       {
           if(row == 0)
           {
               [self performSegueWithIdentifier:@"ProfileToOrganizationList" sender:self];
           }
           if(row == 1)
           {
               [self performSegueWithIdentifier:@"ProfileToLogin" sender:self];
           }
           if(row == 2)
           {
               [self performSegueWithIdentifier:@"ProfileToLogin" sender:self];
           }

       }
        
    }
    if(tableView == self.profileScreenTable)
    {
        selectedPhoneRow = row;
        [self performSegueWithIdentifier:@"ProfileToAddress" sender:self];
     }
    if(tableView == self.profileAddressTable)
    {
    
        if(row == 0)
        {
            [self performSegueWithIdentifier:@"ProfileToAddress" sender:self];
        }

    }
    
}

-(void)hideMenu{
    
    //slide the content view to the right to reveal the menu
    [UIView animateWithDuration:.3 delay:.3 options:UIViewAnimationOptionTransitionCurlDown
                     animations:^{
                         
                         [self.profileFrontView setFrame:CGRectMake(0, 0, self.profileFrontView.frame.size.width, self.profileFrontView.frame.size.height)];}
                     completion:^(BOOL finished){
                         NSLog(@"Done!");  }];
    
         
}

-(void)showMenu{
    //slide the content view to the left to hide the menu
    [UIView animateWithDuration:.3 delay:.3 options:UIViewAnimationOptionTransitionCurlUp
                     animations:^{
                         
                         [self.profileFrontView setFrame:CGRectMake(270, 0, self.profileFrontView.frame.size.width, self.profileFrontView.frame.size.height)]; }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");}];
                     
    
}


     
- (IBAction)showMenuDown:(id)sender
{
    
   /* if(self.menuContentView.frame.origin.x == 0) //only show the menu if it is not already shown
        [self showMenu];
    else
        [self hideMenu];*/
    
}

-(void)singleTapImage:(UITapGestureRecognizer *)rec
{
    UIImage *cellImage = [UIImage imageNamed:@"avatar_male_64x64.png"];
    self.profileImage.image = cellImage;
    //[self performSegueWithIdentifier:@"ProfileToProfileEdit" sender:self];
    
    
    UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:@"Set Profile Picture" delegate:self cancelButtonTitle:@"Cancel Button" destructiveButtonTitle:@"Take Photo" otherButtonTitles:@"Choose Existing Photo", @"Delete Photo", nil];
    
    popupQuery.actionSheetStyle = UIActionSheetStyleDefault;
    [popupQuery showInView:[self.view window]];
 
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    UIView * touchview = [touch view];
    
    if ([touch view] == self.profileImage )
    { 
        UIImage *cellImage = [UIImage imageNamed:@"avatar_male_64x64.png"];
        self.profileImage.image = cellImage;
        //[self performSegueWithIdentifier:@"ProfileToProfileEdit" sender:self];
        
        
        UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:@"Set Profile Picture" delegate:self cancelButtonTitle:@"Cancel Button" destructiveButtonTitle:@"Take Photo" otherButtonTitles:@"Choose Existing Photo", @"Delete Photo", nil];
        
        popupQuery.actionSheetStyle = UIActionSheetStyleDefault;
        [popupQuery showInView:[self.view window]];
    }
}

- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate {
    
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)
        || (delegate == nil)
        || (controller == nil))
        return NO;
    
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    mediaUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    // Displays saved pictures and movies, if both are available, from the
    // Camera Roll album.
    mediaUI.mediaTypes =
    [UIImagePickerController availableMediaTypesForSourceType:
     UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    mediaUI.allowsEditing = NO;
    
    mediaUI.delegate = delegate;
    
    [controller presentModalViewController: mediaUI animated: YES];
    return YES;
}

- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToUse;
    
    // Handle a still image picked from a photo album
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        
        editedImage = (UIImage *) [info objectForKey:
                                   UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:
                                     UIImagePickerControllerOriginalImage];
        
        if (editedImage) {
            imageToUse = editedImage;
        } else {
            imageToUse = originalImage;
        }
        // Do something with imageToUse
        
        self.profileImage.image = imageToUse;
    }
    
           
    [[picker parentViewController] dismissModalViewControllerAnimated: YES];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0)
    {
        
    
    }
    else if (buttonIndex == 1)
    {
        [self startMediaBrowserFromViewController: self usingDelegate:self];
    }
    else if (buttonIndex == 2)
    {
    
    }
    else if (buttonIndex == 3)
    {
        
        
        //[self performSegueWithIdentifier:@"ProfileToProfileEdit" sender:self];
    }
    
   
}

- (IBAction)addressAction:(id)sender
{
    [self performSegueWithIdentifier:@"ProfileToAddress" sender:self];
}
@end
