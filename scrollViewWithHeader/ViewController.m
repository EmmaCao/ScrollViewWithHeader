//
//  ViewController.m
//  scrollViewWithHeader
//
//  Created by Emma on 2018/10/15.
//  Copyright © 2018年 Emma. All rights reserved.
//

#import "ViewController.h"

#import "LeftRightHeaderScrollView.h"
#import "Test1ViewController.h"

@interface ViewController ()

@property (nonatomic) LeftRightHeaderScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupView];
}

-(void)setupView
{
    Test1ViewController *vc1 = [[Test1ViewController alloc] init];
    //若vc1上有tableview，不添加addChildViewController，会导致滑动的时候tableview消失
    [self addChildViewController:vc1];
    vc1.view.backgroundColor = [UIColor redColor];
    LeftRightHeaderModel *model1 = [LeftRightHeaderModel LeftRightHeaderModelWithTitle:@"test1" view:vc1.view];
    
    Test1ViewController *vc2 = [[Test1ViewController alloc] init];
    //若vc1上有tableview，不添加addChildViewController，会导致滑动的时候tableview消失
    [self addChildViewController:vc2];
    vc2.view.backgroundColor = [UIColor greenColor];
    LeftRightHeaderModel *model2 = [LeftRightHeaderModel LeftRightHeaderModelWithTitle:@"test2" view:vc2.view];
    
    Test1ViewController *vc3 = [[Test1ViewController alloc] init];
    //若vc1上有tableview，不添加addChildViewController，会导致滑动的时候tableview消失
    [self addChildViewController:vc3];
    vc3.view.backgroundColor = [UIColor purpleColor];
    LeftRightHeaderModel *model3 = [LeftRightHeaderModel LeftRightHeaderModelWithTitle:@"test3" view:vc3.view];
    
    Test1ViewController *vc4 = [[Test1ViewController alloc] init];
    //若vc1上有tableview，不添加addChildViewController，会导致滑动的时候tableview消失
    [self addChildViewController:vc4];
    vc4.view.backgroundColor = [UIColor brownColor];
    LeftRightHeaderModel *model4 = [LeftRightHeaderModel LeftRightHeaderModelWithTitle:@"test4" view:vc4.view];
    
    self.scrollView = [[LeftRightHeaderScrollView alloc] init];
    self.scrollView.models = @[model1, model2, model3, model4];
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).mas_offset(64);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
