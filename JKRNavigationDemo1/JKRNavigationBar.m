//
//  JKRNavigationBar.m
//  JKRNavigationDemo1
//
//  Created by tronsis_ios on 17/3/29.
//  Copyright © 2017年 tronsis_ios. All rights reserved.
//

#import "JKRNavigationBar.h"

@implementation JKRNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 64.0f);
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.backButton];
    return self;
}

- (void)setJkr_alpha:(CGFloat)jkr_alpha {
    _jkr_alpha = jkr_alpha;
    [self setNeedsDisplay];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL result = [super pointInside:point withEvent:event];
    
    return result;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    UIColor *backgroudColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:_jkr_alpha];
    [backgroudColor setFill];
    CGContextAddPath(context, path.CGPath);
    CGContextFillPath(context);
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.backgroundColor = [UIColor clearColor];
        [_backButton setTitle:@"Back" forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        _backButton.frame = CGRectMake(0, 20, 60, 44);
    }
    return _backButton;
}

@end
