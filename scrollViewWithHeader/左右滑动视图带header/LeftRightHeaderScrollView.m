//
//  LeftRightHeaderScrollView.m
//  approvalsystemforuser
//
//  Created by Emma on 2018/9/29.
//  Copyright © 2018年 Emma. All rights reserved.
//

#import "LeftRightHeaderScrollView.h"

@interface LeftRightHeaderScrollView()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *btnsScrollView;
@property (nonatomic, strong) UIView *btnsContainerView;
@property (nonatomic, strong) UIScrollView *pgsScrollView;
@property (nonatomic, strong) UIView *pgsContainerView;

@property (nonatomic, copy) NSArray<UIButton *> *btnArr;

@end

@implementation LeftRightHeaderScrollView

#pragma mark - 点击滚动条上的按钮
-(void)clickScrollButton:(UIButton *)btn
{
    self.selectBtnTag = btn.tag;
    
}
-(void)highlightButton:(UIButton *)btn unHighlightButtons:(NSArray<UIButton *> *)btns
{
    btn.backgroundColor = [UIColor blueColor];
    [btns enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.backgroundColor = [UIColor grayColor];
    }];
}

-(void)setModels:(NSArray<LeftRightHeaderModel *> *)models
{
    _models = models;
    
    if (models.count > 0) {
        
        self.btnsScrollView = [UIScrollView new];
        self.btnsScrollView.bounces = NO;
        self.btnsScrollView.showsHorizontalScrollIndicator = NO;
        [self.btnsScrollView setScrollEnabled:YES];
        [self addSubview:self.btnsScrollView];
        [self.btnsScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(self);
            make.height.mas_equalTo(50);
        }];
        
        self.btnsContainerView = [UIView new];
        [self.btnsScrollView addSubview:self.btnsContainerView];
        [self.btnsContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.btnsScrollView);
            make.height.equalTo(self.btnsScrollView);
        }];
        
        NSMutableArray<UIButton *> *btnMArr = [NSMutableArray array];
        __block UIView *lastView = nil;
        [models enumerateObjectsUsingBlock:^(LeftRightHeaderModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            UIButton *btn = [UIButton new];
            btn.tag = idx;
            if (idx == 0) {
                btn.backgroundColor = [UIColor blueColor];
            }else{
                btn.backgroundColor = [UIColor grayColor];
            }
            btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
            [btn setTitle:obj.title forState:UIControlStateNormal];
            btn.titleLabel.numberOfLines = 0;
            [btn addTarget:self action:@selector(clickScrollButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.btnsContainerView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_offset(SCREEN_WIDTH/3*idx);
                make.top.bottom.mas_equalTo(self.btnsContainerView);
                make.width.mas_equalTo(SCREEN_WIDTH/3);
            }];
            
            [btnMArr addObject:btn];
            lastView = btn;
        }];
        self.btnArr = btnMArr;
        
        [self.btnsContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(lastView.mas_right);
        }];
        
        self.pgsScrollView = [UIScrollView new];
        self.pgsScrollView.delegate = self;
        self.pgsScrollView.bounces = NO;
        self.pgsScrollView.showsVerticalScrollIndicator = NO;
        self.pgsScrollView.showsHorizontalScrollIndicator = NO;
        self.pgsScrollView.pagingEnabled = YES;
        [self addSubview:self.pgsScrollView];
        [self.pgsScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.btnsContainerView.mas_bottom);
            make.left.right.bottom.mas_equalTo(self);
        }];
        
        self.pgsContainerView = [UIView new];
        [self.pgsScrollView addSubview:self.pgsContainerView];
        [self.pgsContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.pgsScrollView);
            make.height.equalTo(self.pgsScrollView);
        }];
        
        __block UIView *lastPgView = nil;
        [models enumerateObjectsUsingBlock:^(LeftRightHeaderModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [self.pgsContainerView addSubview:obj.view];
            [obj.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_offset(SCREEN_WIDTH*idx);
                make.top.bottom.mas_equalTo(self.pgsContainerView);
                make.width.mas_equalTo(SCREEN_WIDTH);
            }];
            lastPgView = obj.view;
        }];
        
        [self.pgsContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(lastPgView.mas_right);
        }];
    }

}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat idx = scrollView.contentOffset.x/SCREEN_WIDTH;
    if (idx == (NSInteger)idx) {
        self.selectBtnTag = idx;
    }
}

-(void)setSelectBtnTag:(NSInteger)selectBtnTag
{
    _selectBtnTag = selectBtnTag;
    NSMutableArray *btnMArr = [self.btnArr mutableCopy];
    [btnMArr removeObjectAtIndex:selectBtnTag];
    [self highlightButton:self.btnArr[selectBtnTag] unHighlightButtons:btnMArr];
    
    [UIView animateWithDuration:.3 animations:^{
        if (selectBtnTag == 0) {
            self.btnsScrollView.contentOffset = CGPointMake(0, 0);
        }
        else if(selectBtnTag == (self.btnArr.count-1)){
            self.btnsScrollView.contentOffset = CGPointMake(self.btnsScrollView.contentSize.width-SCREEN_WIDTH, 0);
        }
        else{
            self.btnsScrollView.contentOffset = CGPointMake(SCREEN_WIDTH/3*selectBtnTag - SCREEN_WIDTH/3, 0);
        }
    }];
    self.pgsScrollView.contentOffset = CGPointMake(SCREEN_WIDTH*selectBtnTag, 0);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
