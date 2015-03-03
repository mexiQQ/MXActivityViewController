//
//  MXUIActivityWindow.m
//  OAuthSignUtil
//
//  Created by MexiQQ on 15/2/28.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "MXUIActivityWindow.h"
#import "purelayout.h"
#import "MXUIActivityViewController.h"

@interface MXUIActivityWindow ()
@property(nonatomic, strong) NSArray *images;
@property(nonatomic, strong) NSArray *titles;
@end

@implementation MXUIActivityWindow
static MXUIActivityWindow *shareInstance = nil;

+ (MXUIActivityWindow *)shareInstance:(NSArray *)images
                                title:(NSArray *)titles
                  activityActionBlock:(activityActionBlock)activityActionBlock {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    shareInstance = [[MXUIActivityWindow alloc]
        initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH,
                                 (SCREEN_HEIGHT / 568) * 350)];
  });

  shareInstance.images = images;
  shareInstance.titles = titles;

  if (shareInstance) {
    MXUIActivityViewController *viewController = [
        [MXUIActivityViewController alloc] initWithImages:shareInstance.images
                                                   titles:shareInstance.titles];

    shareInstance.rootViewController = viewController;
    shareInstance.backgroundColor = [UIColor greenColor];
  }
  return shareInstance;
}

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  self.hidden = YES;
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
          shareInstance.frame =
              CGRectMake(0, SCREEN_HEIGHT - (SCREEN_HEIGHT / 568) * 350,
                         SCREEN_WIDTH, (SCREEN_HEIGHT / 568) * 350);
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
          shareInstance.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH,
                                           (SCREEN_HEIGHT / 568) * 350);
        }
        completion:^(BOOL finish) {
          //动画结束时调用
          shareInstance.hidden = YES;
        }];
  }
}

@end
