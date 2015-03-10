#MXActivityViewController
  
## Effect

![](https://github.com/mexiQQ/MXActivityViewController/blob/master/demo.png)
![](https://github.com/mexiQQ/MXActivityViewController/blob/master/demo2.png)

## Features

- 最多支持 3x8 个Activity
- 自适应布局
- icon title 自定义 
- 支持多个条形Button  

###Use

如下所示：

    NSArray *images = @[
      @"Share_Sina",
      @"Share_WeChat",
      @"Share_WeChat_Moments",
      @"Share_QQ",
      @"Share_Evernote",
      @"Share_Pocket",
      @"Share_YoudaoNote",
      @"Share_Copylink",
      @"Share_Email",
      @"Share_Message",
      @"Share_Twitter",
      @"Share_Sina",
      @"Share_WeChat",
      @"Share_WeChat_Moments",
      @"Share_QQ",
      @"Share_Evernote",
      @"Share_Pocket",
      @"Share_YoudaoNote",
      @"Share_Copylink",
      @"Share_Email",
      @"Share_Message",
      @"Share_Twitter"
    ];

    NSArray *titles = @[
      @"新浪微博",
      @"微信好友",
      @"朋友圈",
      @"QQ",
      @"印象笔记",
      @"Pocket",
      @"有道笔记",
      @"复制链接",
      @"电子邮件",
      @"信息",
      @"Twitter",
      @"新浪微博",
      @"微信好友",
      @"朋友圈",
      @"QQ",
      @"印象笔记",
      @"Pocket",
      @"有道笔记",
      @"复制链接",
      @"电子邮件",
      @"信息",
      @"Twitter"
    ];
    [[MXUIActivityWindow shareInstance:images
    title:titles
    buttonTitle:@"举报"
    activityActionBlock:^(int i) {
      NSLog(@"Activity id is %d", i);
    }
    buttonActionBlock:^{
      NSLog(@"it's  here");
    }
    cancelActionBlock:^{
      NSLog(@"it's there");
    }] show];

##Install

####Cocoapods
 
    pod 'MXActivityViewController', '~> 0.0.3'

####Without Cocoapods
  
    like the Demo

## Dependency 

- purelayout ~> 2.0.5

## License

- MIT
