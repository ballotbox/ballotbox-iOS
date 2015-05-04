//
//  BBAddTableViewCell.m
//  BallotBoxiOS
//
//  Created by james grippo on 4/25/15.
//  Copyright (c) 2015 james grippo. All rights reserved.
//

#import "BBAddTableViewCell.h"
#import "Masonry.h"

@implementation BBAddTableViewCell

@synthesize addChoice;

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    addChoice = [[UIButton alloc] init];
    [self.contentView addSubview:addChoice];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [addChoice mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(self.contentView.mas_top).with.offset(padding.top); //with is an optional semantic filler
         make.left.equalTo(self.contentView.mas_left).with.offset(padding.left);
         make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-padding.bottom);
         make.right.equalTo(self.contentView.mas_right).with.offset(-padding.right);
     }];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
