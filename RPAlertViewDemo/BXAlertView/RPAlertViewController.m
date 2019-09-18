//
//  LTAlertViewController.m
//  CatchU
//
//  Created by rp.wang on 2019/7/4.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

#import "RPAlertViewController.h"

@interface RPAlertViewController ()

@property (strong, nonatomic) UIButton *leftBtn;
@property (strong, nonatomic) UIButton *rightBtn;

@end

@implementation RPAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak typeof (self) weakSelf = self;
    self.centerView.clickOneBtnBlock = ^{
        weakSelf.oneBtnBlock();
        [weakSelf dismissViewControllerAnimated:true completion:nil];
    };
    self.centerView.clickLeftBtnBlock = ^{
        weakSelf.leftBtnBlock();
        [weakSelf dismissViewControllerAnimated:true completion:nil];
    };
    self.centerView.clickRightBtnBlock = ^{
        weakSelf.rightBtnBlock();
        [weakSelf dismissViewControllerAnimated:true completion:nil];
    };
    self.centerView.transform = CGAffineTransformMakeScale(0.1, 0.1);
}

- (AlertCenterView *)centerView {
    if (!_centerView) {
        _centerView = [[AlertCenterView alloc] init];
        [self.view addSubview:_centerView];
        _centerView.translatesAutoresizingMaskIntoConstraints = false;
        [[_centerView.widthAnchor constraintEqualToConstant:288] setActive:true];
        [[_centerView.heightAnchor constraintGreaterThanOrEqualToConstant:163] setActive:true];
        [[_centerView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:0] setActive:true];
        [[_centerView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:0] setActive:true];
        _centerView.layer.cornerRadius = 16;
    }
    return _centerView;
}

- (instancetype)initWithMode:(bgColorMode)mode {
    self = [super init];
    if (self) {
        if (mode == showRoot) {
            self.view.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3];
        } else {
            self.view.backgroundColor = UIColor.clearColor;
        }
    }
    return self;
}

// MARK: - config about
- (void)configAlertOnlyOneBtn:(NSString *)title body:(NSString *)context btnTitle:(NSString *)btnText {
    [self.centerView configOnlyOneBtn:title body:context btnTitle:btnText];
}

- (void)configMixedAlert:(NSString *)title body:(NSString *)context leftBtnTitle:(NSString *)left rightBtnTitle:(NSString *)right {
    [self.centerView configAlert:title body:context leftBtnTitle:left rightBtnTitle:right];
}

- (void)configAttributedStringAlertOnlyOneBtnTitle:(NSString *)title body:(NSMutableAttributedString *)context btnText:(NSString *)btnText {
    [self.centerView configMutStringAlertOnlyOneBtn:title body:context btnTitle:btnText];
}

- (void)configMutableAttributedString:(NSString *)title body:(NSMutableAttributedString *)context leftBtnTitle:(NSString *)left rightBtnTitle:(NSString *)right {
    [self.centerView configMutableStringAlert:title body:context leftBtnTitle:left rightBtnTitle:right];
}


@end

