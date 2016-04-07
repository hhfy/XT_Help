//
//  IBDesiView.m
//  XT_Help
//
//  Created by 徐淼斌 on 16/3/2.
//  Copyright © 2016年 徐淼斌. All rights reserved.
//

#import "IBDesiView.h"

IB_DESIGNABLE
@implementation IBDesiView

- (void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius  = _cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setBcolor:(UIColor *)bcolor{
    _bcolor = bcolor;
    self.layer.borderColor = _bcolor.CGColor;
}

- (void)setBwidth:(CGFloat)bwidth {
    _bwidth = bwidth;
    self.layer.borderWidth = _bwidth;
}

@end
