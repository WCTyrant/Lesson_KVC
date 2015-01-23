//
//  GetDataTableViewController.h
//  Lesson_KVC
//
//  Created by lanouhn on 14-9-21.
//  Copyright (c) 2014年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StockInfo;
@interface GetDataTableViewController : UITableViewController
{
    BOOL orSelected;

}
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) StockInfo *info;


@end
