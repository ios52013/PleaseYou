//
//  UIBarButtonItem+Item.m
//  QiuQiuNi
//
//  Created by 黄永锐 on 2017/4/22.
//  Copyright © 2017年 LoveQi. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)
//
//快速创建 UIBarButtonItem
+(UIBarButtonItem *)itemWithImage:(UIImage *)image andHightImage:(UIImage *)hightImage andTarget:(id)target andAction:(SEL)action{
    //创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:hightImage forState:UIControlStateHighlighted];
    [button sizeToFit];
    //
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark -如果直接把UIButton包装成UIBarButtonItem，就导致按钮点击区域扩大
    UIView *containView = [[UIView alloc] initWithFrame:button.bounds];
    [containView addSubview:button];
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}

//快速创建 UIBarButtonItem 选中图片
+(UIBarButtonItem *)itemWithImage:(UIImage *)image andSelectImage:(UIImage *)selectImage andTarget:(id)target andAction:(SEL)action{
    //创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:selectImage forState:UIControlStateSelected];
    [button sizeToFit];
    //
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark -如果直接把UIButton包装成UIBarButtonItem，就导致按钮点击区域扩大
    UIView *containView = [[UIView alloc] initWithFrame:button.bounds];
    [containView addSubview:button];
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}


//快速创建 UIBarButtonItem 有图片和标题
#pragma mark - 自定义左侧返回按钮
+(UIBarButtonItem *)itemWithImage:(UIImage *)image andSelectImage:(UIImage *)selectImage andTitle:(NSString *)title andTarget:(id)target andAction:(SEL)action{
    //创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:selectImage forState:UIControlStateHighlighted];
    //设置标题
    [button setTitle:title forState:UIControlStateNormal];
    //设置标题的颜色
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //高亮状态标题颜色
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //尺寸
    [button sizeToFit];
#pragma mark -设置按钮的内容移动
    //设置按钮整体左移
    button.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    
    //
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark -如果直接把UIButton包装成UIBarButtonItem，就导致按钮点击区域扩大
    UIView *containView = [[UIView alloc] initWithFrame:button.bounds];
    [containView addSubview:button];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

//只有标题
+(UIBarButtonItem *)itemWithTitle:(NSString *)title andTarget:(id)target andAction:(SEL)action{
    //创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button sizeToFit];
    //
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIView *containView = [[UIView alloc] initWithFrame:button.bounds];
    [containView addSubview:button];
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}


//只有图片
+(UIBarButtonItem *)itemWithImage:(UIImage *)image andTarget:(id)target andAction:(SEL)action{
    //创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button sizeToFit];
    //
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark -如果直接把UIButton包装成UIBarButtonItem，就导致按钮点击区域扩大
    UIView *containView = [[UIView alloc] initWithFrame:button.bounds];
    [containView addSubview:button];
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}

@end
