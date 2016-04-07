//
//  MyCollectionReusableView.m
//  XT_Help
//
//  Created by 徐淼斌 on 16/3/1.
//  Copyright © 2016年 徐淼斌. All rights reserved.
//

#import "MyCollectionReusableView.h"

@implementation MyCollectionReusableView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //[self addTopCV];
    }
    return self;
}

//-(void)addTopCV {
//    NSMutableArray *viewsArray = [@[] mutableCopy];
//    for (int i = 0; i < 19; ++i) {
//        NSString *imgStr=[NSString stringWithFormat:@"img%i.png",i+1];
//        UIImageView *view=[[UIImageView alloc]initWithImage:[UIImage imageNamed:imgStr]];
//        view.frame=CGRectMake(0, 0, W(320), H(200));
//        [viewsArray addObject:view];
//    }
//    //不会自动翻页
//    //    self.mainScorllView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
//    //自动翻页
//    self.scorllView=[[CycleScrollView alloc]initWithFrame:CGRectMake(0, 0, W(320), H(200)) animationDuration:2.0];
//    self.scorllView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
//        return viewsArray[pageIndex];
//    };
//    self.scorllView.totalPagesCount = ^NSInteger(void){
//        return 5;
//    };
//    self.scorllView.TapActionBlock = ^(NSInteger pageIndex){
//        // NSLog(@"点击了第%ld个",pageIndex);
//    };
//    [self addSubview:self.scorllView];
//}


@end
