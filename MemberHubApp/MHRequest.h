//
//  MHRequest.h
//  MemberHub
//
//  Created by perumal sundaram on 5/9/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHRequest : NSObject
    @property (nonatomic,copy) NSString* requestKey;
    @property (nonatomic,copy) NSDictionary* requestParameters;
    @property (nonatomic,copy) NSString* token;
@end
