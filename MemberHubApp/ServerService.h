//
//  ServerService.h
//  MemberHub
//
//  Created by InexgenGames on 5/10/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum ServerCallType
{
    SERVER_NONE,
    SERVER_LOGIN,
    SERVER_ORGS,
    SERVER_ORGRECORD,
    SERVER_HUBS,
    SERVER_HUBRECORD,
    SERVER_HUBANNOUNCEMENT,
    SERVER_PEOPLE,
    SERVER_PERSONID

} ServerCall;

@interface ServerService : NSObject

@property (atomic) ServerCall mCall;

@end
