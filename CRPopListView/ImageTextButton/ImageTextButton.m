//
//  ImageTextButton.m
//  ButtonMul
//
//  Created by Jonren on 15/12/29.
//  Copyright © 2015年 常宣任. All rights reserved.
//

#import "ImageTextButton.h"

@implementation ImageTextButton

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img title:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:img forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateNormal];
        
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        //default Alignment is in order to facilitate the layout
        [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
                
        _imgTextDistance = 5;
    }
    return self;
}

- (void)setButtonTitleWithImageAlignment:(CRButtonTitleWithImageAlignment)buttonTitleWithImageAlignment {
    _buttonTitleWithImageAlignment = buttonTitleWithImageAlignment;
    [self alignmentValueChanged];
}

- (void)alignmentValueChanged {
    CGFloat buttonWidth = self.frame.size.width;
    CGFloat buttonHeight = self.frame.size.height;
    CGFloat imgWidth = self.imageView.image.size.width;
    CGFloat imgHeight = self.imageView.image.size.height;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGFloat textWitdh = textSize.width;
    CGFloat textHeight = textSize.height;
    
    CGFloat interval;      // distance between the whole image title part and button
    CGFloat imgOffsetX;    // horizontal offset of image
    CGFloat imgOffsetY;    // vertical offset of image
    CGFloat titleOffsetX;  // horizontal offset of title
    CGFloat titleOffsetY;  // vertical offset of title
    
    if (_buttonTitleWithImageAlignment == CRButtonTitleWithImageAlignmentUp) {
        interval = (buttonHeight-(imgHeight+_imgTextDistance+textHeight))/2;
        imgOffsetX = (buttonWidth-imgWidth)/2;
        imgOffsetY = interval;
        titleOffsetX = (buttonWidth-textWitdh)/2-imgWidth;
        titleOffsetY = interval+imgHeight+_imgTextDistance;
    }else if (_buttonTitleWithImageAlignment == CRButtonTitleWithImageAlignmentLeft) {
        interval = (buttonWidth-(imgWidth+_imgTextDistance+textWitdh))/2;
        imgOffsetX = interval;
        imgOffsetY = (buttonHeight-imgHeight)/2;
        titleOffsetX = buttonWidth-(imgWidth+textWitdh+interval);
        titleOffsetY = (buttonHeight-textHeight)/2;
    }else if (_buttonTitleWithImageAlignment == CRButtonTitleWithImageAlignmentDown) {
        interval = (buttonHeight-(imgHeight+_imgTextDistance+textHeight))/2;
        imgOffsetX = (buttonWidth-imgWidth)/2;
        imgOffsetY = interval+textHeight+_imgTextDistance;
        titleOffsetX = (buttonWidth-textWitdh)/2-imgWidth;
        titleOffsetY = interval;
    }else if (_buttonTitleWithImageAlignment == CRButtonTitleWithImageAlignmentRight) {
        interval = (buttonWidth-(imgWidth+_imgTextDistance+textWitdh))/2;
        imgOffsetX = interval+textWitdh+_imgTextDistance;
        imgOffsetY = (buttonHeight-imgHeight)/2;
        titleOffsetX = -(imgWidth-interval);
        titleOffsetY = (buttonHeight-textHeight)/2;
    }else if (_buttonTitleWithImageAlignment == CRButtonTitleWithImageAlignmentRightBothSide) {
        imgOffsetX = buttonWidth-imgWidth;
        imgOffsetY = (buttonHeight-imgHeight)/2;
        titleOffsetX = -imgWidth;
        titleOffsetY = (buttonHeight-textHeight)/2;
    }
    [self setImageEdgeInsets:UIEdgeInsetsMake(imgOffsetY, imgOffsetX, 0, 0)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(titleOffsetY, titleOffsetX, 0, 0)];
}


@end
