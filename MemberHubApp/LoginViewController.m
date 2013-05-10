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
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
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
    
    MHLoginRequest* req = [MHLoginRequest alloc];
    NSDictionary *parameters = @{ @"email": @"ram.kolpurath@inexgengames.com", @"password": @"memberhub"};
    req.requestKey = @"login";
    req.requestParameters = parameters;
    MHResponse* res = [super executeService:req];
    
    RKObjectRequestOperation* operation = [res rro];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *op, RKMappingResult *mappingResult) {
        NSLog(@"success..%@", [mappingResult array] );
        if(mappingResult.count ==1){
            
            MHAccount* mhAccount = [[mappingResult array] objectAtIndex:0];
            if(mhAccount != NULL){
                MHRESTServiceDelagator* delegator = [MHRESTServiceDelagator sharedInstance];
                delegator.token = [mhAccount token];
                [self performSegueWithIdentifier:@"LoginToOption" sender:sender];
            }
        }
    } failure:nil];
    
    [operation start];
}



    @end
