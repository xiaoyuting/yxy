//
//  GMmainVC.m
//  ProjectTemplate
//
//  Created by xy on 2017/11/26.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "GMmainVC.h"
#import "UITapGestureRecognizer+Block.h"
#import "GMHomeRequest.h"
#import "relativeVC.h"
#import "videoVC.h"
#import "DiscoveryViewController.h"

@interface GMmainVC ()
{
    UIScrollView *_scrollView;
    
    UIView *_flowItemContentView;
}


@end

@implementation GMmainVC

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self setSubView];

}
-(void)viewWillAppear:(BOOL)animated{
    //self.navigationController.navigationBar .hidden = YES;
}
- (void)setSubView{
    
    
    [self setupScrollView];
   
    
}

- (void)selectInfo: (UIButton *) sender{
   
    if (sender.tag==0){
        videoVC  * v  = [[videoVC alloc]init];
        [self pushViewController:v animated:YES];
    }else if(sender.tag==1){
        DiscoveryViewController *discoverVC = [[DiscoveryViewController alloc] init];
        [self.navigationController pushViewController:discoverVC animated:YES];
    }else if(sender.tag==2){
        relativeVC* rela = [[relativeVC alloc]init];
        [self pushViewController:rela  animated:YES];
        
    }else if(sender.tag==3){
        
    }
}


// 添加scrollview
- (void)setupScrollView
{
    UIScrollView *scroll = [UIScrollView new];
    [self.view addSubview:scroll];
    _scrollView = scroll;
    
    // 设置scrollview与父view的边距
    scroll.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    [self setupFlowItemContentView];
    
    // 设置scrollview的contentsize自适应
    [scroll setupAutoContentSizeWithBottomView:_flowItemContentView bottomMargin:10];
}


// 添加flowItemContentView
- (void)setupFlowItemContentView
{
    _flowItemContentView = [UIView new];
    _flowItemContentView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.4];
    [_scrollView addSubview:_flowItemContentView];
    
    _flowItemContentView.sd_layout
    .leftEqualToView(_scrollView)
    .rightEqualToView(_scrollView)
    .topEqualToView(_scrollView);
    
    [self setupFlowItemViews];
}



- (void)setupFlowItemViews
{
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton  new];
        btn.tag =i;
        if(i==0){
            [btn setTitle:@"视屏" forState:UIControlStateNormal];
        }else if(i==1){
            [btn setTitle:@"" forState:UIControlStateNormal];
        }else if(i==2){
            [btn setTitle:@"相册" forState:UIControlStateNormal];
        }else if(i==3){
            [btn setTitle:@"通知" forState:UIControlStateNormal];
        }
        [btn addTarget:self action:@selector(selectInfo:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [self randomColor];
        [_flowItemContentView addSubview:btn];
        btn.sd_layout.autoHeightRatio(1.5);
        [temp addObject:btn];
    }
    
    // 关键步骤：设置类似collectionView的展示效果
    [_flowItemContentView setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:2 verticalMargin:10 horizontalMargin:10 verticalEdgeInset:0 horizontalEdgeInset:0];
}


- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}






//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
//    NSArray * weathers = @[@"晴", @"多云", @"小雨", @"大雨", @"雪", @""];
//     NSString *weather = weathers[arc4random() % weathers.count];
//    if(!kiOSBefore){
//        [self setAppIconWithName:weather];
//
//     }
//}
//- (void)setAppIconWithName:(NSString *)iconName {
//    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
//        return;
//    }
//
//    if ([iconName isEqualToString:@""]) {
//        iconName = nil;
//    }
//    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
//        if (error) {
//            NSLog(@"更换app图标发生错误了 ： %@",error);
//        }
//    }];
//}




- (void)senderRequest{
    kWeakSelf(self);
   
//    [GMHomeRequest GMHomeRequestSuccess:^(GMhomeModel *data) {
//    
//        NSMutableArray * bannerArr = [NSMutableArray array];
//        NSMutableArray * bannerTitle = [NSMutableArray array];
//        NSMutableArray * newArr = [NSMutableArray array];
//        NSMutableArray * newTactic = [NSMutableArray array];
//        for (GMhomeBannerModel   * model in data.banner) {
//            [bannerArr  addObject:model.image];
//            [bannerTitle addObject:model.title];
//        }
//        for(GMhomeRecommendModel  * model  in data.hot_recommend){
//            if([model.cate_name isEqualToString:@"新闻"]){
//                [newArr addObject: model.title];
//                
//            }else{
//                [newTactic addObject: model.title];
//            }
//        }
//        [weakself.dataArr addObjectsFromArray:data.block];
//        [weakself.cateArr addObjectsFromArray:data.block];
//        dispatch_async(dispatch_get_main_queue(), ^{
// 
//            weakself.advView.titlesGroup  = [bannerTitle copy];
//            weakself.advView.imageURLStringsGroup = [bannerArr copy];
//            weakself.adTacticView.titlesGroup = [newTactic copy];
//            weakself.adNewsView.titlesGroup   = [newArr copy];
//            [weakself.cateCollectView reloadData];
//            [weakself.tableView reloadData];
//        });
//     
//        
//    } failure:^(NSError *error) {
//        
//    }];
}





@end
