//
//  HYRADItem.h
//  QiuQiuNi
//
//  Created by 黄永锐 on 2017/4/23.
//  Copyright © 2017年 LoveQi. All rights reserved.
//  广告模型

// w_picurl,ori_curl:跳转到广告界面,w,h


#import <Foundation/Foundation.h>

@interface HYRADItem : NSObject

/** 广告地址 */
@property (nonatomic, strong) NSString *w_picurl;
/** 点击广告跳转的界面 */
@property (nonatomic, strong) NSString *ori_curl;
@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;

@end
