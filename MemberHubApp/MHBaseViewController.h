//
//  MHBaseViewController.h
//  MemberHub
//
//  Created by perumal sundaram on 5/9/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MHRequest.h"
#import "MHResponse.h"
#import "MHRESTServiceDelagator.h"
#import "MHLoginRequest.h"


@interface MHBaseViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
    @property (nonatomic, copy) NSString* token;

    -(void)mhLog:(NSString*)message;

    -(MHResponse*)executeService:(MHRequest*)request;
@end
