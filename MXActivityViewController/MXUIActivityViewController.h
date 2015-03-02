//
//  MXUIActivityViewController.h
//  OAuthSignUtil
//
//  Created by MexiQQ on 15/2/28.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MXUIActivityViewController
    : UIViewController <UIPageViewControllerDataSource>
@property(strong, nonatomic) UIPageViewController *pageViewController;
@end
