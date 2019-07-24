//
//  ShowAlertPresentAnimation.m
//  CatchU
//
//  Created by rp.wang on 2019/7/4.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

#import "AlertViewShowPresentAnimation.h"
#import "RPAlertViewController.h"

@implementation AlertViewShowPresentAnimation
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    RPAlertViewController *toVC = (RPAlertViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    UIView *containView = transitionContext.containerView;
    [containView addSubview:toVC.view];
    toVC.view.alpha = 0.1;
    [UIView animateWithDuration:0.35 animations:^{
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}
@end
