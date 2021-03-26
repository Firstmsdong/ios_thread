//
//  MSDViewCell.m
//  iosKnowledge
//
//  Created by 马淑栋 on 2020/12/9.
//

#import "MSDViewCell.h"

@implementation MSDViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier  {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.contentLab = [[UILabel alloc] init];
        self.contentLab.frame =CGRectMake(10, 0, SCREEN_WIDTH-20, 60);
        self.contentLab.textColor =[UIColor blackColor];
        self.contentLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        self.contentLab.textAlignment =NSTextAlignmentLeft;
        self.contentLab.backgroundColor =[UIColor  clearColor];
        self.contentLab.numberOfLines  = 0;
        [self.contentView  addSubview:self.contentLab];
        
    }
    return self;
}

-(void)setModel:(MSDViewModel *)model{
    self.contentLab.text = model.contentStr;
}


@end
