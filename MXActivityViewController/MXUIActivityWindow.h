//
//  MXUIActivityWindow.h
//  OAuthSignUtil
//
//  Created by MexiQQ on 15/2/28.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^activityActionBlock)(int);
@interface MXUIActivityWindow : UIWindow
+ (MXUIActivityWindow *)shareInstance:(NSArray *)images
                                title:(NSArray *)titles
                  activityActionBlock:(activityActionBlock)activityActionBlock;
@property(nonatomic, strong) activityActionBlock activityActionBlock;
- (void)show;
@end
