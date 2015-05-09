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
@property (nonatomic)  NSString* accessToken;

@end

@implementation BBManager

@synthesize applicationID,secret,accessToken;

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
        //sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://ballot-box.herokuapp.com"]];
        sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://localhost:3000"]];
        sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        sessionManager.responseSerializer.acceptableContentTypes = [sessionManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    });
    return sessionManager;
}

- (BBManager*) init
{
    if (self = [super init])
    {
        //applicationID = @"c93eb0b0ff19f0883774604cf91dbd36387abe39af3428c7bf1821f60c5a8570";
        //secret = @"7ae662c88722493ec7b172b147eb9a78493620c036788835a10c7e198ecb39f6";
        applicationID = @"004c81ddb478133d78bfeb7763b5df8980e270bc37920725ac89bd4890073244";
        secret = @"de0cd6155a032306d93b5fa5e5a3bf0518001e4bdbd2569527013d1989745deb";
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

-(NSString*) getAccessToken
{
    return secret;
}

- (void) setAccessToken:(NSString *)token
{
    accessToken = token;
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.HTTPAdditionalHeaders = @{@"Authorization":[NSString stringWithFormat:@"Bearer %@", token]};
    
    
}


@end
