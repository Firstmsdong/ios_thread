//
//  GCDAll.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/10.
//

#import "GCDAll.h"
#import "GCD_dispatch_group.h"
@interface GCDAll ()
<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray * dataSouce;
@property(nonatomic,strong)UITableView * contentTbale;
@end

@implementation GCDAll

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creaCommontView];
}
-(void)creaCommontView{
    
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.contentTbale];
    [self.contentTbale reloadData];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSouce.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    static NSString * string = @"string";
    MSDViewCell * cell = [tableView dequeueReusableCellWithIdentifier:string];
    if(cell == nil)
    {
        cell = [[MSDViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    [cell setModel:self.dataSouce[indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    算法相关
    if (indexPath.row == 0) {
        GCD_dispatch_group  * dispatchGroup = [[GCD_dispatch_group alloc] init];
        dispatchGroup.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:dispatchGroup animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
//    三方库
    if (indexPath.row == 1) {
//        MSDThreePartyLibraries  * idea = [[MSDThreePartyLibraries alloc] init];
//        idea.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:idea animated:YES];
//        self.hidesBottomBarWhenPushed =YES;
    }
}

# pragma mark 懒加载
-(NSMutableArray *)dataSouce{
    if (!_dataSouce) {
        _dataSouce = [[NSMutableArray alloc] init];
        NSArray * arrCon = @[@"任务组(dispatch_group)",@""];
        for (int i = 0; i<arrCon.count; i++) {
            MSDViewModel * model = [[MSDViewModel alloc] init];
            model.contentStr = arrCon[i];
            [_dataSouce addObject:model];
        }
    }
    return _dataSouce;
}

-(UITableView *)contentTbale{
    if (!_contentTbale) {
        _contentTbale = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _contentTbale.delegate = self;
        _contentTbale.dataSource = self;
        [_contentTbale setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    return _contentTbale;
}


@end
