//
//  LeftRightHeaderScrollView.h
//  approvalsystemforuser
//
//  Created by Emma on 2018/9/29.
//  Copyright © 2018年 Emma. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LeftRightHeaderModel.h"

@interface LeftRightHeaderScrollView : UIView

@property (nonatomic, assign) NSInteger selectBtnTag;
@property (nonatomic, copy) NSArray<LeftRightHeaderModel *> *models;

@end
