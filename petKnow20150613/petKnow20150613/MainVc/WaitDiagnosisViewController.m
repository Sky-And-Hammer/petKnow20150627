//
//  WaitDiagnosisViewController.m
//  petKnow
//
//  Created by 孟钰丰 on 15/6/13.
//  Copyright (c) 2015年 宠知道科技有限公司. All rights reserved.
//

#import "WaitDiagnosisViewController.h"
#import "WaitDiagnosis0_Cell.h"
#import "WaitDiagnosis1_Cell.h"
#import "WaitDiagnosis2_Cell.h"
#import "T_m_Tools.h"
#import "MJRefresh.h"

@interface WaitDiagnosisViewController ()
{
    BOOL tableViewFlag;
}
@property (strong, nonatomic) IBOutlet UITableView *sharedInstanceView;
@property (nonatomic, strong) NSArray *arr;
@end

@implementation WaitDiagnosisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
}
#pragma mark - privite methods
- (void)changeTableView:(id)sender{
    UIButton *button = (UIButton *)sender;
    if (button.tag == 10002) {
        tableViewFlag = YES;
    }else{
        tableViewFlag = NO;
    }
    
    [_sharedInstanceView reloadData];
}

- (void)refreshDataSource{
    [_sharedInstanceView.header endRefreshing];
    [_sharedInstanceView.footer endRefreshing];
}

- (void)setupSubviews {
    __weak typeof(self) weakSelf = self;
    [_sharedInstanceView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf refreshDataSource];
    }];
    [_sharedInstanceView addLegendFooterWithRefreshingBlock:^{
        [weakSelf refreshDataSource];
    }];
    
    NSDictionary *dic = @{@"regId":@"1111", @"interrogationTimes":@"2", @"lastInterrogationTime":@"2015-05-03", @"ownerName":@"八哥", @"ownerAvatarUrl":@"xxxxx.com", @"species":@"dog", @"name":@"小怪兽", @"petId":@"000"};
    NSDictionary *dic1 = @{@"regId":@"1112", @"interrogationTimes":@"4", @"lastInterrogationTime":@"2015-05-08", @"ownerName":@"八哥g", @"ownerAvatarUrl":@"xxxxpp.com", @"species":@"cat", @"name":@"小怪兽打到", @"petId":@"001"};
    NSDictionary *dic2 = @{@"regId":@"1113", @"interrogationTimes":@"3", @"lastInterrogationTime":@"2015-05-06", @"ownerName":@"八哥gg", @"ownerAvatarUrl":@"xxxxpssp.com", @"species":@"cat", @"name":@"小怪兽打到", @"petId":@"002"};
    NSDictionary *dic3 = @{@"regId":@"1112", @"interrogationTimes":@"4", @"lastInterrogationTime":@"2015-05-08", @"ownerName":@"八哥g", @"ownerAvatarUrl":@"xxxxpp.com", @"species":@"cat", @"name":@"小怪兽打到", @"petId":@"003"};
    NSDictionary *dic4 = @{@"regId":@"1112", @"interrogationTimes":@"4", @"lastInterrogationTime":@"2015-05-08", @"ownerName":@"八哥g", @"ownerAvatarUrl":@"xxxxpp.com", @"species":@"cat", @"name":@"小怪兽打到", @"petId":@"004"};
    self.arr = @[dic, dic1, dic2, dic3, dic4];
    NSMutableDictionary *getDic = [NSMutableDictionary dictionary];
    [getDic setObject:@"true" forKey:@"resultObject"];
    [getDic setObject:@"5" forKey:@"total"];
    [getDic setObject:self.arr forKey:@"list"];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableViewFlag) {
        return 60.f;
    }else{
        return 157.f;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 40.f;
    }
    return 0.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40.f)];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, self.view.frame.size.width * 0.5, 40.f);
    [leftBtn addTarget:self action:@selector(changeTableView:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.tag = 10001;
    [leftBtn setTitle:@"待诊" forState:UIControlStateNormal];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(leftBtn.frame.size.width, 0, leftBtn.frame.size.width, 40.f);
    [rightBtn addTarget:self action:@selector(changeTableView:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = 10002;
    [rightBtn setTitle:@"我的患者" forState:UIControlStateNormal];
    
    [headView addSubview:leftBtn];
    [headView addSubview:rightBtn];
    
    return headView;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableViewFlag) {
        WaitDiagnosis2_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"waitDiagnosis2_cell" forIndexPath:indexPath];
        
        return cell;
    }else{
        if ((indexPath.section % 2) == 1) {
            WaitDiagnosis0_Cell *cell = (WaitDiagnosis0_Cell *)[tableView dequeueReusableCellWithIdentifier:@"waitDiagnosis0_cell" forIndexPath:indexPath];
            
            [T_m_Tools setImageToDest:YES AndThumbnail:YES AndURL:nil AndDefaultImage:@"morentouxiang" AndBlock:^(UIImage *image) {
                cell.headImageView.image = image;
                cell.nameLabel.text = [self.arr[0] objectForKey:@"name"];
                cell.contentTextView.text = @"还不知道该说点什么";
                cell.petInfoLabel.text = @"拉肚子";
                cell.waitTimeLabel.text = @"已候诊30分钟";
            }];
            
            return cell;
        }else{
            WaitDiagnosis1_Cell *cell = (WaitDiagnosis1_Cell *)[tableView dequeueReusableCellWithIdentifier:@"waitDiagnosis1_cell" forIndexPath:indexPath];
            
            [T_m_Tools setImageToDest:YES AndThumbnail:YES AndURL:nil AndDefaultImage:@"morentouxiang" AndBlock:^(UIImage *image) {
                cell.headImageView.image = image;
                cell.nameLabel.text = [self.arr[2] objectForKey:@"name"];
                cell.contentTextView.text = @"还不知道该说点什么,还是不知道该说点什么";
                cell.petInfoLabel.text = @"不吃东西";
                cell.waitTimeLabel.text = @"已候诊80分钟";
            }];
            return cell;
        }

    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableViewFlag) {
        [self performSegueWithIdentifier:@"patientInfo_success" sender:self];
    }else{
        [self performSegueWithIdentifier:@"diagnosisiInfo_success" sender:self];
    }
    
}


@end
