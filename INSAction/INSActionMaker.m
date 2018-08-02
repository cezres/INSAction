//
//  INSActionMaker.m
//  Test
//
//  Created by 晨风 on 2017/8/25.
//  Copyright © 2017年 晨风. All rights reserved.
//

#import "INSActionMaker.h"

@interface INSActionMaker ()

{
    NSMutableArray<INSAction *> *_actions;
    
    SCNAction *_scnAction;
    
    INSActionsType _type;
}

@end

@implementation INSActionMaker

- (instancetype)initWithActionsType:(INSActionsType)type {
    if (self = [super init]) {
        _type = type;
        _actions = [NSMutableArray array];
    }
    return self;
}

- (INSAction *)action {
    INSAction *action = [INSAction new];
    [_actions addObject:action];
    return action;
}

- (INSAction *)groupAction:(void (^)(INSActionMaker *))block {
    INSActionMaker *maker = [[INSActionMaker alloc] initWithActionsType:INSActionGroup];
    block(maker);
    SCNAction *scnAction = [maker scnAction];
    INSAction *action = [[INSAction alloc] initWithAction:scnAction];
    [_actions addObject:action];
    return action;
}

- (INSAction *)sequenceAction:(void (^)(INSActionMaker *))block {
    INSActionMaker *maker = [[INSActionMaker alloc] initWithActionsType:INSActionSequence];
    block(maker);
    SCNAction *scnAction = [maker scnAction];
    INSAction *action = [[INSAction alloc] initWithAction:scnAction];
    [_actions addObject:action];
    return action;
}

- (void)addAction:(INSAction *)action {
    [_actions addObject:action];
}

- (void)removeActionForKey:(NSString *)key {
    [_actions enumerateObjectsUsingBlock:^(INSAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.key isEqualToString:key]) {
            [self->_actions removeObjectAtIndex:idx];
            *stop = YES;
        }
    }];
}

- (INSAction *)actionForKey:(NSString *)key {
    __block INSAction *action = nil;
    [_actions enumerateObjectsUsingBlock:^(INSAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.key isEqualToString:key]) {
            action = obj;
            *stop = YES;
        }
    }];
    return action;
}


- (SCNAction *)scnAction {
    if (_actions.count == 1) {
        return _actions.firstObject.action;
    }
    else if (_actions.count > 1) {
        NSMutableArray *actions = [NSMutableArray arrayWithCapacity:_actions.count];
        [_actions enumerateObjectsUsingBlock:^(INSAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.action) {
                [actions addObject:obj.action];
            }
        }];
        if (_type == INSActionGroup) {
            return [SCNAction group:actions];
        }
        else {
            return [SCNAction sequence:actions];
        }
    }
    else {
        return nil;
    }
}



@end
