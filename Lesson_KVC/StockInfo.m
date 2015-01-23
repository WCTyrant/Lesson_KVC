//
//  StockInfo.m
//  Lesson_KVC
//
//  Created by lanouhn on 14-9-21.
//  Copyright (c) 2014年 lanouhn. All rights reserved.
//

#import "StockInfo.h"
#import "StockModel.h"
@implementation StockInfo
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 100, 30)];
        self.priceLabel.backgroundColor = [UIColor grayColor];
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 30)];
        nameLabel.backgroundColor = [UIColor grayColor];
        [self addSubview:self.priceLabel];
        [self addSubview:nameLabel];
        //创建股票对象
        self.model = [[StockModel alloc] init];
        [self.model setValue:@"阿里巴巴" forKey:@"nameOfStock"];
        [self.model setValue:@"92.5美元" forKey:@"priceOfStock"];
        nameLabel.text = self.model.nameOfStock;
        self.priceLabel.text = self.model.priceOfStock;
        //为股票的价格属性添加观察者
        [self.model addObserver:self forKeyPath:@"priceOfStock" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
        
        
        //创建按钮模拟价格波动
        UIButton *clickButton = [[UIButton alloc] initWithFrame:CGRectMake(210, 10, 60, 30)];
        clickButton.backgroundColor = [UIColor grayColor];
        [clickButton setTitle:@"价格变动" forState:UIControlStateNormal];
        [clickButton addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:clickButton];
    }
    return self;
}

- (void)handleButtonAction:(UIButton *)sender{

    NSString *price = [NSString stringWithFormat:@"%f美元",(float)(arc4random()%1000)];
    [self.model setValue:price forKey:@"priceOfStock"];
    
}
//价格发生变化后执行的回调方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{

    if ([keyPath isEqualToString:@"priceOfStock"]) {
        self.priceLabel.text = [self.model valueForKey:@"priceOfStock"];
    }

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
