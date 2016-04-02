//
//  ExtendInsideVC.m
//  Cell展开&收缩
//
//  Created by 卢旭峰 on 16/3/28.
//  Copyright © 2016年 卢旭峰. All rights reserved.
//

#import "ExtendInsideVC.h"
#import "ExtendInsideCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "DataModel.h"
#import "DataSource.h"

@interface ExtendInsideVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableMain;
@property (nonatomic, strong) DataSource *dataSource;

@end

@implementation ExtendInsideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //数据源
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
    DataModel *model = [self.dataSource valueForKey:[NSString stringWithFormat:@"model%zi",indexPath.row]];
    CGFloat height = [tableView fd_heightForCellWithIdentifier:@"ExtendInsideCell" configuration:^(id cell) {
        ExtendInsideCell *extendInsideCell = (ExtendInsideCell *)cell;
        if (model.isExtend) {
            extendInsideCell.labelContent.text = model.content;
        }else{
            extendInsideCell.labelContent.text = @" ";
        }
    }];
    return height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExtendInsideCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExtendInsideCell"];
    DataModel *model = [self.dataSource valueForKey:[NSString stringWithFormat:@"model%zi",indexPath.row]];
    cell.labelContent.text = model.content;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击效果取消
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    DataModel *model = [self.dataSource valueForKey:[NSString stringWithFormat:@"model%zi",indexPath.row]];
    model.isExtend = !model.isExtend;
    
    [self.tableMain beginUpdates];
    [self.tableMain endUpdates];
    //除了用来批量处理insertion/deletion操作，beginUpdates和endUpdates方法的另一个作用是用来在不reload cell的情况下动态刷新cell的高度(不会调用cellForRowAtIndexPath:代理方法，会调用heightForRowAtIndexPath:)
    //You can also use this method followed by the endUpdates method to animate the change in the row heights without reloading the cell.
}


@end
