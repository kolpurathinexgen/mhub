//
//  LoginViewController.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/9/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginCell.h"
#import "OrganizationListViewController.h"
#import "LoginCell.h"
#import <QuartzCore/QuartzCore.h>
#import "LoginResponse.h"
#import "Login.h"
#import <RestKit/RestKit.h>
#import "LoginAppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize cLogin;
@synthesize loginTable;
@synthesize backgroundImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];

    
    UIImage *image1 = [UIImage imageNamed:@"1136BG.png"];
    
    self.backgroundImageView.image = image1;
    
    UIImage *image2 = [UIImage imageNamed:@"logo_revised_small.png"];
    
    self.logoImage.image = image2;

    self.loginTable.scrollEnabled = NO;
       
    self.loginTable.layer.cornerRadius = 12;
    self.goActionButton.layer.cornerRadius = 7;
    

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setLoginTable:nil];
    [self setBackgroundImageView:nil];
    
    [self setCLogin:nil];
    [self setLogoImage:nil];
    [self setGoActionButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
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
    LoginCell * cell = (LoginCell *)[tableView dequeueReusableCellWithIdentifier:@"LCell"];
    
    if(cell == nil ) // !cell means that if cell is nil
    {
        [[NSBundle mainBundle] loadNibNamed:@"Login" owner:self options:nil];
        
        
        cell = self.cLogin;
        self.cLogin = nil;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    int row = indexPath.row;
    
       
    if (row == 0)
    {
        cell.loginLabel.text = @"Email";
        //cell.loginLabel.font = [UIFont systemFontOfSize:14];
        cell.loginTextField.text = @"";
        cell.loginTextField.keyboardType = UIKeyboardTypeEmailAddress;
        cell.loginTextField.tag = 100;
        
        
    }
    else if (row == 1)
    {
        cell.loginLabel.text = @"Password";
        //cell.loginLabel.font = [UIFont systemFontOfSize:14];
        cell.loginTextField.text = @"";
        cell.loginTextField.keyboardType = UIKeyboardTypeDefault;
        cell.loginTextField.secureTextEntry = YES;
        cell.loginTextField.tag = 200;

    }
    return cell;
    
    
}
- (BOOL)isValid
{
    UITextField * loginTF = (UITextField * )[self.loginTable viewWithTag:100];
    UITextField * passwordTF = (UITextField * )[self.loginTable viewWithTag:200];
    NSString *  emailText = loginTF.text;
    NSString * passwordText = passwordTF.text;
    
    if(emailText.length == 0)
    {
        UIAlertView *alertText = [[UIAlertView alloc] initWithTitle:@"Error"  message:@"Email is not valid" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertText show];
        
        return FALSE;
        
    }
    else if( passwordText.length == 0 )
    {
        UIAlertView *alertText = [[UIAlertView alloc] initWithTitle:@"Error"  message:@"Password is not valid" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertText show];
        
        return FALSE;
        
    }
    else if([self validateEmailWithString:emailText] == FALSE)
    {
        UIAlertView *alertText = [[UIAlertView alloc] initWithTitle:@"Error"  message:@"Email format is not correct" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertText show];
        
        return FALSE;
    }
    else
        return TRUE;
    

}

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- (IBAction)goAction:(id)sender
{
    [self.view endEditing:YES];
    if([self isValid])
    {
        UITextField * loginTF = (UITextField * )[self.loginTable viewWithTag:100];
        UITextField * passwordTF = (UITextField * )[self.loginTable viewWithTag:200];
        NSString *  emailText = loginTF.text;
        NSString * passwordText = passwordTF.text;
        
        Login * loginObject = [[Login alloc] init];
        loginObject.username = emailText;
        loginObject.password = passwordText;
        [self loginAction:loginObject];
        //[self performSegueWithIdentifier:@"LoginToOption" sender:sender];
    }
}

-(void)loginAction:(Login *)loginObject
{
    RKLogConfigureByName("RestKit/Network*", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);

    NSString * memberHubRUL = @"https://www.memberhub.com";
    
    NSURL* baseURL = [[NSURL alloc]initWithString:memberHubRUL];
    
    AFHTTPClient* client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    //we want to work with JSON-Data
    [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    
    // Initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    
    RKObjectMapping *requestMapping = [RKObjectMapping requestMapping];
    [requestMapping addAttributeMappingsFromDictionary:@{ @"username" : @"email",
     @"password" : @"password" }];
    
    RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:requestMapping  objectClass:[Login class]   rootKeyPath:@""];
    
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[LoginResponse class]];
    [responseMapping addAttributeMappingsFromDictionary:@{
     @"id" : @"loginID",
     @"authentication_token" : @"loginToken"
     }];
    
    
    // Register our mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseMapping   pathPattern:nil   keyPath:@""  statusCodes:[NSIndexSet indexSetWithIndex:201]];
    
    [objectManager addRequestDescriptor:requestDescriptor];
    [objectManager addResponseDescriptor:responseDescriptor];
    
    [objectManager postObject:loginObject path:@"/api2/v1/login" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *result)
     {
         NSLog(@"We object mapped the response with the following result: %@", result);
         LoginResponse * loginresponse = [result firstObject];
         LoginAppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
         [appDelegate saveLoginDetailsToDisk :loginresponse ];

         [self performSegueWithIdentifier:@"LoginToOption" sender:self];

     } failure:^(RKObjectRequestOperation *operation, NSError *error) {
         NSLog(@"Failure logging in");
         UIAlertView *alertText = [[UIAlertView alloc] initWithTitle:@"Login Failed"  message:@"Please check your User Name and Password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
         
         [alertText show];

         
     }];
    
}




    @end
