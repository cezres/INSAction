//
//  INSAction.h
//  INSAction
//
//  Created by 晨风 on 2018/8/1.
//  Copyright © 2018年 晨风. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for INSAction.
FOUNDATION_EXPORT double INSActionVersionNumber;

//! Project version string for INSAction.
FOUNDATION_EXPORT const unsigned char INSActionVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <INSAction/PublicHeader.h>

#import <SceneKit/SceneKit.h>
#import "INSActionTimingMode.h"

#define INV3Make(x,y,z) ({SCNVector3 __v3 = {x,y,z}; __v3;})
#define INV4Make(x,y,z,w) ({SCNVector4 __v4 = {x,y,z,w}; __v4;})

@interface INSAction : NSObject

@property (strong, nonatomic, readonly) SCNAction *action;

@property (strong, nonatomic) NSString *key;

//PhotoEntity

#pragma mark - 初始化动作

#pragma mark move
- (INSAction * (^)(SCNVector3 delta))moveBy;  /// 移动
- (INSAction * (^)(SCNVector3 location))moveTo;  /// 移动

#pragma mark rotate
- (INSAction * (^)(SCNVector3 delta))rotateBy;  /// 旋转
- (INSAction * (^)(SCNVector3 delta))rotateTo;  /// 旋转
- (INSAction * (^)(SCNVector3 delta, BOOL shortestUnitArc))rotateToXArc;  /// 旋转
- (INSAction * (^)(CGFloat angle, SCNVector3 aroundAxis))rotateByAngle;  /// 旋转
- (INSAction * (^)(SCNVector4 axisAngle))rotateToAxisAngle;  /// 旋转

#pragma mark scale
- (INSAction * (^)(CGFloat scale))scaleBy;  /// 缩放
- (INSAction * (^)(CGFloat scale))scaleTo;  /// 缩放

#pragma mark fade
- (INSAction * (^)(void))fadeIn;  /// 改变透明度为1
- (INSAction * (^)(void))fadeOut;  /// 改变透明度为0
- (INSAction * (^)(CGFloat factor))fadeOpacityBy;  /// 透明度
- (INSAction * (^)(CGFloat opacity))fadeOpacityTo;  /// 透明度

#pragma mark hide
- (INSAction * (^)(void))hide;  /// 隐藏节点
- (INSAction * (^)(void))unhide;  /// 显示节点

#pragma mark wait
- (INSAction * (^)(void))wait;  /// 等待
- (INSAction * (^)(NSTimeInterval durationRange))waitWithRange;  /// 等待

#pragma mark remove
- (INSAction * (^)(void))removeFromParentNode;  /// 从它的父节点删除节点


#pragma mark - 必须先调用以上方法初始化动作，才能再调用以下方法

#pragma mark duration
- (INSAction * (^)(CGFloat duration))duration;  /// 执行时间

#pragma nmark repeat
- (INSAction * (^)(NSUInteger count))repeat;    /// 重复
- (INSAction * (^)(void))repeatForever;    /// 永远重复

#pragma mark reversed
- (INSAction * (^)(void))reversed;  /// 反向

#pragma mark

- (INSAction *)runBlock:(void (^)(SCNNode *node))block;

/**
 action.timingMode.easeOut;
 */
@property (assign, nonatomic, readonly) INSActionTimingMode *timingMode;

#pragma mark -  Private

- (instancetype)initWithAction:(SCNAction *)action;
- (void)setupTimingMode:(SCNActionTimingMode)timingMode;

@end

