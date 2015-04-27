//
//  BBTextFieldTableViewCell.m
//  BallotBoxiOS
//
//  Created by james grippo on 4/25/15.
//  Copyright (c) 2015 james grippo. All rights reserved.
//

#import "BBTextFieldTableViewCell.h"

@implementation BBTextFieldTableViewCell

@synthesize inputTextField;

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] )
    {
        inputTextField = [[UITextField alloc] init];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
