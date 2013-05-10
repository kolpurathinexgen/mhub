//
//  MHRESTServiceDelagator.h
//  MemberHub
//
//  Created by perumal sundaram on 5/9/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MHResponse.h"
#import "MHRequest.h"
#import "MHAccount.h"
#import "MHOrganization.h"


@interface MHRESTServiceDelagator : NSObject
@property (nonatomic,copy) NSString* token;

    + (id)sharedInstance;
    - (MHResponse*)executeService:(MHRequest*)request;
@end
