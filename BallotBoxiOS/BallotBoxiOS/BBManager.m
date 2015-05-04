//
//  BBManager.m
//  BallotBoxiOS
//
//  Created by james grippo on 5/4/15.
//  Copyright (c) 2015 james grippo. All rights reserved.
//

#import "BBManager.h"

@interface BBManager()
@property NSString* applicationID;
@property NSString* secret;

@end

@implementation BBManager

@synthesize applicationID,secret;

+ (BBManager*) manager
{
    static BBManager* manager;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

+(AFHTTPSessionManager*) sessionManager
{
    static AFHTTPSessionManager* sessionManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://ballot-box.herokuapp.com"]];
        sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        sessionManager.responseSerializer.acceptableContentTypes = [sessionManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    });
    return sessionManager;
}

- (BBManager*) init
{
    if (self = [super init])
    {
        applicationID = @"c93eb0b0ff19f0883774604cf91dbd36387abe39af3428c7bf1821f60c5a8570";
        secret = @"7ae662c88722493ec7b172b147eb9a78493620c036788835a10c7e198ecb39f6";
    }
    return self;
}

- (NSString*) getApplicationID
{
    return applicationID;
}

-(NSString*) getSecret
{
    return secret;
}




@end
