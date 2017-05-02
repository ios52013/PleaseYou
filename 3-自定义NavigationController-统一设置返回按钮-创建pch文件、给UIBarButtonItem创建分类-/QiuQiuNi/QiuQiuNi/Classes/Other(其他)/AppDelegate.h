//
//  AppDelegate.h
//  QiuQiuNi
//
//  Created by 黄永锐 on 2017/4/25.
//  Copyright © 2017年 LoveQi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYRDragViewController.h"
#import "HYRNavigationViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/** 左侧视图 **/
@property (nonatomic, strong)HYRDragViewController *leftDragerVC;
@property (strong, nonatomic) HYRNavigationViewController *mainNavigationController;


@end

