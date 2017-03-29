//
//  JKRNavigationController.m
//  JKRNavigationDemo1
//
//  Created by tronsis_ios on 17/3/29.
//  Copyright © 2017年 tronsis_ios. All rights reserved.
//

#import "JKRNavigationController.h"

@interface JKRNavigationController ()<UINavigationControllerDelegate>

@property (nonatomic,strong) id popDelegate;

@end

@implementation JKRNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    
}

#pragma UINavigationControllerDelegate方法
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //实现滑动返回功能
    //清空滑动返回手势的代理就能实现
    self.interactivePopGestureRecognizer.delegate =  viewController == self.viewControllers[0]? self.popDelegate : nil;
}

@end
