//
//  ConfigDrakMode.h
//  RPAlertViewDemo
//
//  Created by rp.wang on 2019/12/9.
//  Copyright © 2019 西安博信信息科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConfigDrakMode : NSObject
+ (void)configViewBgDrakModeWith:(UIView *)isView;
+ (void)configTxtColorDrakModeWith:(UILabel *)isLab;
+ (void)configDrakModeWithLineView:(UIView *)lineView;
@end

NS_ASSUME_NONNULL_END
