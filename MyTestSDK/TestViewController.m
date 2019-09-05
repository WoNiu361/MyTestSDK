//
//  TestViewController.m
//  VC
//
//  Created by LYH on 2019/9/2.
//  Copyright © 2019 LYH. All rights reserved.
//

#import "TestViewController.h"
#import <MBProgressHUD.h>

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MyTest";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}



@end

