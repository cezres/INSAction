//
//  INSActionTimingMode.h
//  INARMultiverse
//
//  Created by 晨风 on 2017/9/6.
//  Copyright © 2017年 jiuyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class INSAction;

@interface INSActionTimingMode : NSObject

@property (assign, nonatomic, readonly) INSAction *linear;
@property (assign, nonatomic, readonly) INSAction *easeIn;
@property (assign, nonatomic, readonly) INSAction *easeOut;
@property (assign, nonatomic, readonly) INSAction *easeInEaseOut;

#pragma mark - Private

- (instancetype)initWithAction:(INSAction *)action;

@end
