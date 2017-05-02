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

//子控制器
#import "HYRAllViewController.h"
#import "HYRClothesViewController.h"
#import "HYRFoodViewController.h"
#import "HYRHouseViewController.h"
#import "HYRAwayViewController.h"

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
    
    self.navigationItem.title = @"求求您";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航条左侧按钮  菜单
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"menu"] andTarget:self andAction:@selector(openOrCloseLeftList)];

    //右侧按钮 选择菜单(供应、需求、)
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"选择" andTarget:self andAction:@selector(selectBtnOnClick)];
    
    // 初始化子控制器
    [self setupAllChildVC];
    
    //添加底部按钮
    [self createButton];
    
}


#pragma mark -添加底部按钮
-(void)createButton{
    //三个按钮把视图分成3段，每一段的长度
    CGFloat avg = HYRScreenW / 3;
    
    for (int i = 0; i<3; i++) {
        
        //创建按钮
        UIButton *button = [[UIButton alloc] init];
        button.tag = i;
        //
        if (1 == i) {
            [button setTitle:@"发布" forState:UIControlStateNormal];
            button.frame = CGRectMake(0, 0, 60, 60);
            button.layer.cornerRadius = 30;
        }else{
            button.frame = CGRectMake(0, 0, 40, 40);
            button.layer.cornerRadius = 20;
        }
        
        button.center = CGPointMake(avg * (i+0.5), self.bottomView.height*0.5);
        button.backgroundColor = [UIColor lightGrayColor];
#warning TODO 按钮的照片
        [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        //设置蒙版
        button.layer.masksToBounds = YES;
        
        button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [button setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        //监听按钮的事件
        [button addTarget:self action:@selector(buttonOnClick:) forControlEvents:UIControlEventTouchUpInside];
        //把按钮添加到底部栏视图中
        [self.bottomView addSubview:button];

    }
    
}

#pragma mark - 底部栏按钮被点击
-(void)buttonOnClick:(UIButton* )btn{
    NSLog(@"---%s---%d--%ld",__FUNCTION__,__LINE__,btn.tag);
    HYRPublishViewController *publishVC = [[HYRPublishViewController alloc] init];
    publishVC.title = @"发布";
    [self.navigationController pushViewController:publishVC animated:YES];
}


/**
 *  初始化子控制器
 */
- (void)setupAllChildVC
{
    HYRAllViewController *vc1 = [[HYRAllViewController alloc] init];
    vc1.title = @"全部";
    [self addChildViewController:vc1];
    
    HYRClothesViewController *vc2 = [[HYRClothesViewController alloc] init];
    vc2.title = @"衣";
    [self addChildViewController:vc2];
    
    HYRFoodViewController *vc3 = [[HYRFoodViewController alloc] init];
    vc3.title = @"食";
    [self addChildViewController:vc3];
    
    HYRHouseViewController *vc4 = [[HYRHouseViewController alloc] init];
    vc4.title = @"住";
    [self addChildViewController:vc4];
    
    HYRAwayViewController *vc5 = [[HYRAwayViewController alloc] init];
    vc5.title = @"行";
    [self addChildViewController:vc5];
}


#pragma mark - UIActionSheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"选择了第%ld个",buttonIndex);
#warning TODO  在这里根据用户选择筛选刷新数据
    
}


#pragma mark - 点击导航栏右侧 选择按钮
-(void) selectBtnOnClick {
    //弹出ActionSheet
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"温馨提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"查看所有",@"只看供应",@"只看需求", nil];
    [actionSheet showInView:self.view];
    
}


#pragma mark - 打开或者关闭左视图
//左视图
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
