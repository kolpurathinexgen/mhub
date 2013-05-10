//
//  MHRESTServiceDelagator.m
//  MemberHub
//
//  Created by perumal sundaram on 5/9/13.
//  Copyright (c) 2013 InexgenGames. All rights reserved.
//

#import "MHRESTServiceDelagator.h"
#import <RestKit/RestKit.h>

@implementation MHRESTServiceDelagator

    @synthesize token;

    //base url for RESTful webservice call
    NSString *baseURL = @"https://memberhub.com";

    //this statement is making this class as singleton
    static MHRESTServiceDelagator *sharedInstance = nil;

    //It has all details which needs to porcess the request. later it should meved from here
    // to some other individual class.
    NSMutableDictionary *bookListing = nil;


    // Get the shared instance and create it if necessary.
    + (MHRESTServiceDelagator *)sharedInstance {
        if (sharedInstance == nil) {
            sharedInstance = [[super allocWithZone:NULL] init];
        }
    
        return sharedInstance;
    }
    // We can still have a regular init method, that will get called the first time the Singleton is used.
    - (id)init {
        self = [super init];
    
        if (self) {
            // Work your initialising magic here as you normally would
            //bookListing = [NSMutableDictionary dictionary];
            
            
            NSDictionary* loginRequestMapping = @{
                                    @"email":   @"email",
                                    @"id":     @"id",
                                    @"authentication_token":        @"token"
                                    };
           

            NSDictionary* listOrgRequestMapping = @{
                                                  @"name":   @"orgName",
                                                  @"id":     @"orgId",
                                                  @"short_name":        @"orgShortName"
                                                  };
            
            NSArray *keys = [NSArray arrayWithObjects:@"loginMappingClass", @"loginRequestMapping",@"listOrgMappingClass", @"listOrgURL", @"orgRequestMapping", nil];
            NSArray *objects = [NSArray arrayWithObjects:[MHAccount class], loginRequestMapping,[MHOrganization class], @"/api2/v1/orgs?token=", listOrgRequestMapping, nil];
            bookListing = [NSDictionary dictionaryWithObjects:objects forKeys:keys];

        }
    
        return self;
    }

    - (MHResponse*)executeService:(MHRequest*)request{
        
        //NSLog(@"Object for key %@",[bookListing objectForKey:[request requestKey]]);
        
        // Log all HTTP traffic with request and response bodies
        RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
        
        // Log debugging info about Core Data
        RKLogConfigureByName("RestKit/CoreData", RKLogLevelDebug);
        
        NSURL *url = [NSURL URLWithString:baseURL];
        
        MHResponse* response = [MHResponse alloc];
        
        RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:url];

        RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[bookListing objectForKey:@"loginMappingClass"]];
       
        [mapping addAttributeMappingsFromDictionary:[bookListing objectForKey:@"loginRequestMapping"]];
       
        RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping pathPattern:nil keyPath:nil statusCodes:nil];
        
       
        [objectManager addResponseDescriptor:responseDescriptor];
        
        
        RKObjectRequestOperation *operation = nil;
        if(request.requestKey == @"login"){
            operation = [objectManager appropriateObjectRequestOperationWithObject:nil method:RKRequestMethodPOST path:@"/api2/v1/login" parameters:[request requestParameters]];
        }else{
//            NSString* fURL = [bookListing objectForKey:@"listOrgURL"];
            

            
            baseURL = [baseURL stringByAppendingString:[[bookListing objectForKey:@"listOrgURL"] stringByAppendingString:token]];
    
            
            url = [NSURL URLWithString:baseURL];
            
            objectManager = [RKObjectManager managerWithBaseURL:url];
            
            mapping = [RKObjectMapping mappingForClass:[bookListing objectForKey:@"listOrgMappingClass"]];
            [mapping addAttributeMappingsFromDictionary:[bookListing objectForKey:@"orgRequestMapping"]];
            
            
            responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping pathPattern:nil keyPath:nil statusCodes:nil];
         

            
                NSURLRequest *requestMH = [NSURLRequest requestWithURL:url];
            
            
            
            operation = [[RKObjectRequestOperation alloc] initWithRequest:requestMH responseDescriptors:@[responseDescriptor]];

            
        }
       
        response.rro = operation;
        
        
        return response;
    }
@end
