//
//  AddressScreenViewController.h
//  MemberHubApp
//
//  Created by InexgenGames on 4/11/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressScreenViewController : UIViewController<UITextViewDelegate,UITextFieldDelegate>

@property (nonatomic) int selectedPhoneNumberTag;

@property (nonatomic, retain) NSString * address;

@property (strong, nonatomic) IBOutlet UITextView *addressTextView;




@property (strong, nonatomic) IBOutlet UITextField *mobileNoTextField;

@property (strong, nonatomic) IBOutlet UITextField *homeNoTextField;
@property (strong, nonatomic) IBOutlet UITextField *workNoTextField;
@property (strong, nonatomic) IBOutlet UIImageView *addressImageView;
@property (strong, nonatomic) IBOutlet UIScrollView *addressScrollView;

@end
