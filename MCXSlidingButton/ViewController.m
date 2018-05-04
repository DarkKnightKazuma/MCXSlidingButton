//
//  ViewController.m
//  MCXSlidingButton
//
//  Created by unspay on 2018/5/3.
//  Copyright © 2018年 unspay. All rights reserved.
//

#import "ViewController.h"
#import "MCXSlidingButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    CALayer *greenLayer = [CALayer layer];
    greenLayer.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,100);
    greenLayer.backgroundColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:greenLayer];
    
    MCXSlidingButton *button = [MCXSlidingButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 100, 100, 100);
    [button setTitle:@"按住拖动" forState:UIControlStateNormal];
    button.backgroundColor =[UIColor orangeColor];
    button.layer.cornerRadius = 50;
    button.layer.masksToBounds = YES;
    button.safeInsets = UIEdgeInsetsMake(greenLayer.bounds.size.height, 0, 0, 0);
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.presentView = self.view;
}

- (void)btnAction:(UIButton*)btn{
    NSLog(@"点击按钮");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
