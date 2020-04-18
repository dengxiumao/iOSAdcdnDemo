//
//  ADCDN_GameBoxViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/3/16.
//  Copyright © 2020 pst. All rights reserved.
//

#import "ADCDN_GameBoxViewController.h"
#import <ADCDN/ADCDN.h>
@interface ADCDN_GameBoxViewController ()<ADCDN_GameBoxViewDelegate>
/* 游戏大厅 */
@property (nonatomic,strong) ADCDN_GameBoxView *gameBoxView;
@end

@implementation ADCDN_GameBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"游戏大厅";
    
    [self gameBoxView];
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}
#pragma mark - 初始化游戏大厅页面
-(ADCDN_GameBoxView *)gameBoxView{
    if (!_gameBoxView) {
        ADCDN_GameBoxModel *model = [ADCDN_GameBoxModel new];
        model.userSystem = 1;
        model.userId = @"123456";
        model.nickname = @"我的昵称";
        model.avatar = @"https://dss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2131257963,3457119996&fm=58";
        model.existNav = 1;
        model.rootViewController = self;
        
        _gameBoxView = [[ADCDN_GameBoxView alloc] initWithGameBoxViewFrame:self.view.bounds];
        _gameBoxView.delegate = self;
        [self.view addSubview:_gameBoxView];
        [_gameBoxView loadGameViewModel:model];
    }
    return _gameBoxView;
}
-(void)dealloc{
    NSLog(@"释放了");
}


#pragma mark - ADCDN_GameBoxViewDelegate

/**
 *  当app有用户体系时，还未登录，去登录，跳转app登录页面
 */
-(void)ADCDN_GameBoxViewGotoLogin{
    NSLog(@"去登录");
}
/**
 *  当游戏盒子处在app的二级页面，需要返回上一个页面时，导航栏的返回事件
 */
-(void)ADCDN_gameBoxViewNavBack{
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"返回");
}
@end
