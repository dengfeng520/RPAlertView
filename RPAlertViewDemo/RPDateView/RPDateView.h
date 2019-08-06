//
//  RPDateView.h
//  CatchU
//
//  Created by 博信科技 on 2019/8/6.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPDateMode.h"
#import "RPDateViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface RPDateView : UIView

@property (weak, nonatomic) id <RPDateViewDatasource> datasource;

@property (copy, nonatomic) void(^fetchCurrentDateBlocks)(NSString *timeString);

- (instancetype)initWithFrame:(CGRect)frame withPosition:(showPosition)position;
- (void)showDateViewAnimationWithMode:(animationMode)mode;
- (void)hiddenDateViewAboutAnimation:(void (^)(void))amimationFinished;

@end

NS_ASSUME_NONNULL_END
