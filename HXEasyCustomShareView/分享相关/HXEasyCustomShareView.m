//
//  HXEasyCustomShareView.m
//  HXEasyCustomShareView
//
//  Created by 黄轩 on 16/1/19.
//  Copyright © 2016年 IT小子. All rights reserved.
//

#import "HXEasyCustomShareView.h"
#import "HXShareScrollView.h"

@implementation HXEasyCustomShareView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIView *zhezhaoView = [[UIView alloc] initWithFrame:frame];
        zhezhaoView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.6];
        zhezhaoView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *myTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizerAction:)];
        [zhezhaoView addGestureRecognizer:myTap];
        [self addSubview:zhezhaoView];
        
        _boderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 200)];
        _boderView.backgroundColor = [UIColor whiteColor];
        _boderView.userInteractionEnabled = YES;
        [self addSubview:_boderView];
        
        _cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancleButton.frame = CGRectMake(0, 0, frame.size.width, 50);
        _cancleButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_cancleButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancleButton setTitleColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] forState:UIControlStateNormal];
        [_cancleButton setBackgroundImage:[self imageWithColor:[UIColor whiteColor] size:CGSizeMake(1.0, 1.0)] forState:UIControlStateNormal];
        [_cancleButton setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0] size:CGSizeMake(1.0, 1.0)] forState:UIControlStateHighlighted];
        [_cancleButton addTarget:self action:@selector(cancleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cancleButton];
    }
    return self;
}

-(void)setHeaderView:(UIView *)headerView {
    [_headerView removeFromSuperview];
    _headerView = headerView;
    [self addSubview:_headerView];
}

-(void)setFooterView:(UIView *)footerView {
    [_footerView removeFromSuperview];
    _footerView = footerView;
    [self addSubview:_footerView];
}

- (void)setShareAry:(NSArray *)shareAry delegate:(id)delegate {
    _delegate = delegate;
    
    if (_firstCount > shareAry.count || _firstCount == 0) {
        _firstCount = shareAry.count;
    }

    NSArray *ary1 = [shareAry subarrayWithRange:NSMakeRange(0,_firstCount)];
    NSArray *ary2 = [shareAry subarrayWithRange:NSMakeRange(_firstCount,shareAry.count-_firstCount)];

    HXShareScrollView *shareScrollView = [[HXShareScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 107)];
    [shareScrollView setShareAry:ary1 delegate:self];
    [_boderView addSubview:shareScrollView];
    
    if (_firstCount < shareAry.count) {
        //分割线
        UIImageView *bottomLineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, shareScrollView.frame.origin.y+shareScrollView.frame.size.height, self.frame.size.width, 1)];
        bottomLineImageView.backgroundColor = [UIColor clearColor];
        bottomLineImageView.image = [self imageWithColor:[UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1.0] size:CGSizeMake(1.0, 1.0)];
        [_boderView addSubview:bottomLineImageView];
        
        shareScrollView = [[HXShareScrollView alloc] initWithFrame:CGRectMake(0, bottomLineImageView.frame.origin.y+bottomLineImageView.frame.size.height, self.frame.size.width, 107)];
        [shareScrollView setShareAry:ary2 delegate:self];
        [_boderView addSubview:shareScrollView];
    }
}

#pragma mark HXShareScrollViewDelegate

- (void)shareScrollViewButtonAction:(HXShareScrollView *)shareScrollView title:(NSString *)title {
    if (_delegate && [_delegate respondsToSelector:@selector(easyCustomShareViewButtonAction:title:)]) {
        [_delegate easyCustomShareViewButtonAction:self title:title];
    }
}

- (void)cancleButtonAction:(UIButton *)sender {
    NSLog(@"取消");
    [self tappedCancel];
}

- (void)tapGestureRecognizerAction:(UITapGestureRecognizer *)sender {
    [self tappedCancel];
}

- (void)tappedCancel {
    [self removeFromSuperview];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    float height = 0;
    
    if (_cancleButton) {
        height += _cancleButton.frame.size.height;
        _cancleButton.frame = CGRectMake(0, self.frame.size.height-height, _cancleButton.frame.size.width, _cancleButton.frame.size.height);
    }
    
    if (_footerView) {
        height += _footerView.frame.size.height;
        _footerView.frame = CGRectMake(0, self.frame.size.height-height, _footerView.frame.size.width, _footerView.frame.size.height);
    }
    
    if (_boderView) {
        height += _boderView.frame.size.height;
        _boderView.frame = CGRectMake(0, self.frame.size.height-height, _boderView.frame.size.width, _boderView.frame.size.height);
    }
    
    if (_headerView) {
        height += _headerView.frame.size.height;
        _headerView.frame = CGRectMake(0, self.frame.size.height-height, _headerView.frame.size.width, _headerView.frame.size.height);
    }
}
         
//颜色生成图片方法
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
 CGRect rect = CGRectMake(0, 0, size.width, size.height);
 
 UIGraphicsBeginImageContext(rect.size);
 
 CGContextRef context = UIGraphicsGetCurrentContext();
 
 CGContextSetFillColorWithColor(context,
                                
                                color.CGColor);
 CGContextFillRect(context, rect);
 UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
 UIGraphicsEndImageContext();
 
 return img;
}

@end
