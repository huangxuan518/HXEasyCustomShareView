# HXEasyCustomShareView
最近闲来无事,想做些东西,一直都下不了决心去做,前不久写的一个开源的标签控件有不少同学点赞,这给我继续写一些开源的东西提供了更大的动力,分享对于每个项目而言是必不可少的,但是如果自己写多少也需要花费一些时间,尤其是各种适配算法.于是我收集了目前比较牛B的APP的分享界面,写了一套比较通用的分享开源类HXEasyCustomShareView,名字的意思是简单自定义分享.希望可以给你省去一些时间,如果你觉得对你多少有点帮助,希望给我点个赞,你的支持是对我的最大鼓励!

# 效果图
![image](https://github.com/huangxuan518/HXEasyCustomShareView/blob/master/HXEasyCustomShareView/xiaoguo.gif)

# 通用原理
![image](https://github.com/huangxuan518/HXEasyCustomShareView/blob/master/HXEasyCustomShareView/shuoming1.png)

见上图,我将分享界面划分为4块,headerView(头部) boderView(身体) footerView(尾部)以及cancleButton(取消),默认boderView和cancleButton是有的,其他的如果你不设置是不会有的.
这样的划分就可以是HXEasyCustomShareView可以满足大部分的分享界面,headerView和footerView可以你自定义,对于boderView里面的分享间的各项间隔参数你可以通过修改宏来修改.宏在HXEasyCustomShareView.h里面,修改起来很方便,因为一个工程里面只有一套分享的UI界面,所以用宏来控制就可以了.

# 代码示例
  //数据源,数组里面放每个分享数据字典,字典里面包含图片,高亮图片以及标题
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
    
    //自定义头部
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGMMainScreenWidth, 36)];
    headerView.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 21, headerView.frame.size.width-32, 15)];
    label.textColor = [UIColor colorWithRed:94/255.0 green:94/255.0 blue:94/255.0 alpha:1.0];;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"分享到";
    [headerView addSubview:label];
    
    HXEasyCustomShareView *shareView = [[HXEasyCustomShareView alloc] initWithFrame:CGRectMake(0, 0, CGMMainScreenWidth,     CGMMainScreenHeight)];
    shareView.headerView = headerView;
    //计算高度 根据第一行显示的数量和总数,可以确定显示一行还是两行,最多显示2行
    float height = [shareView getBoderViewHeight:shareAry firstCount:9];
    shareView.boderView.frame = CGRectMake(0, 0, shareView.frame.size.width, height);
    [shareView setShareAry:shareAry delegate:self];
    [self.navigationController.view addSubview:shareView];
    
  #pragma mark HXEasyCustomShareViewDelegate
  - (void)easyCustomShareViewButtonAction:(HXEasyCustomShareView *)shareView title:(NSString *)title {
     NSLog(@"当前点击:%@",title);
  }

# 博客交流

http://blog.libuqing.com/
