//
//  DataModel.h
//  Cell展开&收缩
//
//  Created by 卢旭峰 on 16/3/28.
//  Copyright © 2016年 卢旭峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong) NSString *content;

@property (nonatomic, assign) BOOL isExtend;  //标记当前数据的展开状态

@end
