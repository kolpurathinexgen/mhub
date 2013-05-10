//
//  AddressScreenViewController.m
//  MemberHubApp
//
//  Created by InexgenGames on 4/11/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "AddressScreenViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface AddressScreenViewController ()

@end

@implementation AddressScreenViewController

@synthesize addressTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)cancelAction:(id)sender
{
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    

    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)saveAction:(id)sender {
    
   
   NSString * value = self.addressTextView.text;
    self.addressTextView.text = value;
    value = self.addressTextView.text;

   
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
     self.addressTextView.layer.cornerRadius = 10;
    UIImage *image1 = [UIImage imageNamed:@"1136BG.png"];
    
    self.addressImageView.image = image1;
    
    self.addressTextView.delegate = self;
    self.mobileNoTextField.delegate = self;
    self.homeNoTextField.delegate = self;
    self.workNoTextField.delegate = self;
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];       
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = nil;
    
        
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc]
                                initWithTitle:@"Cancel"
                                style:UIBarButtonItemStyleBordered
                                target:self
                                action:@selector(cancelAction:)];
    self.navigationItem.leftBarButtonItem = btnBack;


    self.mobileNoTextField.text = @"919 - 222-2222";
    self.homeNoTextField.text = @"(919) - 912-1234";
    self.workNoTextField.text = @"(919) - 912-1234";
    
    self.addressTextView.text = @"511 Harvey Street \nRoleigh NC 27608 \nUnited States";

       
    UIBarButtonItem *btnSave = [[UIBarButtonItem alloc]
                                initWithTitle:@"Save"
                                style:UIBarButtonItemStyleBordered
                                target:self
                                action:@selector(saveAction:)];
    self.navigationItem.rightBarButtonItem = btnSave;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.addressImageView  addGestureRecognizer:tap];
    [self.addressScrollView addGestureRecognizer:tap];
    
    
    int y = self.navigationController.navigationBar.hidden?0:44;
   
    self.addressScrollView.frame = CGRectMake(self.addressScrollView.frame.origin.x, y, self.addressScrollView.frame.size.width, self.view.frame.size.height);
    
    	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(self.selectedPhoneNumberTag == 0)
    {
        [self.mobileNoTextField becomeFirstResponder];
    }
    else if(self.selectedPhoneNumberTag == 1)
    {
        [self.homeNoTextField becomeFirstResponder];
    }
    else if(self.selectedPhoneNumberTag == 2)
    {
        [self.workNoTextField becomeFirstResponder];
    }
    else if(self.selectedPhoneNumberTag == 3)
    {
        [self.addressTextView becomeFirstResponder];
    }



}

- (void)viewDidUnload
{
    
    
    [self setMobileNoTextField:nil];
    [self setHomeNoTextField:nil];
    [self setWorkNoTextField:nil];
    [self setAddressImageView:nil];
    [super viewDidUnload];
     [self performSegueWithIdentifier:@"AddressToApostleSecond" sender:self];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (IBAction)switchAction:(id)sender
{
    [self performSegueWithIdentifier:@"AddressToApostleSecond" sender:sender];
    
}

-(void)dismissKeyboard
{
    [self.mobileNoTextField resignFirstResponder];
    [self.homeNoTextField resignFirstResponder];
    [self.workNoTextField resignFirstResponder];
    [self.addressTextView resignFirstResponder];
    
    CGPoint p = CGPointMake(0, 0);
    [self.addressScrollView setContentOffset: p];

}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    CGPoint p = CGPointMake(0, 160);
    [self.addressScrollView setContentOffset: p];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    CGPoint p = CGPointMake(0, 0);
    [self.addressScrollView setContentOffset: p];
    return YES;
}





@end
