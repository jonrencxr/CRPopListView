//
//  ViewController.m
//  CRPopListViewDemo
//
//  Created by renchang on 16/8/15.
//  Copyright © 2016年 常宣任. All rights reserved.
//

#import "ViewController.h"
#import "CRPopListView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *items = @[
                       @"内容1",
                       @"内容2",
                       @"内容3",
                       @"内容4",
                       @"内容5",
                       @"内容6"
                       ];
    CGRect frame = CGRectMake(30, 100, self.view.frame.size.width-60, 40);
    CRPopListView *view = [[CRPopListView alloc] initWithFrame:frame title:@"这是标题" items:items];
    view.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
