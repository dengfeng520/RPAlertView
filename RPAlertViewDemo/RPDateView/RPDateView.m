//
//  RPDateView.m
//  CatchU
//
//  Created by 博信科技 on 2019/8/6.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

#import "RPDateView.h"
#import "RPDateView+Extension.h"

@interface RPDateView ()

@property (assign, nonatomic) animationMode mode;
@property (assign, nonatomic) showPosition position;

@end

@implementation RPDateView

- (instancetype)initWithFrame:(CGRect)frame withPosition:(showPosition)position {
    self = [super initWithFrame:frame];
    if (self) {
        self.position = position;
        //背景色
        self.backgroundColor = [UIColor colorWithWhite:.3 alpha:.5];
        [self configData];
        [self configUI];
        self.hidden = true;
    }
    return self;
}
// MARK: - configData
- (void)configData {
    self.firstTimeLoad = YES;
    NSDate *date = [NSDate date];
    // Get Current Year
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY"];
    NSString *currentYearString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    // Get Current  Month
    [formatter setDateFormat:@"MM"];
    NSString *currentMonthString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    // Get Current  days
    [formatter setDateFormat:@"dd"];
    NSString *currentDayString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    // Get Current  hour
    [formatter setDateFormat:@"HH"];
    NSString *currentHourString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    // Get Current  min
    [formatter setDateFormat:@"mm"];
    NSString *currentMinString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    
    
    self.currentMonthString = [NSString stringWithFormat:@"%ld",(long)[[formatter stringFromDate:date]integerValue]];
    self.currentMonth = [self.currentMonthString intValue];
    
    // Get Current  Date
    // PickerView -  Years data
    for (int y = 2019; y <= 2020 ; y++) {
        [self.yearArray addObject:[NSString stringWithFormat:@"%d",y]];
    }
    // PickerView - Default Selection as per current Date
    [self.customPicker selectRow:[self.yearArray indexOfObject:currentYearString] inComponent:0 animated:YES];
    // PickerView -  Months data
    self.monthArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];
    [self.customPicker selectRow:[self.monthArray indexOfObject:currentMonthString] inComponent:1 animated:YES];
    // PickerView -  days data
    for (int d = 1; d <= 31; d++) {
        [self.daysArray addObject:[NSString stringWithFormat:@"%d",d]];
    }
    [self.customPicker selectRow:[self.daysArray indexOfObject:currentDayString] inComponent:2 animated:YES];
    // PickerView -  hour data
    for (int h = 1; h <= 24; h++) {
        [self.hourArray addObject:[NSString stringWithFormat:@"%d",h]];
    }
    [self.customPicker selectRow:[self.hourArray indexOfObject:currentHourString] inComponent:3 animated:YES];
    // PickerView -  min data
    for (int m = 1; m  <= 60; m++) {
        [self.minuteArray addObject:[NSString stringWithFormat:@"%d",m]];
    }
    [self.customPicker selectRow:[self.minuteArray indexOfObject:currentMinString] inComponent:4 animated:YES];
}

// MARK: - config UI
- (void)configUI {
    //添加Touch手势，隐藏视图
    UITapGestureRecognizer  *tapRecognizer = [[UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(tanpFromTimeView:)];
    tapRecognizer.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapRecognizer];
    
    
    if ([self isiPhoneX] == true && self.mode == bottom) {
        UIView *bottomView = [[UIView alloc] init];
        [self addSubview:bottomView];
        bottomView.backgroundColor = UIColor.whiteColor;
        bottomView.translatesAutoresizingMaskIntoConstraints = false;
        [[bottomView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0] setActive:true];
        [[bottomView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:0] setActive:true];
        [[bottomView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:0] setActive:true];
        [[bottomView.heightAnchor constraintEqualToConstant:120] setActive:true];
    }
    
    //pickview
    self.customPicker = [[UIPickerView alloc] init];
    [self addSubview:self.customPicker];
    self.customPicker.backgroundColor = [UIColor whiteColor];
    self.customPicker.delegate = self;
    self.customPicker.dataSource = self;
    self.customPicker.translatesAutoresizingMaskIntoConstraints = false;
    [[self.customPicker.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:0] setActive:true];
    [[self.customPicker.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:0] setActive:true];
    if (self.position == center) {
        [[self.customPicker.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:0] setActive:true];
    } else {
        if (@available(iOS 11.0, *)) {
            [[self.customPicker.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor constant:0] setActive:true];
        } else {
            [[self.customPicker.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0] setActive:true];
        }
    }
    [[self.customPicker.heightAnchor constraintEqualToConstant:200] setActive:true];
    
    [self configToolViewUI];
}

- (void)configToolViewUI {
    //上面的蓝色view
    self.toolView = [[UIView alloc] init];
    [self addSubview:self.toolView];
    self.toolView.backgroundColor = [UIColor whiteColor];
    self.toolView.translatesAutoresizingMaskIntoConstraints = false;
    [[self.toolView.bottomAnchor constraintEqualToAnchor:self.customPicker.topAnchor constant:0] setActive:true];
    [[self.toolView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:0] setActive:true];
    [[self.toolView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:0] setActive:true];
    [[self.toolView.heightAnchor constraintEqualToConstant:50] setActive:true];
    
    //左边取消按钮
    self.leftBtn = [[UIButton alloc] init];
    [self.toolView addSubview:self.leftBtn];
    self.leftBtn.translatesAutoresizingMaskIntoConstraints = false;
    [[self.leftBtn.leftAnchor constraintEqualToAnchor:self.toolView.leftAnchor constant:12] setActive:true];
    [[self.leftBtn.heightAnchor constraintEqualToConstant:44] setActive:true];
    [[self.leftBtn.widthAnchor constraintEqualToConstant:120] setActive:true];
    [[self.leftBtn.centerYAnchor constraintEqualToAnchor:self.toolView.centerYAnchor constant:0] setActive:true];
    [self.leftBtn addTarget:self action:@selector(actionCancelClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.leftBtn setTitleColor:UIColorFromRGB(0x51A6FF) forState:UIControlStateNormal];
    [self.leftBtn setTitle:@"取消" forState:UIControlStateNormal];
    
    //右边确定按钮
    self.rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 120, 0, 120, 44)];
    [self.toolView addSubview:self.rightBtn];
    self.rightBtn.translatesAutoresizingMaskIntoConstraints = false;
    [[self.rightBtn.rightAnchor constraintEqualToAnchor:self.toolView.rightAnchor constant:-12] setActive:true];
    [[self.rightBtn.heightAnchor constraintEqualToConstant:44] setActive:true];
    [[self.rightBtn.widthAnchor constraintEqualToConstant:120] setActive:true];
    [[self.rightBtn.centerYAnchor constraintEqualToAnchor:self.toolView.centerYAnchor constant:0] setActive:true];
    [self.rightBtn addTarget:self action:@selector(actionDoneClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightBtn setTitleColor:UIColorFromRGB(0x51A6FF) forState:UIControlStateNormal];
    [self.rightBtn setTitle:@"确定" forState:UIControlStateNormal];
    
    self.dateLab = [[UILabel alloc] init];
    [self.toolView addSubview:self.dateLab];
    self.dateLab.textColor = UIColorFromRGB(0x51A6FF);
    self.dateLab.font = [UIFont systemFontOfSize:14];
    self.dateLab.textAlignment = NSTextAlignmentCenter;
    self.dateLab.translatesAutoresizingMaskIntoConstraints = false;
    [[self.dateLab.centerXAnchor constraintEqualToAnchor:self.toolView.centerXAnchor constant:0] setActive:true];
    [[self.dateLab.centerYAnchor constraintEqualToAnchor:self.toolView.centerYAnchor constant:0] setActive:true];
    [[self.dateLab.heightAnchor constraintEqualToConstant:16] setActive:true];
    [[self.dateLab.widthAnchor constraintGreaterThanOrEqualToConstant:60] setActive:true];
    
    //分割线
    UIView *lineView = [[UIView alloc]init];
    [self.toolView addSubview:lineView];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    lineView.translatesAutoresizingMaskIntoConstraints = false;
    [[lineView.bottomAnchor constraintEqualToAnchor:self.toolView.bottomAnchor constant:0] setActive:true];
    [[lineView.leftAnchor constraintEqualToAnchor:self.toolView.leftAnchor constant:0] setActive:true];
    [[lineView.rightAnchor constraintEqualToAnchor:self.toolView.rightAnchor constant:0] setActive:true];
    [[lineView.heightAnchor constraintEqualToConstant:1.5] setActive:true];
}

// MARK: - UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.selectedYearRow = row;
        [self.customPicker reloadAllComponents];
    } else if (component == 1) {
        self.selectedMonthRow = row;
        [self.customPicker reloadAllComponents];
    } else if (component == 2) {
        self.selectedDayRow = row;
        [self.customPicker reloadAllComponents];
    } else if (component == 3) {
        self.selectedHourRow = row;
        [self.customPicker reloadAllComponents];
    } else {
        self.selectedMinuteRow = row;
        [self.customPicker reloadAllComponents];
    }
    switch ([self.datasource itemforNumberWithPickView]) {
        case 1: {
            self.dateLab.text = [NSString stringWithFormat:@"%@",self.yearArray[row]];
        }
            break;
        case 2: {
            self.dateLab.text = [NSString stringWithFormat:@"%@-%@",self.yearArray[self.selectedYearRow],self.monthArray[self.selectedMonthRow]];
        }
            break;
        case 3: {
            self.dateLab.text = [NSString stringWithFormat:@"%@-%@-%@",self.yearArray[self.selectedYearRow],self.monthArray[self.selectedMonthRow],self.daysArray[self.selectedDayRow]];
        }
            break;
        case 4: {
            self.dateLab.text = [NSString stringWithFormat:@"%@-%@-%@ %@",self.yearArray[self.selectedYearRow],self.monthArray[self.selectedMonthRow],self.daysArray[self.selectedDayRow],self.hourArray[self.selectedHourRow]];
        }
            break;
        default: {
            self.dateLab.text = [NSString stringWithFormat:@"%@-%@-%@ %@:%@",self.yearArray[self.selectedYearRow],self.monthArray[self.selectedMonthRow],self.daysArray[self.selectedDayRow],self.hourArray[self.selectedHourRow],self.minuteArray[self.selectedMinuteRow]];
        }
            break;
    }
}

// MARK: - UIPickerViewDatasource
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component  reusingView:(UIView *)view {
    // Custom View created for each component
    UILabel *pickerLabel = (UILabel *)view;
    if (pickerLabel == nil) {
        CGRect frame = CGRectMake(0.0, 0.0, 50, 60);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:15.0f]];
    }
    if (component == 0) {
        pickerLabel.text =  [self.yearArray objectAtIndex:row]; // Year
    } else if (component == 1) {
        pickerLabel.text =  [self.monthArray objectAtIndex:row];  // Month
    } else if (component == 2) {
        pickerLabel.text =  [self.daysArray objectAtIndex:row];
    } else if (component == 3) {
        pickerLabel.text =  [self.hourArray objectAtIndex:row];
    } else if (component == 4) {
        pickerLabel.text =  [self.minuteArray objectAtIndex:row];
    }
    return pickerLabel;
}

- (void)setDatasource:(id<RPDateViewDatasource>)datasource {
    _datasource = datasource;
    if ([self.datasource respondsToSelector:@selector(itemforNumberWithPickView)] && [self.datasource itemforNumberWithPickView]) {
        [self.customPicker reloadAllComponents];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    NSInteger cellNumber = 0;
    if ([self.datasource respondsToSelector:@selector(itemforNumberWithPickView)]) {
        cellNumber = [self.datasource itemforNumberWithPickView];
    }
    if (cellNumber == 0) {
        cellNumber = 3;
    }
    return cellNumber;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [self.yearArray count];
    } else if (component == 1) {
        return [self.monthArray count];
    } else if (component == 2) {
        if (self.firstTimeLoad) {
            self.firstTimeLoad = NO;
            if (self.currentMonth == 1 || self.currentMonth == 3 || self.currentMonth == 5 || self.currentMonth == 7 || self.currentMonth == 8 || self.currentMonth == 10 || self.currentMonth == 12) {
                return 31;
            } else if (self.currentMonth == 2) {
                int yearint = [[self.yearArray objectAtIndex:self.selectedYearRow]intValue ];
                if(((yearint %4== 0)&&(yearint % 100 != 0))||(yearint %400 == 0)){
                    return 29;
                } else {
                    return 28;
                }
            } else {
                return 30;
            }
        } else {
            if (self.selectedMonthRow == 0 || self.selectedMonthRow == 2 || self.selectedMonthRow == 4 || self.selectedMonthRow == 6 || self.selectedMonthRow == 7 || self.selectedMonthRow == 9 || self.selectedMonthRow == 11) {
                return 31;
            } else if (self.selectedMonthRow == 1) {
                int yearint = [[self.yearArray objectAtIndex:self.selectedYearRow]intValue ];
                if (((yearint %4 == 0)&&(yearint %100 != 0))||(yearint %400 == 0)) {
                    return 29;
                } else {
                    return 28; // or return 29
                }
            } else {
                return 30;
            }
        }
    } else if (component == 3) {
        return 24;
    } else {
        return 60;
    }
}

// MARK: - fetchDateDelegate
- (void)actionDoneClick:(id)sender {
    NSString *timeStr = [[NSString alloc] init];
    NSInteger itemNumber = [self.datasource itemforNumberWithPickView];
    NSString *yearStr = [self.yearArray objectAtIndex:[self.customPicker selectedRowInComponent:0]];
    switch (itemNumber) {
        case 1: {
            timeStr = [NSString stringWithFormat:@"%@",yearStr];
        }
            break;
        case 2: {
            int monthtime = [[self.monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]] intValue];
            NSString *monTi = [NSString stringWithFormat:@"%02d",monthtime];
            timeStr = [NSString stringWithFormat:@"%@-%@",yearStr,monTi];
        }
            break;
        case 3: {
            int monthtime = [[self.monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]] intValue];
            NSString *monTi = [NSString stringWithFormat:@"%02d",monthtime];
            NSString *dayStr =  [NSString stringWithFormat:@"%02d",[[self.daysArray objectAtIndex:[self.customPicker selectedRowInComponent:2]] intValue]];
            timeStr = [NSString stringWithFormat:@"%@-%@-%@",yearStr,monTi,dayStr];
        }
            break;
        case 4: {
            int monthtime = [[self.monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]] intValue];
            NSString *monTi = [NSString stringWithFormat:@"%02d",monthtime];
            NSString *dayStr = [NSString stringWithFormat:@"%02d",[[self.daysArray objectAtIndex:[self.customPicker selectedRowInComponent:2]] intValue]];
            NSString *hourStr = [NSString stringWithFormat:@"%02d",[[self.hourArray objectAtIndex:[self.customPicker selectedRowInComponent:3]] intValue]];
            timeStr = [NSString stringWithFormat:@"%@-%@-%@ %@",yearStr,monTi,dayStr,hourStr];
        }
            break;
        case 5: {
            int monthtime = [[self.monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]] intValue];
            NSString *monTi = [NSString stringWithFormat:@"%02d",monthtime];
            NSString *dayStr = [NSString stringWithFormat:@"%02d",[[self.daysArray objectAtIndex:[self.customPicker selectedRowInComponent:2]] intValue]];
            NSString *hourStr = [NSString stringWithFormat:@"%02d",[[self.hourArray objectAtIndex:[self.customPicker selectedRowInComponent:3]] intValue]];
            NSString *minStr = [NSString stringWithFormat:@"%02d",[[self.minuteArray objectAtIndex:[self.customPicker selectedRowInComponent:4]] intValue]];
            timeStr = [NSString stringWithFormat:@"%@-%@-%@ %@:%@",yearStr,monTi,dayStr,hourStr,minStr];
        }
            break;
        default:
            break;
    }
    if (self.fetchCurrentDateBlocks) {
        self.fetchCurrentDateBlocks(timeStr);
    }
}

//取消
- (void)actionCancelClick:(UIButton *)sender {
    if (self.fetchCurrentDateBlocks) {
        self.fetchCurrentDateBlocks(@"");
    }
}

//点击背景隐藏
- (void)tanpFromTimeView:(UITapGestureRecognizer*)recognizer {
    if (self.fetchCurrentDateBlocks) {
        self.fetchCurrentDateBlocks(@"");
    }
}

// MARK: - lazy data
- (NSMutableArray *)yearArray {
    if (_yearArray == nil) {
        _yearArray = [NSMutableArray array];
    }
    return _yearArray;
}

- (NSArray *)monthArray {
    if (_monthArray == nil) {
        _monthArray = [NSArray array];
    }
    return _monthArray;
}

- (NSMutableArray *)daysArray {
    if (_daysArray == nil) {
        _daysArray = [NSMutableArray array];
    }
    return  _daysArray;
}

- (NSMutableArray *)hourArray {
    if (_hourArray == nil) {
        _hourArray = [NSMutableArray array];
    }
    return _hourArray;
}

- (NSMutableArray *)minuteArray {
    if (_minuteArray == nil) {
        _minuteArray = [NSMutableArray array];
    }
    return _minuteArray;
}
// MARK: -  show Animation
- (void)showDateViewAnimationWithMode:(animationMode)mode {
    self.mode = mode;
    switch (mode) {
        case alphaMode: {
            [self showAnimationWithAlphaMode];
        }
            break;
        case pushMode: {
            [self showAnimaationWithPushMode];
        }
            break;
        case bottomMode: {
            [self showAnimationWithBottomMode];
        }
            break;
        case topMode: {
            [self showAnimationWithTopMode];
        }
            break;
        default:
            break;
    }
}

// alphaMode
- (void)showAnimationWithAlphaMode {
    self.hidden = false;
    self.alpha = 0.1;
    __weak typeof (self) weakSelf = self;
    [UIView animateWithDuration:0.35 animations:^{
        weakSelf.alpha = 1;
    } completion:nil];
}
// pushMode
- (void)showAnimaationWithPushMode {
    __weak typeof (self) weakSelf = self;
    self.frame = CGRectMake(-DEF_SCREEN_WIDTH, 0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT);
    self.hidden = false;
    [UIView animateWithDuration:0.35 animations:^{
        [weakSelf setFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT)];
    } completion:nil];
}
// bottomMode
- (void)showAnimationWithBottomMode {
    __weak typeof (self) weakSelf = self;
    self.frame = CGRectMake(DEF_SCREEN_HEIGHT, 0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT);
    self.hidden = false;
    [UIView animateWithDuration:0.35 animations:^{
        [weakSelf setFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT)];
    } completion:nil];
}
// topMode
- (void)showAnimationWithTopMode {
    __weak typeof (self) weakSelf = self;
    self.frame = CGRectMake(-DEF_SCREEN_HEIGHT, 0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT);
    self.hidden = false;
    [UIView animateWithDuration:0.35 animations:^{
        [weakSelf setFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT)];
    } completion:nil];
}
// MARK: - hidden Animation
- (void)hiddenDateViewAboutAnimation:(void (^)(void))amimationFinished {
    switch (self.mode) {
        case alphaMode: {
            [self hiddenAnimationWithAlphaMode:^{
                amimationFinished();
            }];
        }
            break;
        case pushMode: {
            [self hiddenAnimaationWithPushMode:^{
                amimationFinished();
            }];
        }
            break;
        case bottomMode: {
            [self hiddenAnimationWithBottomMode:^{
                amimationFinished();
            }];
        }
            break;
        case topMode: {
            [self hiddenAnimationWithTopMode:^{
                amimationFinished();
            }];
        }
            break;
        default:
            break;
    }
}
// alphaMode
- (void)hiddenAnimationWithAlphaMode:(void (^)(void))amimationFinished {
    self.alpha = 1;
    __weak typeof (self) weakSelf = self;
    [UIView animateWithDuration:0.35 animations:^{
        weakSelf.alpha = 0.1;
    } completion:^(BOOL finished) {
        amimationFinished();
    }];
}
// pushMode
- (void)hiddenAnimaationWithPushMode:(void (^)(void))amimationFinished {
    __weak typeof (self) weakSelf = self;
    [UIView animateWithDuration:0.35 animations:^{
        weakSelf.frame = CGRectMake(DEF_SCREEN_WIDTH, 0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        amimationFinished();
    }];
}
// bottomMode
- (void)hiddenAnimationWithBottomMode:(void (^)(void))amimationFinished {
    __weak typeof (self) weakSelf = self;
    [UIView animateWithDuration:0.35 animations:^{
        weakSelf.frame = CGRectMake(DEF_SCREEN_HEIGHT, 0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        amimationFinished();
    }];
}
// topMode
- (void)hiddenAnimationWithTopMode:(void (^)(void))amimationFinished {
    __weak typeof (self) weakSelf = self;
    [UIView animateWithDuration:0.35 animations:^{
        weakSelf.frame = CGRectMake(-DEF_SCREEN_HEIGHT, 0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        amimationFinished();
    }];
}

- (void)dealloc {
    NSLog(@"======================内存释放222222");
}

- (BOOL)isiPhoneX {
    if (@available(iOS 11.0, *)) {
        UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
        CGFloat bottomSafeInset = keyWindow.safeAreaInsets.bottom;
        if (bottomSafeInset == 34 || bottomSafeInset == 21) {
            return true;
        }
    }
    return false;
}
@end
