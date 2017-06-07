//
//  PSRouter.h
//  PSRouter
//
//  Created by sheep on 07/06/2017.
//  Copyright © 2017 sheep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PSRouter : NSObject
/**
 创建Router
 
 @return PSRouter
 */
+ (nonnull instancetype)shareInstance;

/**
 注册Class
 @param class UIViewController
 @param protocol protocol
 */
- (void)registerClass:(nonnull Class)class protocol:(nonnull Protocol*)protocol;

/**
 Open Controller
 
 @param protocol protocol
 @param property controller property
 */
- (void)openScheme:(nonnull Protocol*)protocol property:(nullable void(^)(id _Nullable x))property;

/**
 Open Controller
 
 @param protocol protocol
 @param property controller property
 @param isModel Default is NO  if YES presentViewController else pushViewController
 */
- (void)openScheme:(nonnull Protocol*)protocol property:(nullable void(^)(id _Nullable x))property isModel:(BOOL)isModel;

/**
 dismiss current viewController
 
 @param completion completion
 */
- (void)dismissCompletion: (void (^ _Nullable)(void))completion;

/**
 pop to target controller
 
 @param protocol protocol
 */
- (void)popToScheme:(nonnull Protocol*)protocol;

/**
 返回上一层
 */
- (void)pop;

/**
 topViewController
 */
- (nonnull UIViewController *)topViewController;

/**
 获取指定的Controller
 
 @param protocol protocol
 @param property property
 @return UIViewController conform to protocol
 */
- (nonnull UIViewController*)controllerConformProtocol:(nonnull Protocol*)protocol setProperty:(nullable void(^)(id _Nullable))property;

@end
