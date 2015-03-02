//
//  MXUIActivityWindow.m
//  OAuthSignUtil
//
//  Created by MexiQQ on 15/2/28.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

#import "MXUIActivityWindow.h"
#import "purelayout.h"
#import "MXUIActivityViewController.h"

@implementation MXUIActivityWindow
static MXUIActivityWindow *shareInstance = nil;

+ (MXUIActivityWindow *)shareInstance {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    shareInstance =
        [[MXUIActivityWindow alloc] initWithFrame:CGRectMake(0, 568, 320, 350)];
  });
  return shareInstance;
}

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  self.hidden = YES;
  if (self) {
    MXUIActivityViewController *viewController =
        [[MXUIActivityViewController alloc] initWithNibName:nil bundle:nil];
    self.rootViewController = viewController;
    self.backgroundColor = [UIColor greenColor];
  }
  return self;
}

- (void)show {
  if (shareInstance.hidden) {
    shareInstance.hidden = NO;
    [UIView animateWithDuration:0.3f                        //时长
        delay:0                                             //延迟时间
        options:UIViewAnimationOptionTransitionFlipFromLeft //动画效果
        animations:^{
          //动画设置区域
          shareInstance.frame = CGRectMake(0, 218, 320, 350);
        }
        completion:^(BOOL finish){
            //动画结束时调用
            //............
        }];
  } else {
    [UIView animateWithDuration:0.3f                        //时长
        delay:0                                             //延迟时间
        options:UIViewAnimationOptionTransitionFlipFromLeft //动画效果
        animations:^{
          //动画设置区域
          shareInstance.frame = CGRectMake(0, 568, 320, 350);
        }
        completion:^(BOOL finish) {
          //动画结束时调用
          shareInstance.hidden = YES;
        }];
  }
}

@end
