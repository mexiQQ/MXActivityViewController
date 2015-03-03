//
//  ActivityView.m
//  OAuthSignUtil
//
//  Created by MexiQQ on 15/2/28.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

#define ACTIVITYVIEW_WIDTH                                                     \
  (([UIScreen mainScreen].bounds.size.width - 16 * 5) / 4)
#define ACTIVITYVIEW_HEIGHT                                                    \
  (([UIScreen mainScreen].bounds.size.height / 568) * 90)

#import "MXActivityView.h"
#import "purelayout.h"
@interface MXActivityView ()
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UILabel *title;
@end

@implementation MXActivityView

- (MXActivityView *)init {
  MXActivityView *view = (MXActivityView *)[UIView newAutoLayoutView];
  [view addSubview:self.imageView];
  [view addSubview:self.title];

  [view autoSetDimensionsToSize:CGSizeMake(ACTIVITYVIEW_WIDTH,
                                           ACTIVITYVIEW_HEIGHT)];
  [self.imageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
  [self.imageView autoPinEdgeToSuperviewEdge:ALEdgeLeft
                                   withInset:(ACTIVITYVIEW_WIDTH / 24)];
  [self.imageView autoPinEdgeToSuperviewEdge:ALEdgeRight
                                   withInset:(ACTIVITYVIEW_WIDTH / 24)];
  [self.imageView
      autoSetDimensionsToSize:CGSizeMake((ACTIVITYVIEW_WIDTH / 12) * 11,
                                         (ACTIVITYVIEW_WIDTH / 12) * 11)];

  [self.title autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.imageView];
  [self.title autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
  [self.title autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
  [self.title
      autoSetDimension:ALDimensionHeight
                toSize:((ACTIVITYVIEW_HEIGHT - (ACTIVITYVIEW_WIDTH / 12) * 11) /
                        7 * 4)];

  return view;
}

- (instancetype)initwithImageName:(NSString *)imageName
                            title:(NSString *)title {
  _titleName = title;
  _imageName = imageName;
  return [self init];
}

- (UIImageView *)imageView {
  if (!_imageView) {
    _imageView = [UIImageView newAutoLayoutView];
    _imageView.image = [UIImage imageNamed:_imageName];
  }
  return _imageView;
}

- (UILabel *)title {
  if (!_title) {
    _title = [UILabel newAutoLayoutView];
    _title.text = _titleName;
    _title.font = [UIFont fontWithName:@"Arial" size:13.0];
    _title.textColor = [UIColor grayColor];
    _title.textAlignment = NSTextAlignmentCenter;
  }
  return _title;
}

@end
