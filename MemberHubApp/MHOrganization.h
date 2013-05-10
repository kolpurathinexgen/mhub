//
//  MHOrganization.h
//  MemberHub
//
//  Created by perumal sundaram on 5/9/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "MHRequest.h"

@interface MHOrganization : MHRequest
    @property (nonatomic,copy) NSString* orgName;
    @property (nonatomic, copy) NSNumber* orgId;
    @property (nonatomic,copy) NSString* orgShortName;
@end
