//
//  ActivityView.h
//  OAuthSignUtil
//
//  Created by MexiQQ on 15/2/28.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^activityActionBlock)(int);
@interface MXActivityView : UIView
@property(nonatomic, strong) NSString *imageName;
@property(nonatomic, strong) NSString *titleName;

- (instancetype)initwithImageName:(NSString *)imageName
                            title:(NSString *)title
                            index:(NSInteger)tag
                            block:(activityActionBlock)block;
@end
