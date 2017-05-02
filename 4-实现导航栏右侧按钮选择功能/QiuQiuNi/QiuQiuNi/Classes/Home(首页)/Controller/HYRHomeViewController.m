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


@end



@implementation HYRHomeViewController



#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"求求您";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航条左侧按钮  菜单
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"menu"] andTarget:self andAction:@selector(openOrCloseLeftList)];

    //右侧按钮 选择菜单(供应、需求、)
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"选择" andTarget:self andAction:@selector(selectBtnOnClick)];
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
