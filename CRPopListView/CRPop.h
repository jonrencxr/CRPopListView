//
//  CRPop.h
//  CRPopListViewDemo
//
//  Created by renchang on 16/8/15.
//  Copyright © 2016年 常宣任. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CRPop : NSObject

/**
 *  将列表和父视图左侧（origin.x）间隙设置为零
 *
 *  @param object UITableView或者UITableViewCell
 */
+ (void)setSeparatorZero:(id)object;


/**
 *  获取当前视图所在的父控制器
 *
 *  @return <#return value description#>
 */
+ (UIViewController *)currentViewController;



@end
