//
//  MHBaseViewController.m
//  MemberHub
//
//  Created by perumal sundaram on 5/9/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "MHBaseViewController.h"


@implementation MHBaseViewController

    @synthesize token;

   

    -(void)mhLog:(NSString*)message{
        NSLog(@"Log Message is %@", message);
    }

    -(MHResponse*)executeService:(MHRequest*)request{
        
        [self mhLog:[request requestKey]];
        MHRESTServiceDelagator* delegator = [MHRESTServiceDelagator sharedInstance];
        
        if([request requestKey] != @"login"){
            request.token = [delegator token];
        }
        
        return [delegator executeService:request];
    }

@end
