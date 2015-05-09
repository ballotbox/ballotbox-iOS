//
//  BBManager.h
//  BallotBoxiOS
//
//  Created by james grippo on 5/4/15.
//  Copyright (c) 2015 james grippo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBHomeTableViewController.h"
#import "BBChoice.h"
#import "BBElectionTableViewController.h"
#import "BBElection.h"
#import "BBLogInViewController.h"
#import "AFHTTPSessionManager.h"

@interface BBManager : NSObject

+ (AFHTTPSessionManager*) sessionManager;
+ (BBManager*) manager;
- (BBManager*) init;
- (NSString*) getApplicationID;
- (NSString*) getSecret;
- (NSString*) getAccessToken;
- (void) setAccessToken : (NSString*) token;

@end
