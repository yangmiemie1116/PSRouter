//
//  PSRouter.m
//  PSRouter
//
//  Created by sheep on 07/06/2017.
//  Copyright © 2017 sheep. All rights reserved.
//

#import "PSRouter.h"
@interface PSRouter()
@property (nonatomic, strong) NSMutableDictionary *mapDict;
@end

@implementation PSRouter
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static PSRouter *router = nil;
    dispatch_once(&onceToken, ^{
        router = [[PSRouter alloc] init];
    });
    return router;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.index = 0;
        self.mapDict = @{}.mutableCopy;
    }
    return self;
}

- (void)registerClass:(nonnull Class)className protocol:(nonnull Protocol*)protocol {
    [self.mapDict setObject:className forKey:NSStringFromProtocol(protocol)];
}

- (UIViewController*)openScheme:(nonnull Protocol*)protocol property:(nullable void(^)(id _Nullable x))property {
    return [self openScheme:protocol property:property isModel:NO];
}

- (UIViewController*)openScheme:(nonnull Protocol*)protocol property:(nullable void(^)(id _Nullable x))property isModel:(BOOL)isModel {
    Class class = self.mapDict[NSStringFromProtocol(protocol)];
    UIViewController *controller = [class new];
    controller.hidesBottomBarWhenPushed = YES;
    if (property) {
        property(controller);
    }
    if (isModel) {
        UINavigationController *rootNavi = [[UINavigationController alloc] initWithRootViewController:controller];
        [[self topViewController] presentViewController:rootNavi animated:YES completion:nil];
    } else {
        [[self topViewController].navigationController pushViewController:controller animated:YES];
    }
    return controller;
}

- (void)pop {
    [[self topViewController].navigationController popViewControllerAnimated:YES];
}

- (void)popToScheme:(nonnull Protocol*)protocol {
    Class class = self.mapDict[NSStringFromProtocol(protocol)];
    UIViewController *targetController = nil;
    NSArray<__kindof UIViewController *> *viewControllers = [self topViewController].navigationController.viewControllers;
    for (UIViewController *controller in viewControllers) {
        if ([controller isMemberOfClass:class]) {
            targetController = controller;
            break;
        }
    }
    if (targetController) {
        [[self topViewController].navigationController popToViewController:targetController animated:YES];
    }
}

- (void)dismissCompletion: (void (^ __nullable)(void))completion {
    [[self topViewController] dismissViewControllerAnimated:YES completion:^{
        if (completion) {
            completion();
        }
    }];
}

- (UIViewController *)topViewController {
    return [self p_topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

- (UIViewController*)p_topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self p_topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self p_topViewControllerWithRootViewController:navigationController.topViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self p_topViewControllerWithRootViewController:presentedViewController];
    } else {
        if ([rootViewController.parentViewController isKindOfClass:[UINavigationController class]]) {
            return rootViewController;
        }
        if (rootViewController.childViewControllers.count > self.index) {
            return [self p_topViewControllerWithRootViewController:rootViewController.childViewControllers[self.index]];
        }
        return nil;
    }
}

@end
