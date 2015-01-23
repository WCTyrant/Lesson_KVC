//
//  StockInfo.h
//  Lesson_KVC
//
//  Created by lanouhn on 14-9-21.
//  Copyright (c) 2014年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StockModel;
@interface StockInfo : UIView


@property (nonatomic,strong) StockModel *model;//存储股票的一个对象
@property (nonatomic,retain) UILabel *priceLabel;//用来显示股票的价格

@end
