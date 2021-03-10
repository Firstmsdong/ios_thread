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
    [self creaCommontView];
}
-(void)creaCommontView{
    
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.contentTbale];
//
    __weak __typeof(self) weakself= self;
    

        dispatch_async(dispatch_queue_create(0, 0), ^{
            [weakself loadFirstPageData];
            // 子线程执行任务（比如获取较大数据）
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
-(void)loadFirstPageData{
    
    NSLog(@"---------");
    NSDictionary * params = @{};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"V1.0" forHTTPHeaderField:@"version"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/html",@"application/json", nil];
//http://123.56.183.161:8091/appindexcontext/selectAllAppIndexContext
    
    [manager GET:[NSString stringWithFormat:@"%@/appindexcontext/selectAllAppIndexContext",URLCOMMON] parameters:params headers:params progress:^(NSProgress * _Nonnull downloadProgress){} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        for (NSDictionary * dic in responseObject[@"data"]) {
            
            MSDViewModel * model = [[MSDViewModel alloc] init];
            if ([dic[@"title"] isKindOfClass:[NSString class]]) {
                model.contentStr = dic[@"title"];
                [self.dataSouce addObject:model];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
        [self.contentTbale reloadData];
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
//    [manager GET:[NSString stringWithFormat:@"%@/appindexcontext/selectAllAppIndexContext",URLCOMMON] parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        NSLog(@"=====首页数据=====%@",responseObject);
//
//        if ([responseObject[@"status"] intValue] ==200) {
//
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//    }];
    
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
@end
