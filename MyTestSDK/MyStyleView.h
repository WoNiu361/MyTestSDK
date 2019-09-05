//
//  MyStyleView.h
//  MySDKTest
//
//  Created by LYH on 2019/8/16.
//  Copyright © 2019 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyStyleView;

typedef NS_ENUM(NSInteger,ShowCityName) {
    ShowCityName_LuoHe         = 10,   //漯河
    ShowCityName_XinXiang,             //新乡
    ShowCityName_HangZhou,             //杭州
    ShowCityName_GuangZhou,            //广州
};

NS_ASSUME_NONNULL_BEGIN

@protocol MyStyleViewDelegate <NSObject>

- (void)view:(MyStyleView *)view clickButtonWithTag:(NSInteger)buttonTag;
@end

@interface MyStyleView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray<NSString *> *)titleArray;

/**    背景色   */
@property (nonatomic, strong) UIColor *bgColor;

@property (nonatomic, weak) id<MyStyleViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
