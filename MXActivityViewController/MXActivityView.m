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
#import "MXUIActivityWindow.h"
@interface MXActivityView ()
@property(nonatomic, strong) UILabel *title;
@property(nonatomic, strong) UIButton *imageButton;
@property(nonatomic, assign) NSInteger index;
@property(nonatomic, strong) activityActionBlock block;
@end

@implementation MXActivityView

- (MXActivityView *)init {
  MXActivityView *view = [super init];
  view.translatesAutoresizingMaskIntoConstraints = NO;
  [view addSubview:self.title];
  [view addSubview:self.imageButton];

  [view autoSetDimensionsToSize:CGSizeMake(ACTIVITYVIEW_WIDTH,
                                           ACTIVITYVIEW_HEIGHT)];

  [self.imageButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
  [self.imageButton autoPinEdgeToSuperviewEdge:ALEdgeLeft
                                     withInset:(ACTIVITYVIEW_WIDTH / 24)];
  [self.imageButton autoPinEdgeToSuperviewEdge:ALEdgeRight
                                     withInset:(ACTIVITYVIEW_WIDTH / 24)];
  [self.imageButton
      autoSetDimensionsToSize:CGSizeMake((ACTIVITYVIEW_WIDTH / 12) * 11,
                                         (ACTIVITYVIEW_WIDTH / 12) * 11)];

  [self.title autoPinEdge:ALEdgeTop
                   toEdge:ALEdgeBottom
                   ofView:self.imageButton];
  [self.title autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
  [self.title autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
  [self.title
      autoSetDimension:ALDimensionHeight
                toSize:((ACTIVITYVIEW_HEIGHT - (ACTIVITYVIEW_WIDTH / 12) * 11) /
                        7 * 4)];

  return view;
}

- (instancetype)initwithImageName:(NSString *)imageName
                            title:(NSString *)title
                            index:(NSInteger)tag
                            block:(activityActionBlock)block {
  _titleName = title;
  _imageName = imageName;
  _index = tag;
  _block = block;
  return [self init];
}

- (UILabel *)title {
  if (![self.imageName isEqualToString:@"null"]) {
    if (!_title) {
      _title = [UILabel newAutoLayoutView];
      _title.text = _titleName;
      _title.font = [UIFont fontWithName:@"Arial" size:13.0];
      _title.textColor = [UIColor grayColor];
      _title.textAlignment = NSTextAlignmentCenter;
    }
    return _title;
  } else {
    return nil;
  }
}

- (UIButton *)imageButton {
  if (![self.titleName isEqualToString:@"null"]) {
    if (!_imageButton) {
      _imageButton = [UIButton newAutoLayoutView];
      [_imageButton setImage:[UIImage imageNamed:_imageName]
                    forState:UIControlStateNormal];
      [_imageButton addTarget:self
                       action:@selector(shareAction:)
             forControlEvents:UIControlEventTouchUpInside];
    }
    return _imageButton;
  } else {
    return nil;
  }
}

- (IBAction)shareAction:(id)sender {
  _block((int)_index);
  [[MXUIActivityWindow standardWindow] close];
}
@end
