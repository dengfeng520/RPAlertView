//
//  LTAlertViewController.h
//  CatchU
//
//  Created by rp.wang on 2019/7/4.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertCenterView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, bgColorMode) {
    showRoot,
    disRoot,
};

typedef NS_ENUM(NSInteger, alertMode) {
    onlyOneMode,
    cancelAndOKMode,
};

@interface RPAlertViewController : UIViewController

- (instancetype)initWithMode:(bgColorMode)mode;

@property (strong, nonatomic) AlertCenterView *centerView;
@property (strong, nonatomic) void(^leftBtnBlock)(void);
@property (strong, nonatomic) void(^rightBtnBlock)(void);
@property (strong, nonatomic) void (^oneBtnBlock)(void);


- (void)configMixedAlert:(NSString *)title body:(NSString *)context leftBtnTitle:(NSString *)left rightBtnTitle:(NSString *)right;
- (void)configAlertOnlyOneBtn:(nonnull NSString *)title body:(nonnull NSString *)context btnTitle:(nonnull NSString *)btnText;
- (void)configAttributedStringAlertOnlyOneBtnTitle:(NSString *)title body:(NSMutableAttributedString *)context btnText:(NSString *)btnText;
- (void)configMutableAttributedString:(nonnull NSString *)title body:(nonnull NSMutableAttributedString *)context leftBtnTitle:(nonnull NSString *)left rightBtnTitle:(nonnull NSString *)right;

@end

NS_ASSUME_NONNULL_END
