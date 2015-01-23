//
//  GetDataTableViewController.m
//  Lesson_KVC
//
//  Created by lanouhn on 14-9-21.
//  Copyright (c) 2014年 lanouhn. All rights reserved.
//

#import "GetDataTableViewController.h"
#import "AFNetworking.h"
#import "Model.h"
#import "StockInfo.h"
@interface GetDataTableViewController ()

@end

@implementation GetDataTableViewController

- (NSMutableArray *)dataArray{

    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"KVC" style:UIBarButtonItemStylePlain target:self action:@selector(handleEditAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"KVO" style:UIBarButtonItemStylePlain target:self action:@selector(handleAddAction:)];
    self.info = [[StockInfo alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 100, self.view.frame.size.width, 50)];
    self.info.backgroundColor = [UIColor colorWithRed:0.3 green:0.7 blue:0.9 alpha:1.0];
    [self.tableView addSubview:self.info];
    
}

//KVO
- (void)handleAddAction:(UIBarButtonItem *)sender{

    if (!orSelected) {
        [UIView animateWithDuration:0.5 animations:^{
            self.info.frame = CGRectMake(0, 100, self.view.frame.size.width, 50);
        } completion:^(BOOL finished) {
            orSelected = YES;
        }];
    }else{
    
        [UIView animateWithDuration:0.5 animations:^{
            self.info.frame = CGRectMake(0, 100, self.view.frame.size.width, 50);
        } completion:^(BOOL finished) {
            orSelected = NO;
        }];
    }
    
}
//KVC
- (void)handleEditAction:(UIBarButtonItem *)sender{
    NSString *str = @"http://xuan.news.cn/cloudnews/wyxh/index_vThirdBanner.html";
    NSURL *url = [NSURL URLWithString:str];
    
    NSURLRequest *requset = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:requset];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *html = operation.responseString;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        id dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSMutableArray *dataOfNet = [dict objectForKey:@"list"];
        for (NSDictionary *data in dataOfNet) {
            Model *new = [[Model alloc] init];
            [new setValuesForKeysWithDictionary:data];
            NSLog(@"_______________%@",new.title);
            [self.dataArray addObject:new];
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"网络加载失败!请检查你的网络" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"重新加载", nil];
        [alertView show];
        
    }];
    [operation start];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
