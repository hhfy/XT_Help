//
//  HomeCollectionViewController.m
//  XT_Help
//
//  Created by 徐淼斌 on 16/3/1.
//  Copyright © 2016年 徐淼斌. All rights reserved.
//

#import "HomeCollectionViewController.h"
#import "MyCollectionViewCell.h"
#import "CycleScrollView.h"
#import "MyCollectionReusableView.h"
#import "BloodSugarMonitoringTableVC.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"

#define WinWidth [UIScreen mainScreen].bounds.size.width
#define WinHeight [UIScreen mainScreen].bounds.size.height

#define W(x) WinWidth*x/320.0
#define H(y) WinHeight*y/568.0

@interface HomeCollectionViewController ()

@property (nonatomic , retain) CycleScrollView *scorllView;
@end

@implementation HomeCollectionViewController

static NSString * const reuseIdentifier = @"collec";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"糖友圈";
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];
    
    self.titleArray = [NSArray arrayWithObjects:@"血糖监测",@"自我评估",@"综合报告",@"运动消耗",@"饮食健康",@"用药管理",@"知识教育",@"资讯分享",@"系统设置", nil];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 30, self.view.frame.size.width, 30)];
    label.text = @"关注今日老年慢性病资讯...";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    [self setupLeftMenuButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupLeftMenuButton{
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    //[self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
    self.navigationItem.leftBarButtonItem=leftDrawerButton;
}

#pragma mark - Button Handlers
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    cell.bounds=CGRectMake(0, 0, W(105), W(105));
    cell.nameLabel.text = self.titleArray[indexPath.row];
    NSString *imgStr=@"0011.png";
    cell.imgView.image=[UIImage imageNamed:imgStr];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    MyCollectionReusableView *titleView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusable" forIndexPath:indexPath];
    if (indexPath.section == 0){
        NSMutableArray *viewsArray = [@[] mutableCopy];
        for (int i = 0; i < 19; ++i) {
            NSString *imgStr=[NSString stringWithFormat:@"img%i.png",i+1];
            UIImageView *view=[[UIImageView alloc]initWithImage:[UIImage imageNamed:imgStr]];
            view.frame=CGRectMake(0, 0, W(320), H(150));
            [viewsArray addObject:view];
        }
        //不会自动翻页
            self.scorllView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, H(150))];
        //自动翻页
        //self.scorllView=[[CycleScrollView alloc]initWithFrame:CGRectMake(0, 0, W(320), H(150)) animationDuration:2.0];
        self.scorllView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
            return viewsArray[pageIndex];
        };
        self.scorllView.totalPagesCount = ^NSInteger(void){
            return 5;
        };
        self.scorllView.TapActionBlock = ^(NSInteger pageIndex){
            NSLog(@"点击了第%ld个",pageIndex);
        };
        [titleView addSubview:self.scorllView];
    }
//    else{
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, W(320), 10)];
//        [titleView addSubview:view];
//    }
    return titleView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*) collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    　　return CGSizeMake(W(106), W(106));
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(self.view.frame.size.width, H(150));
    }
    else  {
        return CGSizeMake(self.view.frame.size.width, 2);
    }
  
    
}



#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell #%ld was selected", (long)indexPath.row);
    if(indexPath.row == 0) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        //由storyboard根据storyBoardID来获取我们要切换的视图
        BloodSugarMonitoringTableVC *blood = [story instantiateViewControllerWithIdentifier:@"blood"];
        [self.navigationController pushViewController:blood animated:true];
    }
    
    
    return;
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end



