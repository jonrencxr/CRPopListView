//
//  CRPop.m
//  CRPopListViewDemo
//
//  Created by renchang on 16/8/15.
//  Copyright © 2016年 常宣任. All rights reserved.
//

#import "CRPop.h"

@implementation CRPop

+ (void)setSeparatorZero:(id)object {
    if ([object respondsToSelector:@selector(setSeparatorInset:)]) {
        [object setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([object respondsToSelector:@selector(setLayoutMargins:)]) {
        [object setLayoutMargins:UIEdgeInsetsZero];
    }
}

+ (UIViewController *)currentViewController {
    UIViewController *result = nil;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    }else {
        result = window.rootViewController;
    }
    return result;
}


@end
