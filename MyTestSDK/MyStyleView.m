//
//  MyStyleView.m
//  MySDKTest
//
//  Created by LYH on 2019/8/16.
//  Copyright © 2019 LYH. All rights reserved.
//

#import "MyStyleView.h"

@implementation MyStyleView

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray<NSString *> *)titleArray {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubviewsWithTitleArray:titleArray];
    }
    return self;
}

- (void)setupSubviewsWithTitleArray:(NSArray<NSString *> *)titleArray {
    
    CGFloat buttonWidth = [UIScreen mainScreen].bounds.size.width / titleArray.count;
    
    [titleArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(idx * buttonWidth, 0,buttonWidth , self.frame.size.height);
        [button setTitle:obj forState:0];
        [button setTitleColor:[UIColor blackColor] forState:0];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightMedium];
        button.tag = 10 + idx;
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        if (idx == 0) {
            button.selected = true;
        }
    }];
}

- (void)clickButton:(UIButton *)sender {
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)obj;
            btn.selected = false;
        }
    }];
    sender.selected = true;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(view:clickButtonWithTag:)]) {
        [self.delegate view:self clickButtonWithTag:sender.tag];
    }
}

-(void)setBgColor:(UIColor *)bgColor {
    
    _bgColor = bgColor;
    self.backgroundColor = bgColor;
}
@end
