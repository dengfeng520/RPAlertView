//
//  RPDateView+Extension.h
//  CatchU
//
//  Created by 博信科技 on 2019/8/6.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

#import "RPDateView.h"

NS_ASSUME_NONNULL_BEGIN

@interface RPDateView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (assign, nonatomic) BOOL firstTimeLoad;
@property (assign, nonatomic) NSInteger currentMonth;
@property (strong, nonatomic) UIPickerView *customPicker;
@property (strong, nonatomic) UIView *toolView;
@property (strong, nonatomic) UIButton *leftBtn;

@property (strong, nonatomic) UIButton *rightBtn;

@property (strong, nonatomic) UILabel *dateLab;

@property (strong, nonatomic) NSString *currentMonthString;

@property (strong, nonatomic) NSMutableArray *yearArray;

@property (strong, nonatomic) NSArray *monthArray;

@property (strong, nonatomic) NSMutableArray *daysArray;

@property (strong, nonatomic) NSMutableArray *hourArray;

@property (strong, nonatomic) NSMutableArray *minuteArray;

@property (assign, nonatomic) NSInteger selectedYearRow;

@property (assign, nonatomic) NSInteger selectedMonthRow;

@property (assign, nonatomic) NSInteger selectedDayRow;

@property (assign, nonatomic) NSInteger selectedHourRow;

@property (assign, nonatomic) NSInteger selectedMinuteRow;
@end

NS_ASSUME_NONNULL_END
