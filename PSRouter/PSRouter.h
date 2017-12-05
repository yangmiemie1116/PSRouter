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
 针对自定义的tabbarcontroller， 每次点击tab，要告诉route选中的tab index, index默认为0
 */
@property (nonatomic, assign) NSInteger index;

/**
 创建Router
 
 @return PSRouter
 */
+ (nonnull instancetype)shareInstance;

/**
 注册Class
 @param className UIViewController
 @param protocol protocol
 */
- (void)registerClass:(nonnull Class)className protocol:(nonnull Protocol*)protocol;

/**
 Open Controller
 
 @param protocol protocol
 @param property controller property
 */
- (UIViewController*_Nonnull)openScheme:(nonnull Protocol*)protocol property:(nullable void(^)(id _Nullable x))property;

/**
 Open Controller
 
 @param protocol protocol
 @param property controller property
 @param isModel Default is NO  if YES presentViewController else pushViewController
 */
- (UIViewController*_Nonnull)openScheme:(nonnull Protocol*)protocol property:(nullable void(^)(id _Nullable x))property isModel:(BOOL)isModel;

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

@end
