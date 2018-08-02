//
//  INSActionMaker.h
//  Test
//
//  Created by 晨风 on 2017/8/25.
//  Copyright © 2017年 晨风. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>
#import "INSAction.h"

typedef NS_ENUM(NSUInteger, INSActionsType) {
    INSActionGroup,
    INSActionSequence,
};

@interface INSActionMaker : NSObject

- (instancetype)initWithActionsType:(INSActionsType)type;

/**
 添加一个动作

 @return <#return value description#>
 */
- (INSAction *)action;

/**
 添加一个动作
 通过一组并行动作创建
 @param block <#block description#>
 @return <#return value description#>
 */
- (INSAction *)groupAction:(void (^)(INSActionMaker *maker))block;

/**
 添加一个动作
 通过一组串行动作创建
 @param block <#block description#>
 @return <#return value description#>
 */
- (INSAction *)sequenceAction:(void (^)(INSActionMaker *maker))block;



- (void)addAction:(INSAction *)action;

- (void)removeActionForKey:(NSString *)key;

- (INSAction *)actionForKey:(NSString *)key;


#pragma mark - Private

- (SCNAction *)scnAction;



@end
