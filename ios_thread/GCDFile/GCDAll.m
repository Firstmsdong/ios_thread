//
//  GCDAll.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/10.
//

#import "GCDAll.h"
#import "GCD_dispatch_group.h"
#import "GCD_Get_Queue.h"
#import "GCD_Base_Use.h"
#import "GCD_dispatch_barrier_async.h"
#import "GCD_dispatch_after.h"
#import "GCD_dispatch_apply.h"
#import "GCD_dispatch_semaphore.h"
#import "GCD_dispatch_timer.h"
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
    
    if (indexPath.row == 0) {
        GCD_dispatch_group  * dispatchGroup = [[GCD_dispatch_group alloc] init];
        dispatchGroup.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:dispatchGroup animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }

    if (indexPath.row == 1) {
        GCD_Get_Queue  * getQueue = [[GCD_Get_Queue alloc] init];
        getQueue.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:getQueue animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
    if (indexPath.row == 2) {
        GCD_Base_Use  * baseUse = [[GCD_Base_Use alloc] init];
        baseUse.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:baseUse animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
    if (indexPath.row == 3) {
        GCD_dispatch_barrier_async  * dispatch_barrier_async = [[GCD_dispatch_barrier_async alloc] init];
        dispatch_barrier_async.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:dispatch_barrier_async animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
    if (indexPath.row == 4) {
        GCD_dispatch_after  * dispatch_after = [[GCD_dispatch_after alloc] init];
        dispatch_after.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:dispatch_after animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
    if (indexPath.row == 5) {
        GCD_dispatch_apply  * dispatch_apply = [[GCD_dispatch_apply alloc] init];
        dispatch_apply.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:dispatch_apply animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
    if (indexPath.row == 6) {
        GCD_dispatch_semaphore  * dispatch_semapPhore = [[GCD_dispatch_semaphore alloc] init];
        dispatch_semapPhore.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:dispatch_semapPhore animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
    if (indexPath.row == 7) {
        GCD_dispatch_timer  * dispatch_timer = [[GCD_dispatch_timer alloc] init];
        dispatch_timer.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:dispatch_timer animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
}

# pragma mark 懒加载
-(NSMutableArray *)dataSouce{
    if (!_dataSouce) {
        _dataSouce = [[NSMutableArray alloc] init];
        NSArray * arrCon = @[@"任务组(dispatch_group)",@"队列获取",@"线程的基本使用",@"栅栏函数的实现",@"延迟操作",@"快速迭代",@"GCD信号量",@"定时器的使用"];
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
