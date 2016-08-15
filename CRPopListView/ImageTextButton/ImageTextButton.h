//
//  ImageTextButton.h
//  ButtonMul
//
//  ImageTextButton is inherited from UIButton, so all the methods of UIButton apply to ImageTextButton
//
//  Created by Jonren on 15/12/29.
//  Copyright © 2015年 常宣任. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, CRButtonTitleWithImageAlignment) {
    CRButtonTitleWithImageAlignmentUp = 0,
    CRButtonTitleWithImageAlignmentLeft,    // image is left, title is right
    CRButtonTitleWithImageAlignmentDown,    // image is down, title is up
    CRButtonTitleWithImageAlignmentRight,
    CRButtonTitleWithImageAlignmentRightBothSide
};


@interface ImageTextButton : UIButton

@property (nonatomic, assign) CGFloat imgTextDistance;  // distance between image and title, default is 5
@property (nonatomic, assign) CRButtonTitleWithImageAlignment buttonTitleWithImageAlignment;  // need to set a value when used

- (CRButtonTitleWithImageAlignment)buttonTitleWithImageAlignment;
- (void)setButtonTitleWithImageAlignment:(CRButtonTitleWithImageAlignment)buttonTitleWithImageAlignment;

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img title:(NSString *)title;


@end
