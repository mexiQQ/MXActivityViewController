//
//  ActivityView.m
//  OAuthSignUtil
//
//  Created by MexiQQ on 15/2/28.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

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

  [view autoSetDimensionsToSize:CGSizeMake(60, 90.0)];
  [self.imageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:1.0];
  [self.imageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:2.5];
  [self.imageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:2.5];
  [self.imageView autoSetDimensionsToSize:CGSizeMake(55, 55)];

  [self.title autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.imageView];
  [self.title autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
  [self.title autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
  [self.title autoSetDimension:ALDimensionHeight toSize:20.0];

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
    _title.font = [UIFont fontWithName:@"Arial" size:14.0];
    _title.textColor = [UIColor grayColor];
    _title.textAlignment = NSTextAlignmentCenter;
  }
  return _title;
}

@end
