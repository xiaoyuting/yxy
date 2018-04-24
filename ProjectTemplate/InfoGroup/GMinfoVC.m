//
//  GMinfoVC.m
//  ProjectTemplate
//
//  Created by xy on 2017/11/26.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "GMinfoVC.h"
#import "ThreeBaseCell.h"
#import "ThreeFirstCell.h"
#import "ThreeSecondCell.h"
#import "ThreeThirdCell.h"
#import "ThreeFourthCell.h"
#import "XYString.h"
#import "AFNetworking.h"

@interface GMinfoVC ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic ,strong) UITableView *tv;
@property(nonatomic ,strong) NSMutableArray *listArry;

@property (nonatomic, assign) NSInteger page;


@end

@implementation GMinfoVC

- (void)viewDidLoad {
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"日间" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemAction:)];
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    rightBarButtonItem.lee_theme
    .LeeAddCustomConfig(DAY , ^(UIBarButtonItem *item){
        
        item.title = @"夜间";
        
    }).LeeAddCustomConfig(NIGHT , ^(UIBarButtonItem *item){
        
        item.title = @"日间";
    });
    
    self.view.lee_theme.LeeConfigBackgroundColor(@"demovc10_backgroundcolor");
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    [self.view addSubview:self.tv];
    
    self.tv.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
  [super viewDidLoad];

}
// 右栏目按钮点击事件

- (void)rightBarButtonItemAction:(UIBarButtonItem *)sender{
    
    if ([[LEETheme currentThemeTag] isEqualToString:DAY]) {
        
        [LEETheme startTheme:NIGHT];
        
    } else {
        
        [LEETheme startTheme:DAY];
        
    }
    
}

#pragma mark - getter
- (UITableView *)tv{
    
    /*
     本demo由SDAutoLayout库的使用者“李西亚”提供，感谢“李西亚”对本库的关注与支持！
     */
    
    if (!_tv) {
        
        _tv = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tv.separatorColor = [UIColor clearColor];
        _tv.delegate = self;
        _tv.dataSource = self;
        _tv.backgroundColor = [UIColor clearColor];
        
        
        __weak typeof(self) weakSelf = self;
        [self loadData];
//        //..下拉刷新
//        _tv.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            weakSelf.myRefreshView = weakSelf.tv.header;
//            weakSelf.page = 0;
//            [weakSelf loadData];
//        }];
//        
//        // 马上进入刷新状态
//        [_tv.header beginRefreshing];
//        
//        //..上拉刷新
//        _tv.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//            weakSelf.myRefreshView = weakSelf.tv.footer;
//            weakSelf.page = weakSelf.page + 10;
//            [weakSelf loadData];
//        }];
//        
//        _tv.footer.hidden = YES;
//        
        
    }
    return _tv;
}

-(NSMutableArray *)listArry{
    
    if (!_listArry) {
        _listArry = [[NSMutableArray alloc] init];
    }
    return _listArry;
}

#pragma mark - 请求数据
-(void)loadData{
    /*
     本demo由SDAutoLayout库的使用者“李西亚”提供，感谢“李西亚”对本库的关注与支持！
     */
    NSString * urlString = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/%ld-20.html",@"headline/T1348647853363",self.page];
    [RequestManager requestWithType:HttpRequestTypeGet urlString:urlString parameters:nil successBlock:^(id response) {
        NSLog(@"response==%@",response);
        NSLog(@"%@",[response objectForKey:@"T1348647853363"] );
         [self.listArry addObjectsFromArray: [response objectForKey:@"T1348647853363"] ] ;
        [self.tv reloadData];
    } failureBlock:^(NSError *error) {
        
    } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
    NSLog(@"______%@",urlString);
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manager GET:urlString parameters:nil
//        progress:^(NSProgress * _Nonnull downloadProgress) {
//
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSDictionary *dict = [XYString getObjectFromJsonString:responseObject];
//            NSLog(@"%@",responseObject);
//            //..keyEnumerator 获取字典里面所有键  objectEnumerator得到里面的对象  keyEnumerator得到里面的键值
//            NSString *key = [dict.keyEnumerator nextObject];//.取键值
//            NSArray *temArray = dict[key];
//
//            // 数组>>model数组
//
//
//            //..下拉刷新
//
//            [self.listArry addObjectsFromArray: temArray ] ;
//            [self.tv reloadData];
//
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//        }];
   
}

#pragma mark -  回调刷新
//-(void)doneWithView:(MJRefreshComponent*)refreshView{
//    [_tv reloadData];
//    [_myRefreshView  endRefreshing];
//}

#pragma mark - 表的协议方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.listArry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
     本demo由SDAutoLayout库的使用者“李西亚”提供，感谢“李西亚”对本库的关注与支持！
     */
    ThreeBaseCell * cell = nil;
    NSDictionary  * dic = self.listArry[indexPath.row];
    ThreeModel * threeModel =[ThreeModel modelWithDictionary:dic] ;
    
    NSString * identifier = [ThreeBaseCell cellIdentifierForRow:threeModel];
    Class mClass =  NSClassFromString(identifier);
    
    cell =  [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[mClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.threeModel = threeModel;
    
    ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
    
    cell.sd_tableView = tableView;
    cell.sd_indexPath = indexPath;
    
    ///////////////////////////////////////////////////////////////////////
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cell自适应设置
    NSDictionary  * dic = self.listArry[indexPath.row];
    ThreeModel * threeModel =[ThreeModel modelWithDictionary:dic] ;
    
    NSString * identifier = [ThreeBaseCell cellIdentifierForRow:threeModel];
    Class mClass =  NSClassFromString(identifier);
    
    // 返回计算出的cell高度（普通简化版方法，同样只需一步设置即可完成）
    return [self.tv cellHeightForIndexPath:indexPath model:threeModel keyPath:@"threeModel" cellClass:mClass contentViewWidth:[self cellContentViewWith]];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}


@end
