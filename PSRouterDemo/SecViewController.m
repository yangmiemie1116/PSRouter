//
//  SecViewController.m
//  PSRouterDemo
//
//  Created by 杨志强 on 07/06/2017.
//  Copyright © 2017 sheep. All rights reserved.
//

#import "SecViewController.h"
#import "Protocol.h"
#import <PSRouter/PSRouter.h>
@interface SecViewController ()<SecProtocol>

@end

@implementation SecViewController
@synthesize buttonTitle = _buttonTitle;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.buttonTitle;
    UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:centerButton];
    [centerButton setTitle:self.buttonTitle forState:UIControlStateNormal];
    [centerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    centerButton.backgroundColor = [UIColor grayColor];
    centerButton.frame = CGRectMake(0, 0, 80, 60);
    centerButton.center = self.view.center;
    [centerButton addTarget:self action:@selector(buttonDown) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonDown {
    [[PSRouter shareInstance] pop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
