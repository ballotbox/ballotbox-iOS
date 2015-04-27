//
//  BBHomeTableViewCell.m
//  
//
//  Created by james grippo on 3/12/15.
//
//

#import "BBHomeTableViewCell.h"
#import "Masonry.h"

@implementation BBHomeTableViewCell

@synthesize textLabel;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    textLabel = [[UILabel alloc] init];
    [self.contentView addSubview:textLabel];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(padding.top); //with is an optional semantic filler
        make.left.equalTo(self.contentView.mas_left).with.offset(padding.left);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-padding.bottom);
        make.right.equalTo(self.contentView.mas_right).with.offset(-padding.right);
    }];
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
