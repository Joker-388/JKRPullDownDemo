//
//  JKRSecondViewController.m
//  JKRNavigationDemo1
//
//  Created by tronsis_ios on 17/3/29.
//  Copyright © 2017年 tronsis_ios. All rights reserved.
//

#import "JKRSecondViewController.h"
#import "JKRNavigationBar.h"

@interface JKRSecondViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) JKRNavigationBar *navigationBar;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGRect imageFrame;

@end

@implementation JKRSecondViewController

/**
 顶栏设置的是背景色的透明度，而不是顶栏的透明度，因为修改顶栏的透明度小于0.1后，顶栏不能够响应点击事件。
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Second controller";
    self.view.backgroundColor = [UIColor greenColor];
    self.imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 0.6);
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    UIView *header = [UIView new];
    header.backgroundColor = [UIColor clearColor];
    header.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 0.6);
    self.tableView.tableHeaderView = header;
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.navigationBar];
    _imageFrame = self.imageView.frame;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 隐藏系统默认的顶栏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)backButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat yOffset = scrollView.contentOffset.y;
    NSLog(@"%f", yOffset);
    if (yOffset >= 0) {  // scrollView滑动的位置是原来基础的上上移
        if (yOffset <= (self.view.frame.size.width * 0.6 - 64)) {
            // 向上滑动且图片没有移出屏幕的范围内，向上滑动后往回滑动且没有会到起始位置
            // 顶栏的背景透明度逐渐减小，不透明度增加
            self.navigationBar.jkr_alpha = yOffset / (self.view.frame.size.width * 0.6 - 64);
            // 图片跟着滑动手势向上移动
            CGRect frame = self.imageFrame;
            frame.origin.y -= yOffset;
            self.imageView.frame = frame;
        } else {
            // 向上滑动到图片移出屏幕范围后，或向上滑动后往回滑动且还没有滑动到显示图片的位置时
            // 解决快速上滑的时候，顶栏不能完全不透明的bug
            // 当图片移出屏幕范围后，修正顶栏的背景透明度为1.0
            self.navigationBar.jkr_alpha = 1.0;
        }
    } else { // scrollView滑动的位置是原来基础的上下移
        // 图片的frame在原来图片的起始位置的基础上来放大
        CGRect frame = self.imageFrame;
        // x值为滑动距离的一半，适配宽度拉宽为滑动距离后的居中
        frame.origin.x = yOffset * 0.5f;
        // 宽度增加为滑动的距离
        frame.size.width += -yOffset;
        // 高度增加为滑动的距离
        frame.size.height += -yOffset;
        self.imageView.frame = frame;
        // 顶栏背景色为全透明
        self.navigationBar.jkr_alpha = 0.0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    cell.textLabel.text = @"My Test for custom navigation bar";
    return cell;
}

- (JKRNavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [JKRNavigationBar new];
        _navigationBar.jkr_alpha = 0.0;
        [_navigationBar.backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _navigationBar;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"5"];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.layer.masksToBounds = YES;
    }
    return _imageView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}

@end
