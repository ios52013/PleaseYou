//
//  HYRMainViewController.m
//  QiuQiuNi
//
//  Created by 黄永锐 on 2017/4/25.
//  Copyright © 2017年 LoveQi. All rights reserved.
//

#import "HYRHomeViewController.h"
#import "AppDelegate.h"
#import "HYRMessageViewController.h"
#import "HYRPublishViewController.h"


@interface HYRHomeViewController ()<UIActionSheetDelegate>
/** 底部栏 **/
@property (nonatomic, strong)UIView *bottomView;

@end



@implementation HYRHomeViewController

#define bottomViewH 60
//底部存放按钮的视图
-(UIView *)bottomView{
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, HYRScreenH-bottomViewH, HYRScreenW, bottomViewH)];
        _bottomView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_bottomView];
    }
    return _bottomView;
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"求求您";
    self.view.backgroundColor = [UIColor magentaColor];
    
    //导航条左侧按钮  菜单
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"menu"] andTarget:self andAction:@selector(openOrCloseLeftList)];
    
    //右侧按钮 选择菜单(供应、需求、)
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"选择" andTarget:self andAction:@selector(selectBtnOnClick)];
    
    
    //添加底部按钮
    [self crateButton];

}


#pragma mark - 点击右侧消息按钮
-(void) selectBtnOnClick {
    //弹出ActionSheet
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"温馨提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"查看所有",@"只看供应",@"只看需求", nil];
    [actionSheet showInView:self.view];
    
}


#pragma mark - 添加底部按钮
-(void) crateButton {
    //发布按钮
    UIButton *publishBtn = [[UIButton alloc] init];
    publishBtn.frame = CGRectMake(0, 0, 60, 60);
    publishBtn.center = CGPointMake(HYRScreenW * 0.5, self.bottomView.height*0.5);
    publishBtn.backgroundColor = [UIColor lightGrayColor];
    publishBtn.layer.cornerRadius = 30;
    publishBtn.layer.masksToBounds = YES;
    [publishBtn setTitle:@"发布" forState:UIControlStateNormal];
    publishBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [publishBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [publishBtn addTarget:self action:@selector(publishBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:publishBtn];
    
    //搜索按钮
    UIButton *searchBtn = [[UIButton alloc] init];
    searchBtn.frame = CGRectMake(0, 0, 40, 40);
    searchBtn.center = CGPointMake(HYRScreenW - publishBtn.center.x * 0.5, self.bottomView.height*0.5);
    searchBtn.backgroundColor = [UIColor lightGrayColor];
    searchBtn.layer.cornerRadius = 20;
    searchBtn.layer.masksToBounds = YES;
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    searchBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [searchBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:searchBtn];
    
    //消息按钮
    UIButton *messageBtn = [[UIButton alloc] init];
    messageBtn.frame = CGRectMake(0, 0, 40, 40);
    messageBtn.center = CGPointMake((HYRScreenW - publishBtn.center.x) * 0.5, self.bottomView.height*0.5);
    messageBtn.backgroundColor = [UIColor lightGrayColor];
    messageBtn.layer.cornerRadius = 20;
    messageBtn.layer.masksToBounds = YES;
    [messageBtn setTitle:@"消息" forState:UIControlStateNormal];
    messageBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [messageBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [messageBtn addTarget:self action:@selector(messageBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:messageBtn];

}

#pragma mark - 点击发布按钮
-(void) publishBtnOnClick{
    HYRPublishViewController *publishVC = [[HYRPublishViewController alloc] init];
    [self.navigationController pushViewController:publishVC animated:YES];
}
//搜索按钮
-(void) searchBtnOnClick{
    HYRPublishViewController *publishVC = [[HYRPublishViewController alloc] init];
    [self.navigationController pushViewController:publishVC animated:YES];
}


#pragma mark - 点击消息按钮
-(void) messageBtnOnClick {
    //跳转界面
    HYRMessageViewController *messageVC = [[HYRMessageViewController alloc] init];
    [self.navigationController pushViewController:messageVC animated:YES];
    
}




#pragma mark - 打开或者关闭左视图

- (void) openOrCloseLeftList
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.leftDragerVC.closed)
    {
        [tempAppDelegate.leftDragerVC openLeftView];
    }
    else
    {
        [tempAppDelegate.leftDragerVC closeLeftView];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.leftDragerVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.leftDragerVC setPanEnabled:YES];
}

@end
