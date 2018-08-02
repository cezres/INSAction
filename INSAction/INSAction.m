//
//  INSAction.m
//  Test
//
//  Created by 晨风 on 2017/8/25.
//  Copyright © 2017年 晨风. All rights reserved.
//

#import "INSAction.h"

#define INSActionMustHaveAction     if (!self->_action) { @throw [NSException exceptionWithName:@"必须先初始化动作才能调用该方法" reason:nil userInfo:@{@"obj": self}]; }


@interface INSAction ()

@property (strong, nonatomic) SCNAction *action;

@end

@implementation INSAction

- (instancetype)initWithAction:(SCNAction *)action {
    if (self = [super init]) {
        _action = action;
    }
    return self;
}

#pragma mark - 

#pragma marl move
- (INSAction *(^)(SCNVector3))moveBy {
    return ^id(SCNVector3 delta){
        self->_action = [SCNAction moveBy:delta duration:0];
        return self;
    };
}

- (INSAction *(^)(SCNVector3))moveTo {
    return ^id(SCNVector3 location){
        self->_action = [SCNAction moveTo:location duration:0];
        return self;
    };
}

#pragma rotate
- (INSAction *(^)(SCNVector3))rotateBy {
    return ^id(SCNVector3 delta){
        self->_action = [SCNAction rotateByX:delta.x y:delta.y z:delta.z duration:0];
        return self;
    };
}
- (INSAction *(^)(SCNVector3))rotateTo {
    return ^id(SCNVector3 delta){
        self->_action = [SCNAction rotateToX:delta.x y:delta.y z:delta.z duration:0];
        return self;
    };
}
- (INSAction *(^)(SCNVector3, BOOL))rotateToXArc {
    return ^id(SCNVector3 delta, BOOL shortestUnitArc){
        self->_action = [SCNAction rotateToX:delta.x y:delta.y z:delta.z duration:0 shortestUnitArc:shortestUnitArc];
        return self;
    };
}
- (INSAction *(^)(CGFloat, SCNVector3))rotateByAngle {
    return ^id(CGFloat angle, SCNVector3 axis){
        self->_action = [SCNAction rotateByAngle:angle aroundAxis:axis duration:0];
        return self;
    };
}
- (INSAction *(^)(SCNVector4))rotateToAxisAngle {
    return ^id(SCNVector4 axisAngle){
        self->_action = [SCNAction rotateToAxisAngle:axisAngle duration:0];
        return self;
    };
}

#pragma makr scale
- (INSAction *(^)(CGFloat))scaleBy {
    return ^id(CGFloat scale){
        self->_action = [SCNAction scaleBy:scale duration:0];
        return self;
    };
}
- (INSAction *(^)(CGFloat))scaleTo {
    return ^id(CGFloat scale){
        self->_action = [SCNAction scaleTo:scale duration:0];
        return self;
    };
}

#pragma mark fade
- (INSAction *(^)(void))fadeIn {
    return ^id(void){
        self->_action = [SCNAction fadeInWithDuration:0];
        return self;
    };
}
- (INSAction *(^)(void))fadeOut {
    return ^id(void){
        self->_action = [SCNAction fadeOutWithDuration:0];
        return self;
    };
}
- (INSAction *(^)(CGFloat))fadeOpacityBy {
    return ^id(CGFloat factor){
        self->_action = [SCNAction fadeOpacityBy:factor duration:0];
        return self;
    };
}
- (INSAction *(^)(CGFloat))fadeOpacityTo {
    return ^id(CGFloat opacity){
        self->_action = [SCNAction fadeOpacityTo:opacity duration:0];
        return self;
    };
}

#pragma mark hide
- (INSAction *(^)(void))hide {
    return ^id(void){
        self->_action = [SCNAction hide];
        return self;
    };
}
- (INSAction *(^)(void))unhide {
    return ^id(void){
        self->_action = [SCNAction hide];
        return self;
    };
}

#pragma mark wait
- (INSAction *(^)(void))wait {
    return ^id(void){
        self->_action = [SCNAction waitForDuration:0];
        return self;
    };
}
- (INSAction *(^)(NSTimeInterval))waitWithRange {
    return ^id(NSTimeInterval durationRange){
        self->_action = [SCNAction waitForDuration:0 withRange:durationRange];
        return self;
    };
}

#pragma mark remove
- (INSAction *(^)(void))removeFromParentNode {
    return ^id(void){
        self->_action = [SCNAction removeFromParentNode];
        return self;
    };
}

#pragma mark duration
- (INSAction *(^)(CGFloat))duration {
    return ^id(CGFloat duration){
        INSActionMustHaveAction
        self->_action.duration = duration;
        return self;
    };
}

#pragma repeat
- (INSAction *(^)(NSUInteger))repeat {
    return ^id(NSUInteger count){
        INSActionMustHaveAction
        self->_action = [SCNAction repeatAction:self->_action count:count];
        return self;
    };
}
- (INSAction *(^)(void))repeatForever {
    return ^id(void){
        INSActionMustHaveAction
        self->_action = [SCNAction repeatActionForever:self->_action];
        return self;
    };
}

#pragma mark reversed
- (INSAction *(^)(void))reversed {
    return ^id(void){
        INSActionMustHaveAction
        [self->_action reversedAction];
        return self;
    };
}

- (INSAction *)runBlock:(void (^)(SCNNode *))block {
    _action = [SCNAction runBlock:block];
    return self;
}

- (INSActionTimingMode *)timingMode {
    return [[INSActionTimingMode alloc] initWithAction:self];
}

- (void)setupTimingMode:(SCNActionTimingMode)timingMode {
    _action.timingMode = timingMode;
}

@end
