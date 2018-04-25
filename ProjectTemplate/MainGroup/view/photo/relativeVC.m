//
//  relativeVC.m
//  ProjectTemplate
//
//  Created by GM on 2018/4/22.
//  Copyright © 2018年 yuting. All rights reserved.
//

#import "relativeVC.h"
#import "photoUserCell.h"
#import "photoVC.h"
@interface relativeVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tab;
@property (nonatomic,strong) NSMutableArray * infoArr;

@end

@implementation relativeVC

- (void)viewDidLoad {
    self.title =@"相册";
    NSArray *textArray = @[
  @{
      @"icon":@"loading",
      @"name":@"与当前用户相册",
      @"distance":@"与当前用户的距离:1000米"
      },
  @{
      @"icon":@"loading",
      @"name":@"填写名字",
      @"distance":@"与当前用户的距离:1000米"
      }
                           ];
    self.infoArr   = [NSMutableArray arrayWithArray:textArray];
    [super viewDidLoad];
       [self setSubviews];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
    // Dispose of any resources that can be recreated.
}

- (void)setSubviews{
    self.tab = [[UITableView alloc]init];
    self.tab.delegate   = self;
    self.tab.dataSource = self;
    self.tab.separatorStyle =  UITableViewCellSeparatorStyleNone;
    [self.view sd_addSubviews:@[self.tab]];
    self.tab.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake([self naviGationH], 0, 0, 0 ));
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.infoArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    
    // >>>>>>>>>>>>>>>>>>>>> * cell自适应步骤2 * >>>>>>>>>>>>>>>>>>>>>>>>
    /* model 为模型实例， keyPath 为 model 的属性名，通过 kvc 统一赋值接口 */
    return [self.tab
            cellHeightForIndexPath:indexPath
                            model:self.infoArr[indexPath.row]
                          keyPath:@"dicInfo"
                        cellClass:[photoUserCell class]
                 contentViewWidth:[self cellContentViewWith]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * str = @"photo";
    photoUserCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if(!cell){
        cell = [[photoUserCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
    }
    cell.dicInfo = self.infoArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //[tableView clearSelectedRowsAnimated:YES];
    
    photoVC *vc = [[photoVC alloc] init];
    [self pushViewController:vc animated:YES];
 
}


@end
