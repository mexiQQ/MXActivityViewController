//
//  MXUIActivityViewController.h
//  OAuthSignUtil
//
//  Created by MexiQQ on 15/2/28.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^activityActionBlock)(int);
typedef void (^buttonActionBlock)();

@interface MXUIActivityViewController
    : UIViewController <UIPageViewControllerDataSource>

@property(strong, nonatomic) UIPageViewController *pageViewController;
- (instancetype)initWithImages:(NSArray *)images
                        titles:(NSArray *)titles
                   buttonTitle:(NSString *)buttonTitle
               activityHandler:(void (^)(int))activityBlock
                 buttonHandler:(buttonActionBlock)buttonActionBlock;
@end
