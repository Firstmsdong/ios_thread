//
//  MSDViewCell.h
//  iosKnowledge
//
//  Created by 马淑栋 on 2020/12/9.
//

#import <UIKit/UIKit.h>
#import "MSDViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MSDViewCell : UITableViewCell
@property (nonatomic,strong)UILabel * contentLab;
-(void)setModel:(MSDViewModel *)model;
@end

NS_ASSUME_NONNULL_END
