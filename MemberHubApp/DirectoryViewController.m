//
//  DirectoryViewController.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/16/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "DirectoryViewController.h"
#import "Directory.h"

@interface DirectoryViewController ()

@end

@implementation DirectoryViewController
@synthesize directoryTableView;
@synthesize dTable;
@synthesize memberInfo;
@synthesize searchMembers;
@synthesize filteredSearch;

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

-(IBAction)profilePageAction:(id)sender
{
    [self performSegueWithIdentifier:@"OptionsToProfile" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *image1 = [UIImage imageNamed:@"1136BG.png"];
    
    self.backGroundImage11.image = image1;
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.backBarButtonItem=nil;
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.backBarButtonItem=nil;
    
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc]
                                initWithTitle:@"Back"
                                style:UIBarButtonItemStyleBordered
                                target:self
                                action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem = btnBack;
    
    /*UIButton *rButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rButton setFrame:CGRectMake(0,0,40,40)];
    [rButton setImage:[UIImage imageNamed:@"MemberOptions.png"] forState:UIControlStateNormal];
    [rButton addTarget:self action:@selector(profilePageAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rBarButton = [[UIBarButtonItem alloc] initWithCustomView:rButton];
    self.navigationItem.rightBarButtonItem = rBarButton;*/


    self.filteredSearch = [NSMutableArray arrayWithCapacity:[memberInfo count]];
    
    self.memberInfo = [[NSMutableArray alloc]init];
    Directory *p1 = [[Directory alloc]init];
    
    p1.memberName = @"Arjun";
    UIImage *cellImage1 = [UIImage imageNamed:@"user.png"];
    p1.mImageView = cellImage1;
    [self.memberInfo addObject:p1];
    
    
    Directory *p2 = [[Directory alloc]init];

    p2.memberName = @"Arun";
    UIImage *cellImage2 = [UIImage imageNamed:@"user.png"];
    p2.mImageView = cellImage2;
    [self.memberInfo addObject:p2];
    
    Directory *p3 = [[Directory alloc]init];
    
    p3.memberName = @"Chitra";
    UIImage *cellImage3 = [UIImage imageNamed:@"user.png"];
    p3.mImageView = cellImage3;
    [self.memberInfo addObject:p3];
    
    Directory *p4 = [[Directory alloc]init];
    
    p4.memberName = @"Sakshi";
    UIImage *cellImage4 = [UIImage imageNamed:@"user.png"];
    p4.mImageView = cellImage4;
    [self.memberInfo addObject:p4];
    
    Directory *p5 = [[Directory alloc]init];
    
    p5.memberName = @"Charles";
    UIImage *cellImage5 = [UIImage imageNamed:@"user.png"];
    p5.mImageView = cellImage5;
    [self.memberInfo addObject:p5];
    
    Directory *p6 = [[Directory alloc]init];

    p6.memberName = @"David";
    UIImage *cellImage6 = [UIImage imageNamed:@"user.png"];
    p6.mImageView = cellImage6;
    [self.memberInfo addObject:p4];
    
    Directory *p7 = [[Directory alloc]init];
    
    p7.memberName = @"Amy";
    UIImage *cellImage7 = [UIImage imageNamed:@"user.png"];
    p7.mImageView = cellImage7;
    [self.memberInfo addObject:p4];
    
    Directory *p8 = [[Directory alloc]init];
    
    p8.memberName = @"Kumar";
    UIImage *cellImage8 = [UIImage imageNamed:@"user.png"];
    p4.mImageView = cellImage8;
    [self.memberInfo addObject:p4];
    
    Directory *p9 = [[Directory alloc]init];

    p9.memberName = @"Elizabeth";
    UIImage *cellImage9 = [UIImage imageNamed:@"user.png"];
    p4.mImageView = cellImage9;
    [self.memberInfo addObject:p9];
    
           
    Directory *p10 = [[Directory alloc]init];
    
    p10.memberName = @"Jerry";
    UIImage *cellImage10 = [UIImage imageNamed:@"user.png"];
    p10.mImageView = cellImage10;
    [self.memberInfo addObject:p4];
    
    Directory *p11 = [[Directory alloc]init];

    p11.memberName = @"John";
    UIImage *cellImage11 = [UIImage imageNamed:@"user.png"];
    p11.mImageView = cellImage11;
    [self.memberInfo addObject:p4];
    
    Directory *p12 = [[Directory alloc]init];

    p12.memberName = @"Brain";
    UIImage *cellImage12 = [UIImage imageNamed:@"user.png"];
    p4.mImageView = cellImage12;
    [self.memberInfo addObject:p12];

    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setDirectoryTableView:nil];
    [self setDTable:nil];
    [self setBackGroundImage11:nil];
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
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [filteredSearch count];
    }
    else
    {
        return [memberInfo count];
    }
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}


-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DirectoryCustomCell * cell = (DirectoryCustomCell *)[tableView dequeueReusableCellWithIdentifier:@"DirCell"];
    
    if(cell == nil ) // !cell means that if cell is nil
    {
        [[NSBundle mainBundle] loadNibNamed:@"DirectoryCell" owner:self options:nil];
        
        cell = self.directoryTableView;
        self.directoryTableView = nil;
    }
    int row = indexPath.row;
    Directory * Directory = nil;
    
    Directory = [self.memberInfo objectAtIndex:row];
        
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        Directory = [filteredSearch objectAtIndex:row];
       
    }
    else
        Directory = [self.memberInfo objectAtIndex:row];
    
    cell.directoryLabel.text = Directory.memberName;
    UIImage *cellImage = [UIImage imageNamed:@"user.png"];
    cell.DirectoryImageView.image = cellImage;
    
    return cell;
}

-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredSearch removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.memberName BEGINSWITH [cd] %@",searchText];
    self.filteredSearch = [NSMutableArray arrayWithArray:[self.memberInfo filteredArrayUsingPredicate:predicate]];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


    
@end
