//
//  HYRNavigationViewController.m
//  QiuQiuNi
//
//  Created by 黄永锐 on 2017/4/25.
//  Copyright © 2017年 LoveQi. All rights reserved.
//

#import "HYRNavigationViewController.h"

@interface HYRNavigationViewController ()

@end

@implementation HYRNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


//拦截push方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {//
        //非根控制器,隐藏底部栏
        viewController.hidesBottomBarWhenPushed = YES;
        
        //每次push viewController就是下一个栈顶控制器
        //非根控制器才设置返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] andSelectImage:[UIImage imageNamed:@"navigationButtonReturnClick"] andTitle:@"返回" andTarget:self andAction:@selector(backButtonOnClick)];
        
    }
    
    
    //真正的跳转
    [super pushViewController:viewController animated:animated];
}

//点击导航栏左侧的返回按钮
-(void)backButtonOnClick{
    [self popViewControllerAnimated:YES];
}


@end
