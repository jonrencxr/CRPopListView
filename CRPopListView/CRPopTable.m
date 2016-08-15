//
//  CRPopTable.m
//  CRPopListViewDemo
//
//  Created by renchang on 16/8/15.
//  Copyright © 2016年 常宣任. All rights reserved.
//

#import "CRPopTable.h"
#import "CRPop.h"

#define ScreenHeight [UIScreen mainScreen].bounds.size.height

static CGFloat const CellHeight = 40.0f;  // cell固定高度
static NSString *const CRSelectListCell = @"CRSelectListCell";

@interface CRPopTable () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSArray *items;

@end


@implementation CRPopTable

- (instancetype)initWithItems:(NSArray *)items selectedResultBlock:(SelectedResultBlock)selectedResultBlock {
    self = [super init];
    if (self) {
        _items = items;
        _selectedResultBlock = selectedResultBlock;
        
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.backgroundColor = [UIColor whiteColor];
//        self.showsVerticalScrollIndicator = NO;
        self.rowHeight = CellHeight;
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:CRSelectListCell];
        self.tableFooterView = [UIView new];
    }
    return self;
}


#pragma mark - get
/**
 *  获取列表高度
 *
 *  @return 如果高度小于屏幕就计算所有cell高度和，否则为屏幕高度。
 */
- (CGFloat)height {
    CGFloat wholeHeight = CellHeight * [_items count];
    if (wholeHeight < ScreenHeight) {
        return wholeHeight;
    }
    return ScreenHeight;
}


#pragma mark -

- (void)show {
    UIView *view = [CRPop currentViewController].view;
    [view addSubview:self];
    self.frame = CGRectMake(0, 0, view.frame.size.width, [self height]);
    self.center = view.center;
}

- (void)showBelowView:(UIView *)view tapCallBack:(TapCallBack)tapCallBack {
    _tapCallBack = tapCallBack;
    UIView *parentView = [CRPop currentViewController].view;
    [self addTapTo:parentView];
    [parentView addSubview:self];
    self.frame = CGRectMake(10, CGRectGetMaxY(view.frame), parentView.frame.size.width-20, [self height]);
}

- (void)addTapTo:(UIView *)view {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenTable)];
    tap.delegate = self;
    [view addGestureRecognizer:tap];
}

- (void)hiddenTable {
    if (!self.hidden) {
        _tapCallBack(YES);
    }
}

#pragma mark - Delegate DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"数量：%zd", [_items count]);
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CRSelectListCell];
    cell.textLabel.text = _items[indexPath.row];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [CRPop setSeparatorZero:tableView];
    [CRPop setSeparatorZero:cell];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedResultBlock(_items[indexPath.row], indexPath.row);
    self.hidden = YES;
}


#pragma mark -UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO; // 消除手势和cell点击事件的冲突
    }
    return YES;
}


@end
