//
//  ChatMainViewController.m
//  petKnow
//
//  Created by 孟钰丰 on 15/6/12.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "ChatMainViewController.h"
#import "ChatMain0_Cell.h"
#import "petKnowDefine.h"
#import "T_m_Tools.h"
#import "MJRefresh.h"

@interface ChatMainViewController ()
@property (strong, nonatomic) IBOutlet UITableView *sharedInstanceView;

@property (nonatomic, retain) NSArray *arr;
@end

@implementation ChatMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    NSDictionary *dic = @{@"id":@"10000", @"createTime":@"2015-06-09",@"description":@"太好了！！", @"owner":@"小怪兽", @"conversationTime":@"18分钟之前", @"conversationEnd":@"9天前"};
    NSDictionary *dic1 = @{@"id":@"100001", @"createTime":@"2015-06-10",@"description":@"还可以吧！！",@"owner":@"小怪兽1", @"conversationTime":@"23分钟之前", @"conversationEnd":@"8天前"};
    self.arr = @[dic,dic1];
    NSMutableDictionary *getDic = [NSMutableDictionary dictionary];
    [getDic setObject:@"success" forKey:@"resultObject"];
    [getDic setObject:@"6" forKey:@"formNumber"];
    [getDic setObject:@"10" forKey:@"total"];
    [getDic setObject:self.arr forKey:@"list"];
    
    
    
    [self setupSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"进行中的问诊";
    } else {
        return @"已完成的问诊";
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ChatMain0_Cell *cell = (ChatMain0_Cell *)[tableView dequeueReusableCellWithIdentifier:@"chatMain0_cell" forIndexPath:indexPath];
    
    [T_m_Tools setImageToDest:YES AndThumbnail:YES AndURL:nil AndDefaultImage:@"morentouxiang" AndBlock:^(UIImage *image) {
        cell.headImageView.image = image;
        cell.contentLabel.text = [self.arr[0] objectForKey:@"description"];
        cell.titleLabel.text = [self.arr[0] objectForKey:@"owner"];
        cell.conversationTimeLabel.text = [self.arr[0] objectForKey:@"conversationTime"];
        cell.conversationEndLabel.text = [self.arr[0] objectForKey:@"conversationEnd"];
        
        
    }];
    
    return cell;
}



#pragma mark - private mehtods
- (void)refreshDataSource{
    [_sharedInstanceView.header endRefreshing];
}

- (void)setupSubviews{
    __weak typeof(self) weakSelf = self;
    [_sharedInstanceView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf refreshDataSource];
    }];

}

@end
