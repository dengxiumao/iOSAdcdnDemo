//
//  ADCDN_RewardViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/18.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_RewardViewController.h"
#import "ADCDN_ExpressRewardVideoViewController.h"

@interface ADCDN_RewardViewController ()<UITableViewDelegate,UITableViewDataSource>
/** tableView */
@property (nonatomic,strong) UITableView *menuTB;
/** titleArr */
@property(copy,nonatomic)NSArray *menuTitleArr;

@end

@implementation ADCDN_RewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.type == 1) {
        self.navigationItem.title = @"激励视频";
    }
    if (self.type == 2) {
        self.navigationItem.title = @"模版激励视频";
    }
    
    [self menuTB];
}
-(UITableView *)menuTB{
    if (!_menuTB) {
        _menuTB = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH - [self getStatusBarHeight] - [self getNavigationBarHeight]) style:UITableViewStylePlain];
        _menuTB.delegate = self;
        _menuTB.dataSource = self;
        _menuTB.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:_menuTB];
    }
    return _menuTB;
}
-(NSArray *)menuTitleArr{
    if (!_menuTitleArr) {
        /**
         *  插屏广告放最后
         */
        _menuTitleArr = @[@"横屏",@"竖屏",];
    }
    return _menuTitleArr;
}
/**
 *  获取状态栏高度
 */
-(CGFloat)getStatusBarHeight{
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}
/**
 *  获取导航栏高度
 */
-(CGFloat)getNavigationBarHeight{
    return self.navigationController.navigationBar.frame.size.height;
}
/**
 *  UITableViewDelegate,UITableViewDataSource
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.menuTitleArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.menuTitleArr[indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.type == 2) {
        // 横屏
        if (indexPath.row == 0) {
            NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
            ADCDN_ExpressRewardVideoViewController *vc = [ADCDN_ExpressRewardVideoViewController new];
            vc.plcId = KplcId_ExpressRewardVideoHorizon;
            vc.navigationItem.title = @"模版激励视频-横屏";
            [self.navigationController pushViewController:vc animated:YES];
        }
        // 竖屏
        if (indexPath.row == 1) {
            NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
            ADCDN_ExpressRewardVideoViewController *vc = [ADCDN_ExpressRewardVideoViewController new];
            vc.plcId = KplcId_ExpressRewardVideoVertical;
            vc.navigationItem.title = @"模版激励视频-竖屏";
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}
@end
