//
//  UIButton+Category.m
//  CatchU
//
//  Created by rp.wang on 2019/7/4.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

#import "UIButton+Category.h"
#import <objc/runtime.h>

static const int block_key;

@implementation UIButton (Category)

- (void)addTargetWithEvent:(UIControlEvents)EventType withTargetBlock:(addTargetBlock)TargetBlock {
    objc_setAssociatedObject(self, &block_key, TargetBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(AddTargetBlocks:) forControlEvents:EventType];
}

- (void)AddTargetBlocks:(id)sender {
    addTargetBlock block = (addTargetBlock)objc_getAssociatedObject(self, &block_key);
    if (block) {
        block();
    }
}
@end
