//
//  HYRAdViewController.m
//  QiuQiuNi
//
//  Created by 黄永锐 on 2017/4/23.
//  Copyright © 2017年 LoveQi. All rights reserved.
//

#import "HYRAdViewController.h"

@interface HYRAdViewController ()
@property (weak, nonatomic) IBOutlet UIView *adContainView;
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;

@end

@implementation HYRAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置启动图片
    [self setupLaunchImage];
    
#pragma mark - 加载广告数据  ==>拿到数据 ==》服务器 ==》查看接口文档
    //1、判断接口对不对
    //2、解析数据(w_picurl、ori_curl、w、h)
    //3、请求数据（AFN）
    
    //导入AFN框架：cocoapods
    //cocoapods：管理第三方库
}


// 设置启动图片
- (void)setupLaunchImage
{
    
    // 6p、6s plus、7p:LaunchImage-800-Portrait-736h@3x.png
    // 6、7: LaunchImage-800-667h@2x.png
    // 5: LaunchImage-568h@2x.png
    // 4s:LaunchImage@2x.png
    
    //但是启动图 放在Assets里面 识别不了各个尺寸，肿么办？
    //直接把图放到项目中
    
    //屏幕适配
    if (iphone6PLUS || iphone6S_PLUS || iphone7PLUS) { //6p 、6s plus、7plus
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }else if (iphone6 || iphone6S || iphone7){// 6、7
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h@2x"];
    }else if (iphone5_S){// 5、5s
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-700-568h@2x"];
    }else if (iphone4_S){// 4、4s
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-700@2x"];
    }
    

    
}


@end
