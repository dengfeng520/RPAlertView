//
//  ConfigDrakMode.m
//  RPAlertViewDemo
//
//  Created by rp.wang on 2019/12/9.
//  Copyright © 2019 西安博信信息科技有限公司. All rights reserved.
//

#import "ConfigDrakMode.h"

@implementation ConfigDrakMode
+ (void)configDrakModeWith:(UIView *)isView {
    if (@available(iOS 13.0, *)) {
        isView.backgroundColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1];
            } else {
                return UIColor.whiteColor;
            }
       }];
    } else {
        isView.backgroundColor = UIColor.whiteColor;
    }
}
@end
