//
//  MXUIActivityWindow.h
//  OAuthSignUtil
//
//  Created by MexiQQ on 15/2/28.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^activityActionBlock)(int);
typedef void (^buttonActionBlock)();
@interface MXUIActivityWindow : UIWindow
+ (MXUIActivityWindow *)shareInstance:(NSArray *)images
                                title:(NSArray *)titles
                          buttonTitle:(NSString *)buttonTitle
                  activityActionBlock:(activityActionBlock)activityActionBlock
                    buttonActionBlock:(buttonActionBlock)buttonActionBlock
                    cancelActionBlock:(buttonActionBlock)cancelActionBlock;
- (void)show;
- (void)close;
+ (MXUIActivityWindow *)standardWindow;
@end
