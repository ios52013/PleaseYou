//
//  HYRAwayViewController.m
//  QiuQiuNi
//
//  Created by 黄永锐 on 2017/4/26.
//  Copyright © 2017年 LoveQi. All rights reserved.
//

#import "HYRAwayViewController.h"

@interface HYRAwayViewController ()

@end

@implementation HYRAwayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HYRRandomColor;
}


#pragma mark - Table view data source 数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%zd-说实话锐哥你真帅", self.class, indexPath.row];
    return cell;
}


@end
