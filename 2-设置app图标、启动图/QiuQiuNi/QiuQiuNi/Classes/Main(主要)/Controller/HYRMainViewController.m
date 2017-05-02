//
//  HYRMainViewController.m
//  QiuQiuNi
//
//  Created by 黄永锐 on 2017/4/25.
//  Copyright © 2017年 LoveQi. All rights reserved.
//

#import "HYRMainViewController.h"
#import "AppDelegate.h"



@interface HYRMainViewController ()

@end



@implementation HYRMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"主界面";
    self.view.backgroundColor = [UIColor whiteColor];
    //
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(0, 0, 20, 18);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    
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
