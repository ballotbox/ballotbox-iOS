//
//  BBElection.h
//  BallotBoxiOS
//
//  Created by james grippo on 3/12/15.
//  Copyright (c) 2015 james grippo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBElection : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSMutableArray *choices;
@property (nonatomic) NSNumber *electionID;
@property (nonatomic) NSString *description;
@property (nonatomic) NSNumber *creatorID;
@property (nonatomic) BOOL publicID;



@end
