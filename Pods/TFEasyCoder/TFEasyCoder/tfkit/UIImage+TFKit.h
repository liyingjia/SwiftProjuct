//
//  UIImage+TFKit.h
//  TFEasyCoderDemo
//
//  Created by ztf on 16/12/9.
//  Copyright © 2016年 ztf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFEasyCoderConst.h"

@interface UIImage (TFKit)


/**
 *  获取图片
 *  @param name 图片名
 *  @return 图片对象
 */
+(UIImage *)tf_code_pre(imageNamed):(NSString *)name;
/**
 *  从中间拉伸图片
 *  @param image 要拉伸的图片
 *  @return 拉伸后的图片
 */
+(UIImage *)tf_code_pre(resizeImageHalf):(UIImage *)image;
/**
 *  获取图片并拉伸拉伸图片
 *  @param image      图片
 *  @param leftScale 左边拉伸比例 0.0=> && <= 1.0
 *  @param topScale  上边拉伸比例 0.0=> && <= 1.0
 *  @return 图片
 */
+(UIImage *)tf_code_pre(resizeImage):(UIImage *)image leftScale:(CGFloat)leftScale topScale:(CGFloat)topScale;

/**
 *  color 生成 image
 *  @param color 颜色
 *  @return 图片
 */
+(UIImage *)tf_code_pre(imageWithColor):(UIColor *)color;

/**
 * view 生成 image
 *
 * @param view view
 *@return image
 */
+ (UIImage *)tf_code_pre(imageWithView):(UIView *)view;

/**
 *  缩放image,只可以缩小不可以放大
 *  @param size  要缩放后的尺寸
 */
- (UIImage*)tf_code_pre(scaleImageSize):(CGSize)size;


@end
