//
//  photoUserCell.m
//  ProjectTemplate
//
//  Created by GM on 2018/4/22.
//  Copyright © 2018年 yuting. All rights reserved.
//

#import "photoUserCell.h"

@implementation photoUserCell
{
    UIImageView *  _icon;
    UILabel     *  _name;
    UILabel     *  _distance;
    UIImageView *  _line;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UIImageView * icon = [UIImageView new];
        _icon = icon ;
        UILabel    * name = [UILabel new];
        name.textColor = [UIColor grayColor];
        _name  = name ;
        UILabel  * distance = [UILabel new ];
        distance .font = SYSTEMFONT(13);
        distance.textColor = [UIColor lightGrayColor];
        _distance = distance ;
        
        UIImageView * line = [UIImageView new];
        line.backgroundColor = [UIColor lightGrayColor];
        _line = line;
        
        [self.contentView sd_addSubviews:@[icon,name,distance,line]];
        
        _icon.sd_layout
        .heightIs(80)
        .widthIs(80)
        .topSpaceToView(self.contentView, 10)
        .leftSpaceToView(self.contentView, 10);
        
        _name.sd_layout
        .heightIs(30)
        .leftSpaceToView(_icon, 20)
        .topEqualToView(_icon)
        .rightSpaceToView(self.contentView, 10);
        
        _distance.sd_layout
        .bottomEqualToView(_icon)
        .leftSpaceToView(_icon, 20)
        .rightSpaceToView(self.contentView, 10)
        .heightIs(30);
        
        _line.sd_layout
        .leftEqualToView(_icon)
        .topSpaceToView(_icon, 9)
        .rightSpaceToView(self.contentView, 10)
        .heightIs(1);
        
        [self setupAutoHeightWithBottomView:_icon bottomMargin:10];
        
        
    }
    return  self ;
}
-(void)setDicInfo:(NSDictionary *)dicInfo{
    _dicInfo = dicInfo;
    _icon.image = [UIImage imageNamed:[dicInfo objectForKey:@"icon"]];
    _name.text = [dicInfo objectForKey:@"name"];
    _distance.text = [dicInfo objectForKey:@"distance"];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
