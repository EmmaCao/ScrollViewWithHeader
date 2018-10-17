//
//  LeftRightHeaderModel.m
//  approvalsystemforuser
//
//  Created by Emma on 2018/9/29.
//  Copyright © 2018年 Emma. All rights reserved.
//

#import "LeftRightHeaderModel.h"

@implementation LeftRightHeaderModel

+(instancetype)LeftRightHeaderModelWithTitle:(NSString *)title view:(UIView *)view
{
    LeftRightHeaderModel *model = [LeftRightHeaderModel new];
    model.title = title;
    model.view = view;
    return model;
}

@end
