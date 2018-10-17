//
//  LeftRightHeaderModel.h
//  approvalsystemforuser
//
//  Created by Emma on 2018/9/29.
//  Copyright © 2018年 Emma. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface LeftRightHeaderModel : NSObject

/** 为对应按钮赋值 */
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIView *view;

+(instancetype)LeftRightHeaderModelWithTitle:(NSString *)title view:(UIView *)view;

@end
