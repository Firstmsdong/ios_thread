//
//  NSOperationAll.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/10.
//

#import "NSOperationAll.h"
#import "Operation_creat.h"
#import "Operation_Queue_creat.h"
#import "Operation_task_add_queue.h"
#import "Operation_Control_queueWay.h"
#import "Operation_relyOn.h"
#import "Operation_ queuePriority.h"
#import "Operation_communication.h"
@interface NSOperationAll ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray * dataSouce;
@property(nonatomic,strong)UITableView * contentTbale;

@end

@implementation NSOperationAll

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
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        Operation_creat  * operation_creat = [[Operation_creat alloc] init];
        operation_creat.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:operation_creat animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
    if (indexPath.row == 1) {
        Operation_Queue_creat  * operation_queue_creat = [[Operation_Queue_creat alloc] init];
        operation_queue_creat.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:operation_queue_creat animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
    if (indexPath.row == 2) {
        Operation_task_add_queue  * operation_add_task_queue = [[Operation_task_add_queue alloc] init];
        operation_add_task_queue.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:operation_add_task_queue animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
    if (indexPath.row == 3) {
        Operation_Control_queueWay  * operation_controllQueue = [[Operation_Control_queueWay alloc] init];
        operation_controllQueue.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:operation_controllQueue animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
    if (indexPath.row == 4) {
        Operation_relyOn  * operation_relyon = [[Operation_relyOn alloc] init];
        operation_relyon.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:operation_relyon animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
    if (indexPath.row == 5) {
        Operation__queuePriority  * operation_queuePriority = [[Operation__queuePriority alloc] init];
        operation_queuePriority.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:operation_queuePriority animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
    if (indexPath.row == 6) {
        Operation_communication  * operation_communication = [[Operation_communication alloc] init];
        operation_communication.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:operation_communication animated:YES];
        self.hidesBottomBarWhenPushed =YES;
    }
    
}

# pragma mark 懒加载
-(NSMutableArray *)dataSouce{
    if (!_dataSouce) {
        _dataSouce = [[NSMutableArray alloc] init];
        NSArray * arrCon = @[@"Operation创建操作",@"队列创建",@"将任务加入到队列中",@"NSOperationQueue 控制串行执行、并发执行",@"操作依赖",@"操作优先级",@"NSOperation、NSOperationQueue 线程间的通信"];
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
