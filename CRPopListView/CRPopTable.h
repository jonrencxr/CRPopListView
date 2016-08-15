//
//  CRPopTable.h
//  CRPopListViewDemo
//
//  Created by renchang on 16/8/15.
//  Copyright © 2016年 常宣任. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  列表选择回调Block
 *
 *  @param result 选中字符串
 *  @param row    选中行
 */
typedef void(^SelectedResultBlock)(NSString *result, NSInteger row);

/**
 *  给列表所在父视图添加的手势回调
 *
 *  @param taped 用于通知调用者
 */
typedef void(^TapCallBack)(BOOL taped);



@interface CRPopTable : UITableView

@property (nonatomic, copy) SelectedResultBlock selectedResultBlock;
@property (nonatomic, copy) TapCallBack tapCallBack;


- (instancetype)initWithItems:(NSArray *)items selectedResultBlock:(SelectedResultBlock)selectedResultBlock;


/**
 *  显示列表在屏幕中间位置
 */
- (void)show;


/**
 *  显示列表在所用按钮正下方
 *
 *  @param view        所用按钮
 *  @param tapCallBack 手势回调
 */
- (void)showBelowView:(UIView *)view tapCallBack:(TapCallBack)tapCallBack;



@end
