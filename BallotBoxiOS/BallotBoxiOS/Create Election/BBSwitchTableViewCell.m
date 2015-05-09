//
//  BBSwitchTableViewCell.m
//  BallotBoxiOS
//
//  Created by james grippo on 5/8/15.
//  Copyright (c) 2015 james grippo. All rights reserved.
//

#import "BBSwitchTableViewCell.h"
#import "Masonry.h"

@implementation BBSwitchTableViewCell

@synthesize publicSwitch;

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        publicSwitch = [[UISwitch alloc] init];
        [self.contentView addSubview:publicSwitch];
        
        UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 10);
        
        
        [publicSwitch mas_makeConstraints:^(MASConstraintMaker *make)
         {
             make.width.equalTo(@51);
             make.top.equalTo(self.contentView.mas_top).with.offset(6.5);
             make.centerY.equalTo(self.contentView.mas_centerY);
             make.right.equalTo(self.contentView.mas_right).with.offset(-padding.right);
         }];
    }
    return self;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
