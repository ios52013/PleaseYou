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


@interface HYRHomeViewController ()<UIActionSheetDelegate>

@end



@implementation HYRHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"求求您";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航条左侧按钮  菜单
    //    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    menuBtn.frame = CGRectMake(0, 0, 20, 18);
    //    [menuBtn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    //    [menuBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"menu"] andTarget:self andAction:@selector(openOrCloseLeftList)];
    
    //右侧按钮 选择
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"选择" andTarget:self andAction:@selector(messageBtnOnClick)];
}

#pragma mark - 点击右侧消息按钮
-(void) messageBtnOnClick {
    //弹出ActionSheet
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"温馨提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"只看供应",@"只看需求",@"查看所有", nil];
    [actionSheet showInView:self.view];
    
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
