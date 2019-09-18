//
//  AlertViewDissmissAnimation.m
//  CatchU
//
//  Created by rp.wang on 2019/7/4.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

#import "AlertViewDissmissAnimation.h"
#import "RPAlertViewController.h"

@implementation AlertViewDissmissAnimation
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    RPAlertViewController *fromVC = (RPAlertViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    fromVC.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    UIView *containView = transitionContext.containerView;
    [containView addSubview:fromVC.view];
    fromVC.view.alpha = 1;
    fromVC.centerView.transform = CGAffineTransformMakeScale(1, 1);
    [UIView animateWithDuration:0.35 animations:^{
        fromVC.centerView.transform = CGAffineTransformMakeScale(0.3, 0.3);
        fromVC.view.alpha = 0.1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35;
}
@end
