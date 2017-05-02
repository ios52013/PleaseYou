//
//  HYRLeftViewController.m
//  QiuQiuNi
//
//  Created by 黄永锐 on 2017/4/25.
//  Copyright © 2017年 LoveQi. All rights reserved.
//

#import "HYRLeftViewController.h"
#import "AppDelegate.h"


@interface HYRLeftViewController ()<UITableViewDelegate,UITableViewDataSource>

@end



@implementation HYRLeftViewController




static NSString *cellID = @"cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //列表的背景图
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image = [UIImage imageNamed:@"leftbackiamge"];
    [self.view addSubview:imageview];
    
    //创建列表
    UITableView *tableview = [[UITableView alloc] init];
    self.tableview = tableview;
    tableview.frame = self.view.bounds;
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    
    //注册cell
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    
}



#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:20.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"个人信息";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"我的收藏";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"我的发布";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"推荐给好友";
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"系统设置";
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor cyanColor];
    
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //关闭左侧抽屉
    [tempAppDelegate.leftDragerVC closeLeftView];
    //跳转控制器
    [tempAppDelegate.mainNavigationController pushViewController:vc animated:NO];
}

//分区头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 180;
}


//分区的头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, 180)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}



@end
