//
//  BBElectionTableViewCell.m
//  BallotBoxiOS
//
//  Created by james grippo on 3/13/15.
//  Copyright (c) 2015 james grippo. All rights reserved.
//

#import "BBElectionTableViewCell.h"

@implementation BBElectionTableViewCell

@synthesize textLabel;

-(instancetype)init
{
    self = [super init];
    textLabel = [[UILabel alloc] init];
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
