//
//  ReloadRowViewController.m
//  Cell展开&收缩
//
//  Created by 卢旭峰 on 16/3/28.
//  Copyright © 2016年 卢旭峰. All rights reserved.
//

#import "ReloadRowViewController.h"
#import "ReloadRowCell.h"
#import "DataSource.h"
#import "DataModel.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface ReloadRowViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableMain;
@property (nonatomic, strong) DataSource *dataSource;

@end

@implementation ReloadRowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataSource = [[DataSource alloc]init];
    self.tableMain.tableFooterView = [[UIView alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    DataModel *model = [self.dataSource valueForKey:[NSString stringWithFormat:@"model%zi",indexPath.row]];
    if (model.isExtend) {
        height = [model.content boundingRectWithSize:CGSizeMake(self.view.frame.size.width-16, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} context:nil].size.height;
    }else{
        height = [model.content sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}].height;
    }
    height += 16+1;  //这个1是一个很怪异的现象，暂时没搞清楚原因
    return height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static  NSString  *identiferidReloadRowCell = @"identiferidReloadRowCell";
    ReloadRowCell  *cell = [tableView dequeueReusableCellWithIdentifier:identiferidReloadRowCell];
    DataModel *model = [self.dataSource valueForKey:[NSString stringWithFormat:@"model%zi",indexPath.row]];
    cell.labelContent.text = model.content;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击效果取消
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    DataModel *model = [self.dataSource valueForKey:[NSString stringWithFormat:@"model%zi",indexPath.row]];
    model.isExtend = !model.isExtend;
    //重新加载指定行的cell
    [self.tableMain reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


@end
