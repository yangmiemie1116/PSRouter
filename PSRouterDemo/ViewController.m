//
//  ViewController.m
//  PSRouterDemo
//
//  Created by 杨志强 on 07/06/2017.
//  Copyright © 2017 yangzhiqiang. All rights reserved.
//

#import "ViewController.h"
#import <PSRouter/PSRouter.h>
#import "Protocol.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"First";
    UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:centerButton];
    [centerButton setTitle:@"Next" forState:UIControlStateNormal];
    [centerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    centerButton.backgroundColor = [UIColor grayColor];
    centerButton.frame = CGRectMake(0, 0, 80, 60);
    centerButton.center = self.view.center;
    [centerButton addTarget:self action:@selector(buttonDown) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonDown {
    [[PSRouter shareInstance] openScheme:@protocol(SecProtocol) property:^(id<SecProtocol>target) {
        target.buttonTitle = @"Sectond";
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
