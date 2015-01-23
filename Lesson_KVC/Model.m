//
//  Model.m
//  Lesson--KVC
//
//  Created by lanouhn on 14-9-21.
//  Copyright (c) 2014年 www.lanou3g.com. All rights reserved.
//

#import "Model.h"

@implementation Model
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{


}
- (id)initWithData:(NSDictionary *)data
{
    if (self = [super init]) {
        self.abstract = [data objectForKey:@"abstract"];
        self.title = [data objectForKey:@"title"];
        self.titleImg = [data objectForKey:@"titleImg"];
    }
    return self;
}

//+ (id)modelWithData:(NSDictionary *)data
//{
//    Model *model = [[Model alloc] initWithData:data];
//    return model;
//}

@end
