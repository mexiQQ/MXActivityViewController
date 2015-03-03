##MXActivityViewController
  
### Effect

![](https://github.com/mexiQQ/MXActivityViewController/blob/master/demo.png)
![](https://github.com/mexiQQ/MXActivityViewController/blob/master/demo2.png)

### Features

- 最多支持 3x8 个Activity
- 自适应布局
- icon title 自定义 

###Use

如下所示：

    - (IBAction)shareAction:(id)sender {
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
        @"Twitter"
      ];
      [[MXUIActivityWindow shareInstance:images
                                   title:titles
                     activityActionBlock:nil] show];
    }


###State

完善中，此版本尚未提供 Activity 点击事件处理，需要自己修改。
 
### Dependency 

- purelayout ~> 2.0.5

### License

- MIT
