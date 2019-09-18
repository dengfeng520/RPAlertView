//
//  AlertCenterView.m
//  CatchU
//
//  Created by rp.wang on 2019/7/4.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

#import "AlertCenterView.h"
#import "UIButton+Category.h"

@interface AlertCenterView ()

@property (strong, nonatomic) UILabel *titleLab;
@property (strong, nonatomic) UILabel *bodyLab;
@property (strong, nonatomic) UIButton *leftBtn;
@property (strong, nonatomic) UIButton *rightBtn;
@property (strong, nonatomic) UIButton *onlyOneBtn;
@property (strong, nonatomic) UIView *verticalLineView;

@end

@implementation AlertCenterView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    self.backgroundColor = UIColor.whiteColor;
    
    __weak typeof (self) weakSelf = self;
    
    self.titleLab = [[UILabel alloc] init];
    [self addSubview:self.titleLab];
    self.titleLab.translatesAutoresizingMaskIntoConstraints = false;
    [[self.titleLab.heightAnchor constraintGreaterThanOrEqualToConstant:15] setActive:true];
    [[self.titleLab.topAnchor constraintEqualToAnchor:self.topAnchor constant:12] setActive:true];
    [[self.titleLab.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:8] setActive:true];
    [[self.titleLab.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-8] setActive:true];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:20];
    self.titleLab.text = @"title";
    
    self.bodyLab = [[UILabel alloc] init];
    [self addSubview:self.bodyLab];
    self.bodyLab.translatesAutoresizingMaskIntoConstraints = false;
    [[self.bodyLab.heightAnchor constraintGreaterThanOrEqualToConstant:35] setActive:true];
    [[self.bodyLab.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:20] setActive:true];
    [[self.bodyLab.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-20] setActive:true];
    [[self.bodyLab.topAnchor constraintEqualToAnchor:self.titleLab.bottomAnchor constant:16] setActive:true];
    self.bodyLab.textAlignment = NSTextAlignmentCenter;
    self.bodyLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:16];
    self.bodyLab.numberOfLines = 0;
    
    
    UIView *horizontalLineView = [[UIView alloc] init];
    [self addSubview:horizontalLineView];
    horizontalLineView.translatesAutoresizingMaskIntoConstraints = false;
    [[horizontalLineView.heightAnchor constraintEqualToConstant:1.5] setActive:true];
    [[horizontalLineView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:0] setActive:true];
    [[horizontalLineView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:0] setActive:true];
    [[horizontalLineView.topAnchor constraintEqualToAnchor:self.bodyLab.bottomAnchor constant:20] setActive:true];
    horizontalLineView.backgroundColor = UIColor.groupTableViewBackgroundColor;
    
    self.verticalLineView = [[UIView alloc] init];
    [self addSubview:self.verticalLineView];
    self.verticalLineView.translatesAutoresizingMaskIntoConstraints = false;
    [[self.verticalLineView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant:0] setActive:true];
    [[self.verticalLineView.widthAnchor constraintEqualToConstant:1.5] setActive:true];
    [[self.verticalLineView.topAnchor constraintEqualToAnchor:horizontalLineView.bottomAnchor constant:2] setActive:true];
    [[self.verticalLineView.heightAnchor constraintEqualToConstant:46] setActive:true];
    [[self.verticalLineView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0] setActive:true];
    self.verticalLineView.backgroundColor = UIColor.groupTableViewBackgroundColor;
    
    
    self.onlyOneBtn = [[UIButton alloc] init];
    [self addSubview:self.onlyOneBtn];
    self.onlyOneBtn.translatesAutoresizingMaskIntoConstraints = false;
    [[self.onlyOneBtn.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:0] setActive:true];
    [[self.onlyOneBtn.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:0] setActive:true];
    [[self.onlyOneBtn.topAnchor constraintEqualToAnchor:horizontalLineView.bottomAnchor constant:0] setActive:true];
    [[self.onlyOneBtn.heightAnchor constraintEqualToConstant:48] setActive:true];
    [[self.onlyOneBtn.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0] setActive:true];
    [self.onlyOneBtn setTitle:@"OK" forState:UIControlStateNormal];
    [self.onlyOneBtn setTitleColor:[UIColor colorWithRed:53/255.0 green:120/255.0 blue:246/255.0 alpha:1] forState:UIControlStateNormal];
    [self.onlyOneBtn addTargetWithEvent:UIControlEventTouchUpInside withTargetBlock:^{
        weakSelf.clickOneBtnBlock();
    }];
    
    self.leftBtn = [[UIButton alloc] init];
    [self addSubview:self.leftBtn];
    self.leftBtn.translatesAutoresizingMaskIntoConstraints = false;
    [[self.leftBtn.topAnchor constraintEqualToAnchor:horizontalLineView.bottomAnchor constant:0] setActive:true];
    [[self.leftBtn.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:0] setActive:true];
    [[self.leftBtn.rightAnchor constraintEqualToAnchor:self.verticalLineView.leftAnchor constant:0] setActive:true];
    [[self.leftBtn.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0] setActive:true];
    [[self.leftBtn.heightAnchor constraintEqualToConstant:48] setActive:true];
    [self.leftBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
    [self.leftBtn addTargetWithEvent:UIControlEventTouchUpInside withTargetBlock:^{
        weakSelf.clickLeftBtnBlock();
    }];
    
    
    self.rightBtn = [[UIButton alloc] init];
    [self addSubview:self.rightBtn];
    self.rightBtn.translatesAutoresizingMaskIntoConstraints = false;
    [[self.rightBtn.topAnchor constraintEqualToAnchor:horizontalLineView.bottomAnchor constant:0] setActive:true];
    [[self.rightBtn.leftAnchor constraintEqualToAnchor:self.verticalLineView.rightAnchor constant:0] setActive:true];
    [[self.rightBtn.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:0] setActive:true];
    [[self.rightBtn.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0] setActive:true];
    [[self.rightBtn.heightAnchor constraintEqualToConstant:48] setActive:true];
    [self.rightBtn setTitle:@"OK" forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:[UIColor colorWithRed:53/255.0 green:120/255.0 blue:246/255.0 alpha:1] forState:UIControlStateNormal];
    [self.rightBtn addTargetWithEvent:UIControlEventTouchUpInside withTargetBlock:^{
        weakSelf.clickRightBtnBlock();
    }];
}

- (void)configOnlyOneBtn:(NSString *)title body:(NSString *)context btnTitle:(NSString *)btnText {
    self.leftBtn.hidden = true;
    self.rightBtn.hidden = true;
    self.verticalLineView.hidden = true;
    [self.onlyOneBtn setTitle:btnText forState:UIControlStateNormal];
    self.titleLab.text = title;
    self.bodyLab.text = context;
}

- (void)configAlert:(NSString *)title body:(NSString *)context leftBtnTitle:(NSString *)left rightBtnTitle:(NSString *)right {
    self.onlyOneBtn.hidden = true;
    [self.leftBtn setTitle:left forState:UIControlStateNormal];
    [self.rightBtn setTitle:right forState:UIControlStateNormal];
    self.titleLab.text = title;
    self.bodyLab.text = context;
}

- (void)configMutStringAlertOnlyOneBtn:(NSString *)title body:(NSMutableAttributedString *)context btnTitle:(NSString *)btnText {
    self.leftBtn.hidden = true;
    self.rightBtn.hidden = true;
    self.verticalLineView.hidden = true;
    [self.onlyOneBtn setTitle:btnText forState:UIControlStateNormal];
    self.bodyLab.attributedText = context;
    self.titleLab.text = title;
}

- (void)configMutableStringAlert:(NSString *)title body:(NSMutableAttributedString *)context leftBtnTitle:(NSString *)left rightBtnTitle:(NSString *)right {
    self.onlyOneBtn.hidden = true;
    [self.leftBtn setTitle:left forState:UIControlStateNormal];
    [self.rightBtn setTitle:right forState:UIControlStateNormal];
    self.titleLab.text = title;
    self.bodyLab.attributedText = context;
}

@end
