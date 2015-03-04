//
//  ViewController.m
//  MXActivityViewControllerDemo
//
//  Created by MexiQQ on 15/3/2.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

#import "ViewController.h"
#import "MXUIActivityWindow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

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
      }] show];
}
@end
