//
//  GCD_dispatch_timer.m
//  ios_thread
//
//  Created by 马淑栋 on 2021/3/25.
//

#import "GCD_dispatch_timer.h"

@interface GCD_dispatch_timer ()
@property(nonatomic,strong)UIButton * codeButton;
@end

@implementation GCD_dispatch_timer

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.codeButton];
    [self startCountDownAction];
   
}

- (void)startCountDownAction{
    NSLog(@"倒计时功能");
    //开始倒计时
    __block NSInteger time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.codeButton setTitle:@"重新发送" forState:UIControlStateNormal];
                [self.codeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
                self.codeButton.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.codeButton setTitle:[NSString stringWithFormat:@"%.2ds后重新发送", seconds] forState:UIControlStateNormal];
                [self.codeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                self.codeButton.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
    
}

-(UIButton *)codeButton{
    if(!_codeButton){
        _codeButton = [UIButton buttonWithbuttonType:UIButtonTypeCustom andText:@"获取验证码" andTextAlignment:UIControlContentHorizontalAlignmentCenter andTextColor:[UIColor whiteColor] andTextFont:13 andBackgroungColor:[UIColor grayColor] cornerRadiusSize:2 borderWidth:1 borderColor:[UIColor blackColor] abscissa:SCREEN_WIDTH/2-70 ordinate:SCREEN_HEIGHT/2-25 width:140 height:50];
        [_codeButton addTarget:self action:@selector(clickCountDownAction:) forControlEvents:UIControlEventTouchUpOutside];
    }
    return _codeButton;
}
-(void)clickCountDownAction:(UIButton *)sender{
    [self startCountDownAction];
}

@end
