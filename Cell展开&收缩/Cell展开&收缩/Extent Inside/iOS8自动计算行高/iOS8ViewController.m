//
//  iOS8ViewController.m
//  Cell展开&收缩
//
//  Created by 卢旭峰 on 16/3/28.
//  Copyright © 2016年 卢旭峰. All rights reserved.
//

#import "iOS8ViewController.h"
#import "iOS8ExtendCell.h"
#import "DataSource.h"
#import "DataModel.h"

@interface iOS8ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableMain;
@property (nonatomic, strong) DataSource *dataSource;

@end

@implementation iOS8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //数据源
    self.dataSource = [[DataSource alloc]init];
    
    self.tableMain.tableFooterView = [[UIView alloc]init];
    
    self.tableMain.estimatedRowHeight = 30;
    self.tableMain.rowHeight = UITableViewAutomaticDimension;
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static  NSString  *identiferidiOS8ExtendCell = @"identiferidiOS8ExtendCell";
    iOS8ExtendCell  *cell = [tableView dequeueReusableCellWithIdentifier:identiferidiOS8ExtendCell];
    DataModel *model = [self.dataSource valueForKey:[NSString stringWithFormat:@"model%zi",indexPath.row]];
    cell.labelContent.text = model.content;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击效果取消
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    iOS8ExtendCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.labelContent.numberOfLines == 0) {
        cell.labelContent.numberOfLines = 1;
    }else{
        cell.labelContent.numberOfLines = 0;
    }
    [self.tableMain beginUpdates];
    [self.tableMain endUpdates];
}


@end
