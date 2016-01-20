//
//  HXViewController.m
//  HXEasyCustomShareView
//
//  Created by 黄轩 on 16/1/14.
//  Copyright © 2016年 IT小子. All rights reserved.
//

#import "HXViewController.h"
#import "HXEasyCustomShareView.h"

@interface HXViewController ()

@end

@implementation HXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"简单自定义分享界面";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 100, 200, 100);
    [button setTitle:@"分享" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonAction:(UIButton *)sender {
    NSArray *shareAry = @[@{@"image":@"more_chat",
                            @"highlightedImage":@"more_chat_highlighted",
                            @"title":@"私信和群"},
                          @{@"image":@"more_weixin",
                            @"highlightedImage":@"more_weixin_highlighted",
                            @"title":@"微信好友"},
                          @{@"image":@"more_circlefriends",
                            @"highlightedImage":@"more_circlefriends_highlighted",
                            @"title":@"朋友圈"},
                          @{@"image":@"more_icon_zhifubao",
                            @"highlightedImage":@"more_icon_zhifubao_highlighted",
                            @"title":@"支付宝好友"},
                          @{@"image":@"more_icon_zhifubao_friend",
                            @"highlightedImage":@"more_icon_zhifubao_friend_highlighted",
                            @"title":@"生活圈"},
                          @{@"image":@"more_icon_qq",
                            @"highlightedImage":@"more_icon_qq_highlighted",
                            @"title":@"QQ"},
                          @{@"image":@"more_icon_qzone",
                            @"highlightedImage":@"more_icon_qzone_highlighted",
                            @"title":@"QQ空间"},
                          @{@"image":@"more_mms",
                            @"highlightedImage":@"more_mms_highlighted",
                            @"title":@"短信"},
                          @{@"image":@"more_email",
                            @"highlightedImage":@"more_email_highlighted",
                            @"title":@"邮件分享"},
                          @{@"image":@"more_icon_cardbackground",
                            @"highlightedImage":@"more_icon_cardbackground_highlighted",
                            @"title":@"设卡片背景"},
                          @{@"image":@"more_icon_collection",
                            @"title":@"收藏"},
                          @{@"image":@"more_icon_topline",
                            @"title":@"帮上头条"},
                          @{@"image":@"more_icon_link",
                            @"title":@"复制链接"},
                          @{@"image":@"more_icon_report",
                            @"title":@"举报"},
                          @{@"image":@"more_icon_back",
                            @"title":@"返回首页"}];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGMMainScreenWidth, 36)];
    headerView.backgroundColor = [UIColor colorWithRed:227/255.0 green:227/255.0 blue:223/255.0 alpha:1.0];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 21, headerView.frame.size.width, 15)];
    label.textColor = [UIColor colorWithRed:94/255.0 green:94/255.0 blue:94/255.0 alpha:1.0];;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"分享到";
    [headerView addSubview:label];

    HXEasyCustomShareView *shareView = [[HXEasyCustomShareView alloc] initWithFrame:CGRectMake(0, 0, CGMMainScreenWidth, CGMMainScreenHeight)];
    shareView.headerView = headerView;
    shareView.boderView.frame = CGRectMake(0, 0, shareView.frame.size.width, 107*2);
    shareView.boderView.backgroundColor = [UIColor colorWithRed:227/255.0 green:227/255.0 blue:223/255.0 alpha:1.0];
    shareView.firstCount = 9;
    [shareView setShareAry:shareAry delegate:self];
    [self.navigationController.view addSubview:shareView];
}

#pragma mark HXEasyCustomShareViewDelegate

- (void)easyCustomShareViewButtonAction:(HXEasyCustomShareView *)shareView title:(NSString *)title {
    NSLog(@"当前点击:%@",title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
