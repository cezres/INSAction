//
//  INSActionTimingMode.m
//  INARMultiverse
//
//  Created by 晨风] on 2017/9/6.
//  Copyright © 2017年 jiuyan. All rights reserved.
//

#import "INSActionTimingMode.h"
#import "INSAction.h"

@implementation INSActionTimingMode
{
    INSAction *_action;
}

- (instancetype)initWithAction:(INSAction *)action {
    if (self = [super init]) {
        
    }
    return self;
}

- (INSAction *)linear {
    [_action setupTimingMode:SCNActionTimingModeLinear];
    return _action;
}

- (INSAction *)easeIn {
    [_action setupTimingMode:SCNActionTimingModeEaseIn];
    return _action;
}

- (INSAction *)easeOut {
    [_action setupTimingMode:SCNActionTimingModeEaseOut];
    return _action;
}

- (INSAction *)easeInEaseOut {
    [_action setupTimingMode:SCNActionTimingModeEaseInEaseOut];
    return _action;
}

@end
