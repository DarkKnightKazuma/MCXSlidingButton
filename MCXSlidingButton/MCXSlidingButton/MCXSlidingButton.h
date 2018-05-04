//
//  MCXSlidingButton.h
//  MCXSlidingButton
//
//  Created by unspay on 2018/5/3.
//  Copyright © 2018年 unspay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCXSlidingButton : UIButton

@property (nonatomic,weak) UIView *presentView;

@property (nonatomic,assign)UIEdgeInsets safeInsets;

@end
