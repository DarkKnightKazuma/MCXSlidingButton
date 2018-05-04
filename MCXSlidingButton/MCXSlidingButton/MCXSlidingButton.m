//
//  MCXSlidingButton.m
//  MCXSlidingButton
//
//  Created by unspay on 2018/5/3.
//  Copyright © 2018年 unspay. All rights reserved.
//

#import "MCXSlidingButton.h"

@implementation MCXSlidingButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self p_initUIPanGestureRecognizer];
    }return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self p_initUIPanGestureRecognizer];
    }return self;
}

- (void)p_initUIPanGestureRecognizer{
    self.safeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    UIPanGestureRecognizer *tap = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(p_actionMovie:)];
    [self addGestureRecognizer:tap];
}
- (void)p_actionMovie:(UIPanGestureRecognizer *)recognizer{
    CGPoint locationPoint = [recognizer translationInView:self.presentView];
    
    NSLog(@"%@",NSStringFromCGPoint(locationPoint));

    CGPoint newPoint = CGPointMake(recognizer.view.center.x+locationPoint.x, recognizer.view.center.y+locationPoint.y);
    
    NSLog(@"%@",NSStringFromCGPoint(newPoint));

    
    newPoint.x = MAX(recognizer.view.frame.size.width/2 + self.safeInsets.left, newPoint.x);//左边界限制
    newPoint.y = MAX(recognizer.view.frame.size.height/2 + self.safeInsets.top, newPoint.y);//上边界限制
    newPoint.x = MIN(self.presentView.frame.size.width - recognizer.view.frame.size.width/2 - self.safeInsets.right,newPoint.x);//右边届限制
    newPoint.y = MIN(self.presentView.frame.size.height - recognizer.view.frame.size.height/2 - self.safeInsets.bottom,newPoint.y);//下边界限制
    recognizer.view.center = newPoint;
    [recognizer setTranslation:CGPointZero inView:self.presentView];
}


@end
