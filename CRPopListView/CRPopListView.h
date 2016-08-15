//
//  CRPopListView.h
//  CRPopListViewDemo
//
//  Created by renchang on 16/8/15.
//  Copyright © 2016年 常宣任. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CRPopTable;
@interface CRPopListView : UIView

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *result;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) CRPopTable *table;


/**
 *  可以直接带参数frame、title和items初始化CRSelecListView
 *
 *  @param frame <#frame description#>
 *  @param title <#title description#>
 *  @param items <#items description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title items:(NSArray *)items;


/**
 *  这种方式需要先用initWithFrame初始化CRSelecListView，然后设置title和items参数
 *
 *  @param title <#title description#>
 *  @param items <#items description#>
 */
- (void)setTitle:(NSString *)title items:(NSArray *)items;



@end
