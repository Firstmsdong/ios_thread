//
//  GCD_dispatch_group.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/10.
//
#import "GCD_dispatch_group.h"
@interface GCD_dispatch_group ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray * dataSouce;
@property(nonatomic,strong)UITableView * contentTbale;
@end

@implementation GCD_dispatch_group

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self creaCommontView];
    [self grop];
}
-(void)creaCommontView{
    
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.contentTbale];
////
    __weak __typeof(self) weakself= self;
//
//
//        dispatch_async(dispatch_queue_create(0, 0), ^{
//            [weakself ];
//            NSLog(@"%lu",(unsigned long)self.dataSouce.count);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                NSLog(@"返回主线程");
////            [self.contentTbale reloadData];
//            });
//        });
    
       dispatch_group_t group = dispatch_group_create();
        // 广告数组
        dispatch_group_enter(group);
        [self getAdHotTopDataBaseRequestisScu:^(BOOL isScu) {
            dispatch_group_leave(group);
        }];

        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            [weakself.contentTbale reloadData];
        });

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

#pragma mark 接口数据请求
- (void)getAdHotTopDataBaseRequestisScu:(void(^)(BOOL isScu))requestisScu{{
    
    NSDictionary * params = @{};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"V1.0" forHTTPHeaderField:@"version"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/html",@"application/json", nil];
    [manager GET:[NSString stringWithFormat:@"%@/appindexcontext/selectAllAppIndexContext",URLCOMMON] parameters:params headers:params progress:^(NSProgress * _Nonnull downloadProgress){} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        for (NSDictionary * dic in responseObject[@"data"]) {
            
            MSDViewModel * model = [[MSDViewModel alloc] init];
            if ([dic[@"title"] isKindOfClass:[NSString class]]) {
                model.contentStr = dic[@"title"];
                [self.dataSouce addObject:model];
            }
        }
        if(requestisScu){
              requestisScu((200 == [responseObject[@"status"] integerValue])?YES:NO);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
    
}



# pragma mark 懒加载
-(NSMutableArray *)dataSouce{
    if (!_dataSouce) {
        _dataSouce = [[NSMutableArray alloc] init];
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

-(void)grop{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("com.thread.task", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"当前线程1");
    dispatch_group_async(group, queue, ^{
        NSLog(@"开始请求-轮播图-数据 -> %@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:2];
        NSLog(@"获取到-轮播图-数据 -> %@",[NSThread currentThread]);
    });
    NSLog(@"当前线程2");
    dispatch_group_async(group, queue, ^{
        NSLog(@"开始请求-列表-数据 -> %@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:3];
        NSLog(@"获取到-列表-数据 -> %@",[NSThread currentThread]);
    });
    NSLog(@"当前线程3");
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"回到主线程刷新列表");
        [NSThread sleepForTimeInterval:1];
    });
    NSLog(@"当前线程4");
}

@end
