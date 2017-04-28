//
//  BMScanSettingView.m
//  BMQRBarCode
//
//  Created by ___liangdahong on 16/8/31.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMScanSettingView.h"

@interface BMScanSettingView ()

@property (weak, nonatomic) IBOutlet UIImageView *scanfLinView;

@end

@implementation BMScanSettingView

- (void)setScanfColor:(UIColor *)scanfColor {
    _scanfColor = scanfColor;
}

+ (instancetype)scanSettingView {
    BMScanSettingView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    return view;
}

- (CABasicAnimation *)getAnimation {
    
    // 说明这个动画对象要对CALayer的position属性执行动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    // 动画持续1.5s


    [self layoutIfNeeded];
    
    animation.duration = 1.3333f * (CGRectGetHeight(self.scanfAreaView.frame) / 170.0) + 0.3;
    
    CGRectGetMidY(self.scanfAreaView.frame);
    CGRectGetMaxY(self.scanfAreaView.frame);

    animation.fromValue = @(0);
    animation.toValue   = @(CGRectGetHeight(self.scanfAreaView.frame));
    animation.repeatCount = INT_MAX;

    // 保持动画执行后的状态
    animation.removedOnCompletion = NO;
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}

- (void)startAnimation {
    self.scanfLinView.hidden = NO;
    [self.scanfLinView.layer removeAllAnimations];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.scanfLinView.layer addAnimation:[self getAnimation] forKey:nil];
    });
}

- (void)stopAnimation {
    self.scanfLinView.hidden = YES;
    [self.scanfLinView.layer removeAllAnimations];
}
@end
