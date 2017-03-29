//
//  JKRFirstViewController.m
//  JKRNavigationDemo1
//
//  Created by tronsis_ios on 17/3/29.
//  Copyright © 2017年 tronsis_ios. All rights reserved.
//

#import "JKRFirstViewController.h"
#import "JKRSecondViewController.h"

@interface JKRFirstViewController ()

@end

@implementation JKRFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"First controller";
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 当上一页navigationBar隐藏的时候，从上一页滑动回来的时候，顶栏不渐变，而是跟随
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[JKRSecondViewController new] animated:YES];
}

@end
