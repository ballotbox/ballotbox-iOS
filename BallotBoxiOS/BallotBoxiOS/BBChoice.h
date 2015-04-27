//
//  BBChoice.h
//  BallotBoxiOS
//
//  Created by james grippo on 3/10/15.
//  Copyright (c) 2015 james grippo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBChoice : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger *voteCount;
@property (nonatomic) NSInteger *choiceID;

-(void) incrementVote;

@end
