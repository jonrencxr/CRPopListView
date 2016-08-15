//
//  CRPopListView.m
//  CRPopListViewDemo
//
//  Created by renchang on 16/8/15.
//  Copyright © 2016年 常宣任. All rights reserved.
//

#import "CRPopListView.h"
#import "CRPopTable.h"
#import "ImageTextButton.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width


@implementation CRPopListView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title items:(NSArray *)items {
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:title items:items];
    }
    return self;
}

- (void)setTitle:(NSString *)title items:(NSArray *)items {
    _items = items;
    _result = title;
    
    ImageTextButton *button = [[ImageTextButton alloc] initWithFrame:self.bounds image:[UIImage imageNamed:@"select_down.png"] title:title];
    [button setImgTextDistance:150];
    [button setButtonTitleWithImageAlignment:CRButtonTitleWithImageAlignmentRightBothSide];
    [button setImage:[UIImage imageNamed:@"select_up.png"] forState:UIControlStateSelected];
    button.backgroundColor = [UIColor clearColor];
    button.selected = NO;
    [button addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}


#pragma mark - Action

- (void)select:(ImageTextButton *)sender {
    if (!sender.selected) {
        sender.selected = YES;
        _table = [[CRPopTable alloc] initWithItems:_items selectedResultBlock:^(NSString *result, NSInteger row) {
            [sender setTitle:result forState:UIControlStateNormal];
            sender.selected = NO;
            _result = result;
            _selectedIndex = row;
            _table.hidden = YES;
        }];
        [_table showBelowView:self tapCallBack:^(BOOL taped) {
            if (taped) {
                sender.selected = NO;
                _table.hidden = YES;
            }
        }];
    }else {
        sender.selected = NO;
        _table.hidden = YES;
    }
}



@end

