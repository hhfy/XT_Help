//
//  MyCollectionReusableView.h
//  XT_Help
//
//  Created by 徐淼斌 on 16/3/1.
//  Copyright © 2016年 徐淼斌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CycleScrollView.h"

#define WinWidth [UIScreen mainScreen].bounds.size.width
#define WinHeight [UIScreen mainScreen].bounds.size.height

#define W(x) WinWidth*x/320.0
#define H(y) WinHeight*y/568.0


@interface MyCollectionReusableView : UICollectionReusableView

@property (nonatomic , retain) CycleScrollView *scorllView;

@end
