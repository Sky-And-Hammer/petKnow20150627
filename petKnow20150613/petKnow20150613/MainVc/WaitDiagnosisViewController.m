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
#import "petKnowDefine.h"


@interface WaitDiagnosisViewController ()
{
    BOOL tableViewFlag;
}
@property (strong, nonatomic) IBOutlet UITableView *sharedInstanceView;
@property (retain, nonatomic) NSArray *dataArr;
@property (retain, nonatomic) NSArray *waitArr;
@property (retain, nonatomic) NSMutableArray *waitOwnerArr1;
@property (retain, nonatomic) NSMutableArray *petArr;
@end

@implementation WaitDiagnosisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshDataSource];
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
    
    /**
     *  获取患者列表 GetUserPatientDesc
     
     */
    NSMutableDictionary *send1 = [NSMutableDictionary new];
    
    [send1 setObject:ACCOUNT_TOKEN forKey:@"token"];
    [send1 setObject:NETWORK_GET_GETUSERPATIENTSLIST forKey:@"action"];
    [send1 setObject:@"0" forKey:@"offset"];
    [send1 setObject:@"10" forKey:@"count"];
    [send1 setObject:@"18611746169" forKey:@"username"];
    
    
    [[httpGetTools sharedInstance] doGetWithParaments:send1 addressIndex:2 signFlag:NO onFinish:^(BOOL isOk, id result, NSString *error) {
        self.dataArr = [NSArray array];
        self.dataArr = result[@"list"];
        //        NSLog(@"患者列表%@",self.dataArr);
        
    }];
#warning 待诊列表
    /**
     *  获得待诊列表 GetConsultList
     */
    NSMutableDictionary *send2 = [NSMutableDictionary new];
    
    
    [send2 setObject:ACCOUNT_TOKEN forKey:@"token"];
    [send2 setObject:NETWORK_GET_GETCONSULTLIST forKey:@"action"];
    [send2 setObject:@"1" forKey:@"showWay"];
    [send2 setObject:@"0" forKey:@"offset"];
    [send2 setObject:@"10" forKey:@"count"];
    [send2 setObject:@"18611746169" forKey:@"username"];
    
    [[httpGetTools sharedInstance] doGetWithParaments:send2 addressIndex:2 signFlag:NO onFinish:^(BOOL isOk, id result, NSString *error) {
        
        self.waitArr = [NSArray array];
        self.waitArr = result[@"list"];
        
        NSLog(@"待诊个数%@",self.waitArr);
        self.waitOwnerArr1 = [NSMutableArray array];
        for (NSDictionary *dic in self.waitArr) {
            [self.waitOwnerArr1 addObject:dic[@"owner"]];
            
        }
        NSLog(@"主人个数%@",self.waitOwnerArr1);
        
        [_sharedInstanceView reloadData];
    }];
    
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
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableViewFlag) {
        return self.dataArr.count;
    } else {
        return 10;
    }
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
        cell.painetName.text = [[self.dataArr objectAtIndex:indexPath.row] objectForKey:@"name"];
        //        cell.presentSDiagnosisDateLab.text = [[self.dataArr objectAtIndex:indexPath.row] objectForKey:@"lastInterrogationTime"];
        NSString *str = [NSString stringWithFormat:@"%@",[[self.dataArr objectAtIndex:indexPath.row] objectForKey:@"lastInterrogationTime"]];
        cell.presentSDiagnosisDateLab.text = str;
        
#warning 添加图片链接
        [T_m_Tools setImageToDest:NO AndThumbnail:NO AndURL:[[self.dataArr objectAtIndex:indexPath.row] objectForKey:@"ownerAvatarUrl" ] AndDefaultImage:@"" AndBlock:^(UIImage *image) {
            cell.headImageView.image = image;
        }];
        return cell;
    }else{
        if ((indexPath.section % 2) == 1) {
            WaitDiagnosis0_Cell *cell = (WaitDiagnosis0_Cell *)[tableView dequeueReusableCellWithIdentifier:@"waitDiagnosis0_cell" forIndexPath:indexPath];
            
            [T_m_Tools setImageToDest:YES AndThumbnail:YES AndURL:[[self.waitArr objectAtIndex:indexPath.row] objectForKey:@"avatarUrl"] AndDefaultImage:@"morentouxiang" AndBlock:^(UIImage *image) {
                cell.headImageView.image = image;
                cell.contentTextView.text = [[self.waitArr objectAtIndex:indexPath.section] objectForKey:@"description"];
//                cell.petInfoLabel.text = [[self.petArr objectAtIndex:indexPath.section] objectForKey:@"variety"];
                cell.waitTimeLabel.text = @"已候诊30分钟";
            }];
            
            return cell;
        }else{
            WaitDiagnosis1_Cell *cell = (WaitDiagnosis1_Cell *)[tableView dequeueReusableCellWithIdentifier:@"waitDiagnosis1_cell" forIndexPath:indexPath];
            
            [T_m_Tools setImageToDest:YES AndThumbnail:YES AndURL:[[self.waitArr objectAtIndex:indexPath.row] objectForKey:@"avatarUrl"] AndDefaultImage:@"morentouxiang" AndBlock:^(UIImage *image) {
                cell.headImageView.image = image;
//                cell.petInfoLabel.text = [[self.waitArr objectAtIndex:indexPath.section] objectForKey:@"variety"];
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
