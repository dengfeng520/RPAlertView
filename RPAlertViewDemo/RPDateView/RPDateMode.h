//
//  RPDateMode.h
//  CatchU
//
//  Created by 博信科技 on 2019/8/2.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

#ifndef RPDateMode_h
#define RPDateMode_h

// TODO: - 显示位置
typedef NS_ENUM(int, showPosition) {
    center,
    bottom,
};
// TODO: - 显示动画
typedef NS_ENUM(int, animationMode) {
    alphaMode,
    bottomMode,
    pushMode,
    topMode,
};
// TODO: - 是否有阻尼效果
typedef NS_ENUM(int, isDamping) {
    defaultMode,
    dampingMode,
};

#define DEF_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define DEF_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f green:((float)((rgbValue & 0xFF00) >> 8))/255.0f blue:((float)(rgbValue & 0xFF))/255.0f alpha:1.0f]


#endif /* RPDateMode_h */
