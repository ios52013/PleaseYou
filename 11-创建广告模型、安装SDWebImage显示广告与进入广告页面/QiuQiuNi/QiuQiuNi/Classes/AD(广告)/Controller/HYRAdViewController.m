//
//  HYRAdViewController.m
//  QiuQiuNi
//
//  Created by 黄永锐 on 2017/4/23.
//  Copyright © 2017年 LoveQi. All rights reserved.
//
/*
 1、广告业务逻辑
 2、占位视图思想：有个控件不确定尺寸，但是层次结构已经确定，就可以使用占位视图思想
 3、屏幕适配，通过屏幕高度判断
 */

//请求广告的 参数
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"



#import "HYRAdViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "HYRADItem.h"
#import <MJExtension/MJExtension.h>
#import <UIImageView+WebCache.h>//加载网页图片


@interface HYRAdViewController ()
@property (weak, nonatomic) IBOutlet UIView *adContainView;
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
//广告模型
@property (nonatomic, strong) HYRADItem *item;
//显示广告  懒加载
@property (nonatomic, weak) UIImageView *adView;

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
    
    [self loadAdData];
}


#pragma mark - 懒加载  显示广告图
- (UIImageView *)adView
{
    if (_adView == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        
        [self.adContainView addSubview:imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [imageView addGestureRecognizer:tap];
        
        imageView.userInteractionEnabled = YES;
        
        _adView = imageView;
    }
    
    return _adView;
}

// 点击广告界面调用
- (void)tap
{
    // 跳转到界面 => safari
    NSURL *url = [NSURL URLWithString:_item.ori_curl];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url]) {
        [app openURL:url];
    }
}



#pragma mark-加载广告数据
/*
 发送http请求需要去info.plist文件里面 增加App Transport Security Settings 修改
 */
-(void) loadAdData{
    // 1.创建请求会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //这个url是http的 需要去设置里面设置允许请求
    NSString *url = @"http://mobads.baidu.com/cpro/ui/mads.php";
    
    // 2.拼接参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
    
    // 3.发送请求
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        NSLog(@"广告请求成功：%@",responseObject);
        //写到本地
        [responseObject writeToFile:@"/Users/loveqi/Desktop/My/Project(项目)/百思/QiuQiuNi/ad.plist" atomically:YES];
        // 请求数据 -> 解析数据(写成plist文件) -> 设计模型 -> 字典转模型 -> 展示数据
        // 获取字典
        NSDictionary *adDict = [responseObject[@"ad"] lastObject];
        
        // 字典转模型
        _item = [HYRADItem mj_objectWithKeyValues:adDict];
        
#pragma mark - 创建UIImageView展示图片 =>图片以屏幕的宽度来拉伸显示
        
        CGFloat h = HYRScreenW / _item.w * _item.h;
        self.adView.frame = CGRectMake(0, 0, HYRScreenW, h);
        // 加载网上的图片  用SDW
        [self.adView sd_setImageWithURL:[NSURL URLWithString:_item.w_picurl]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        NSLog(@"广告请求失败的错误原因：%@",error);
    }];

    
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
