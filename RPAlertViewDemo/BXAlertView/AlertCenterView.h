//
//  AlertCenterView.h
//  CatchU
//
//  Created by rp.wang on 2019/7/4.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertCenterView : UIView

@property (strong, nonatomic) void(^clickLeftBtnBlock)(void);
@property (strong, nonatomic) void(^clickRightBtnBlock)(void);
@property (strong, nonatomic) void (^clickOneBtnBlock)(void);


- (void)configOnlyOneBtn:(NSString *)title body:(NSString *)context btnTitle:(NSString *)btnText;
- (void)configAlert:(NSString *)title body:(NSString *)context leftBtnTitle:(NSString *)left rightBtnTitle:(NSString *)right;
- (void)configMutStringAlertOnlyOneBtn:(NSString *)title body:(NSMutableAttributedString *)context btnTitle:(NSString *)btnText;
- (void)configMutableStringAlert:(NSString *)title body:(NSMutableAttributedString *)context leftBtnTitle:(NSString *)left rightBtnTitle:(NSString *)right;
@end

NS_ASSUME_NONNULL_END
