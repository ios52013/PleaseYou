//
//  AppDelegate.m
//  QiuQiuNi
//
//  Created by 黄永锐 on 2017/4/25.
//  Copyright © 2017年 LoveQi. All rights reserved.
//

#import "AppDelegate.h"
#import "HYRHomeViewController.h"
#import "HYRLeftViewController.h"
#import "HYRAdViewController.h"

@interface AppDelegate ()

@end


/*
 每次程序启动的时候就进入广告界面
 方法：
 1、在启动的时候，去加个广告界面?
 2、启动完成的时候，加个广告界面(展示了启动图片)
 1)程序一启动就进入广告界面，窗口的根控制器设置为广告控制器
 2)直接往窗口上再加一个广告界面，等待几秒，再去广告界面移除。（这种方法需要加一个界面，还要处理业务逻辑，所以还需要绑定一个类来管理，还要移除///所以麻烦）
 */

@implementation AppDelegate


// 程序启动的时候就会调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //1、创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //2、设置主视图
  
    /*
    HYRHomeViewController *mainVC = [[HYRHomeViewController alloc] init];
    self.mainNavigationController = [[HYRNavigationViewController alloc] initWithRootViewController:mainVC];
    [[UINavigationBar appearance] setBarTintColor:[UIColor purpleColor]];
    
    //3、设置左侧视图
    HYRLeftViewController *leftVC = [[HYRLeftViewController alloc] init];
    
    //4、创建滑动视图控制器
    self.leftDragerVC = [[HYRDragViewController alloc] initWithLeftView:leftVC andMainView:self.mainNavigationController];
    */
    
    HYRAdViewController *adVc = [[HYRAdViewController alloc] init];
#pragma mark - init加载xib
    // init ->  initWithNibName 1.首先判断有没有指定nibName 2.判断下有没有跟类名同名xib
    
    
    //5、设置根视图
    self.window.rootViewController = adVc;
    
    //6、让窗口显示
    [self.window makeKeyAndVisible];
    
    NSLog(@"%@",NSStringFromCGRect([UIScreen mainScreen].bounds));
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
