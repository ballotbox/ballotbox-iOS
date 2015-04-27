//
//  BBChoice.m
//  BallotBoxiOS
//
//  Created by james grippo on 3/10/15.
//  Copyright (c) 2015 james grippo. All rights reserved.
//

#import "BBChoice.h"

@implementation BBChoice

@synthesize name, voteCount, choiceID;

-(instancetype)init
{
    self = [super init];
    name = [[NSString alloc] init];
    choiceID =0;
    voteCount =0;
    return self;
}

-(void) incrementVote
{
    ++voteCount;
}

@end
