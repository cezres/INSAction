//
//  SCNNode+INSCAdditions.m
//  Test
//
//  Created by 晨风 on 2017/8/25.
//  Copyright © 2017年 晨风. All rights reserved.
//

#import "SCNNode+INSCAdditions.h"

@implementation SCNNode (INSCAdditions)

- (void)makeGroupAction:(void (^)(INSActionMaker *))block {
    [self makeGroupAction:block completionHandler:nil];
}
- (void)makeGroupAction:(void (^)(INSActionMaker *))block completionHandler:(void (^)(void))completionBlock {
    INSActionMaker *maker = [[INSActionMaker alloc] initWithActionsType:INSActionGroup];
    block(maker);
    SCNAction *action = [maker scnAction];
    [self runAction:action completionHandler:completionBlock];
}

- (void)makeSequenceAction:(void (^)(INSActionMaker *))block {
    [self makeSequenceAction:block completionHandler:nil];
}
- (void)makeSequenceAction:(void (^)(INSActionMaker *))block completionHandler:(void (^)(void))completionBlock {
    INSActionMaker *maker = [[INSActionMaker alloc] initWithActionsType:INSActionSequence];
    block(maker);
    SCNAction *action = [maker scnAction];
    [self runAction:action completionHandler:completionBlock];
}


@end
