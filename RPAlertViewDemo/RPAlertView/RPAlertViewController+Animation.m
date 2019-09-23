//
//  RPAlertViewController+Animation.m
//  RPAlertViewDemo
//
//  Created by 博信科技 on 2019/7/24.
//  Copyright © 2019 西安博信信息科技有限公司. All rights reserved.
//

#import "RPAlertViewController+Animation.h"
#import "AlertViewShowPresentAnimation.h"
#import "AlertViewDissmissAnimation.h"
#import "AlertShowPresentationController.h"

@interface RPAlertViewController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation RPAlertViewController (Animation)

- (void)loadView {
    [super loadView];
    self.transitioningDelegate = self;
}

// MARK: - animation about
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    AlertViewShowPresentAnimation *transition = [[AlertViewShowPresentAnimation alloc] init];
    return transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    AlertViewDissmissAnimation *transition = [[AlertViewDissmissAnimation alloc] init];
    return transition;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    
    return [[AlertShowPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}


@end
