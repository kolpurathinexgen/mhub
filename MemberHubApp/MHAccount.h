//
//  MHAccount.h
//  MemberHub
//
//  Created by perumal sundaram on 5/9/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MHRequest.h"

@interface MHAccount : MHRequest
    @property (nonatomic, copy) NSString *email;
    @property (nonatomic, copy) NSNumber *id;
    @property (nonatomic, copy) NSString *token;
@end
