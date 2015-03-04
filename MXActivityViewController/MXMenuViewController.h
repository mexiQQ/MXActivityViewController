//
//  MXMenuViewController.h
//  OAuthSignUtil
//
//  Created by MexiQQ on 15/3/2.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^activityActionBlock)(int);
@interface MXMenuViewController : UIViewController
@property(nonatomic, assign) NSInteger *pageIndex;
@property(nonatomic, strong) NSMutableArray *images;
@property(nonatomic, strong) NSMutableArray *titles;
@property(nonatomic, strong) activityActionBlock activityActionBlock;
@end
