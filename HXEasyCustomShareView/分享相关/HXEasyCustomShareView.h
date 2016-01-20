//
//  HXEasyCustomShareView.h
//  HXEasyCustomShareView
//
//  Created by 黄轩 on 16/1/19.
//  Copyright © 2016年 IT小子. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HXEasyCustomShareView;

@protocol HXEasyCustomShareViewDelegate <NSObject>

- (void)easyCustomShareViewButtonAction:(HXEasyCustomShareView *)shareView title:(NSString *)title;

@end

@interface HXEasyCustomShareView : UIView

@property (nonatomic,assign) id<HXEasyCustomShareViewDelegate> delegate;
@property (nonatomic,strong) UIView *headerView;//头部分享标题
@property (nonatomic,strong) UIView *boderView;//中间View,主要放分享
@property (nonatomic,assign) NSInteger firstCount;//第一行分享媒介数量,分享媒介最多显示2行,如果第一行显示了全部则不显示第二行
@property (nonatomic,strong) UIView *footerView;//尾部其他自定义View
@property (nonatomic,strong) UIButton *cancleButton;//取消

- (void)setShareAry:(NSArray *)shareAry delegate:(id)delegate;

@end
