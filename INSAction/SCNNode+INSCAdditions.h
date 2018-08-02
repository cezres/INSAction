//
//  SCNNode+INSCAdditions.h
//  Test
//
//  Created by 晨风 on 2017/8/25.
//  Copyright © 2017年 晨风. All rights reserved.
//

#import <SceneKit/SceneKit.h>
#import "INSActionMaker.h"

@interface SCNNode (INSCAdditions)

/**
 执行一组并行动作

 @param block <#block description#>
 */
- (void)makeGroupAction:(void (^)(INSActionMaker *maker))block;
- (void)makeGroupAction:(void (^)(INSActionMaker *maker))block completionHandler:(void (^)(void))completionBlock;

/**
 执行一组串行动作

 @param block <#block description#>
 */
- (void)makeSequenceAction:(void (^)(INSActionMaker *maker))block;
- (void)makeSequenceAction:(void (^)(INSActionMaker *maker))block completionHandler:(void (^)(void))completionBlock;


@end
