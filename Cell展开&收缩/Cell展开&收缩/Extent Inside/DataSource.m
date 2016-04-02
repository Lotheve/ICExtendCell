//
//  DataSource.m
//  Cell展开&收缩
//
//  Created by 卢旭峰 on 16/3/28.
//  Copyright © 2016年 卢旭峰. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.model0 = [[DataModel alloc]init];
        self.model1 = [[DataModel alloc]init];
        self.model2 = [[DataModel alloc]init];
        self.model0.content = @"86年硬币值12万，分币也已达上千身价。日前，一条关于硬币身价暴涨的微博在网络热传，该微博提到硬分币界的“五大天王”和“四小龙”，它们身价暴涨，主要是因为发行规模小，主要是作为收藏品馈赠外宾，所以国内基本没有。而86年的1元硬币则已经升值到12万元，但也是有钱也难买到。";
        self.model1.content = @"对于70、80后来说，硬分币并不稀罕，很多人家至今还能在角落里翻出一个积满灰尘的存钱罐，而存钱罐里满满当当装着的就是各种面值的硬分币。";
        self.model2.content = @"微博称，硬分币收藏市场上的“五大天王”和“四小龙”最炙手可热。“五大天王”是指1981年的1分硬币，1980年的2分硬币，1979年、1980年、1981年的5分硬币，如今每枚的身价已经高达上千元，全套五枚已飙涨至万元以上。";
    }
    return self;
}

@end
