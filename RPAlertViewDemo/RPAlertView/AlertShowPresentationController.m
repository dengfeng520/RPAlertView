//
//  AlertShowPresentationController.m
//  CatchU
//
//  Created by rp.wang on 2019/7/4.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

#import "AlertShowPresentationController.h"

@implementation AlertShowPresentationController
- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController {
    if (self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController]) {
        
    }
    return self;
}

- (void)presentationTransitionWillBegin {
    [super presentationTransitionWillBegin];
}

- (void)dismissalTransitionWillBegin {
    [super dismissalTransitionWillBegin];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
    [super dismissalTransitionDidEnd:completed];
}

- (CGRect)frameOfPresentedViewInContainerView {
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    return CGRectMake(0, 0, screenBound.size.width, screenBound.size.height);
}
@end
