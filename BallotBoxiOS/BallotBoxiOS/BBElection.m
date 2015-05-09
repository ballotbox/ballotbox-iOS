//
//  BBElection.m
//  BallotBoxiOS
//
//  Created by james grippo on 3/12/15.
//  Copyright (c) 2015 james grippo. All rights reserved.
//

#import "BBElection.h"

@implementation BBElection

@synthesize name, choices, electionID, description, publicID, creatorID;

-(instancetype)init
{
    self = [super init];
    choices = [[NSMutableArray alloc] init];
    name = [[NSString alloc] init];
    electionID = 0;
    publicID =0;
    creatorID =0;
    
    return self;
}

@end

