//
//  UIBarButtonItem+Item.h
//  QiuQiuNi
//
//  Created by 黄永锐 on 2017/4/22.
//  Copyright © 2017年 LoveQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)
//快速创建 UIBarButtonItem
+(UIBarButtonItem *)itemWithImage:(UIImage *)image andHightImage:(UIImage *)hightImage andTarget:(id)target andAction:(SEL)action;

//快速创建 UIBarButtonItem  有选中图片
+(UIBarButtonItem *)itemWithImage:(UIImage *)image andSelectImage:(UIImage *)selectImage andTarget:(id)target andAction:(SEL)action;

//快速创建 UIBarButtonItem 有图片和标题
+(UIBarButtonItem *)itemWithImage:(UIImage *)image andSelectImage:(UIImage *)selectImage andTitle:(NSString *)title andTarget:(id)target andAction:(SEL)action;

//只有标题
+(UIBarButtonItem *)itemWithTitle:(NSString *)title andTarget:(id)target andAction:(SEL)action;
//只有图片
+(UIBarButtonItem *)itemWithImage:(UIImage *)image andTarget:(id)target andAction:(SEL)action;


@end
