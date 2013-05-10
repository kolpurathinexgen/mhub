//
//  MHResponse.h
//  MemberHub
//
//  Created by perumal sundaram on 5/9/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface MHResponse : NSObject
    @property (nonatomic,copy) RKMappingResult* result;
    @property (nonatomic, copy) NSString* res;
    @property (nonatomic,copy) RKObjectRequestOperation* rro;
@end
