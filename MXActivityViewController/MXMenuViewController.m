//
//  MXMenuViewController.m
//  OAuthSignUtil
//
//  Created by MexiQQ on 15/3/2.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

#import "MXMenuViewController.h"
#import "MXActivityView.h"
#import "purelayout.h"
@interface MXMenuViewController ()
@property(nonatomic, strong) MXActivityView *blueView;
@property(nonatomic, strong) MXActivityView *redView;
@property(nonatomic, strong) MXActivityView *yellowView;
@property(nonatomic, strong) MXActivityView *greenView;
@property(nonatomic, strong) MXActivityView *everNoteView;
@property(nonatomic, strong) MXActivityView *pocketView;
@property(nonatomic, strong) MXActivityView *emailView;
@property(nonatomic, strong) MXActivityView *twitterView;

@property(nonatomic, assign) BOOL didSetupConstraints;
@end

@implementation MXMenuViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];

  [self.view addSubview:self.blueView];
  [self.view addSubview:self.redView];
  [self.view addSubview:self.yellowView];
  [self.view addSubview:self.greenView];
  [self.view addSubview:self.pocketView];
  [self.view addSubview:self.everNoteView];
  [self.view addSubview:self.twitterView];
  [self.view addSubview:self.emailView];

  [self.view setNeedsUpdateConstraints]; // bootstrap Auto Layouts
}

/**
 *  设置 Autolayout
 */
- (void)updateViewConstraints {
  if (!self.didSetupConstraints) {
    NSArray *views =
        @[ self.redView, self.blueView, self.yellowView, self.greenView ];

    [views autoDistributeViewsAlongAxis:ALAxisHorizontal
                              alignedTo:ALAttributeHorizontal
                       withFixedSpacing:16.0
                           insetSpacing:YES
                           matchedSizes:YES];
    [self.redView autoPinToTopLayoutGuideOfViewController:self withInset:0];

    NSArray *views2 = @[
      self.everNoteView,
      self.pocketView,
      self.twitterView,
      self.emailView
    ];

    [views2 autoDistributeViewsAlongAxis:ALAxisHorizontal
                               alignedTo:ALAttributeHorizontal
                        withFixedSpacing:16.0
                            insetSpacing:YES
                            matchedSizes:YES];

    [self.everNoteView autoPinEdge:ALEdgeTop
                            toEdge:ALEdgeBottom
                            ofView:self.redView
                        withOffset:0];

    self.didSetupConstraints = YES;
  }
  [super updateViewConstraints];
}
- (UIView *)blueView {
  if (!_blueView) {
    _blueView = [[MXActivityView alloc] initwithImageName:@"Share_WeChat"
                                                    title:@"微信"];
    _blueView.backgroundColor = [UIColor clearColor];
  }
  return _blueView;
}

- (UIView *)redView {
  if (!_redView) {
    _redView = [[MXActivityView alloc] initwithImageName:@"Share_WeChat_Moments"
                                                   title:@"朋友圈"];
    _redView.backgroundColor = [UIColor clearColor];
  }
  return _redView;
}

- (UIView *)yellowView {
  if (!_yellowView) {
    _yellowView =
        [[MXActivityView alloc] initwithImageName:@"Share_QQ" title:@"QQ"];
    _yellowView.backgroundColor = [UIColor clearColor];
  }
  return _yellowView;
}

- (UIView *)greenView {
  if (!_greenView) {
    _greenView = [[MXActivityView alloc] initwithImageName:@"Share_Sina"
                                                     title:@"微博"];
    _greenView.backgroundColor = [UIColor clearColor];
  }
  return _greenView;
}

- (UIView *)everNoteView {
  if (!_everNoteView) {
    _everNoteView = [[MXActivityView alloc] initwithImageName:@"Share_Evernote"
                                                        title:@"Evernote"];
    _everNoteView.backgroundColor = [UIColor clearColor];
  }
  return _everNoteView;
}

- (UIView *)pocketView {
  if (!_pocketView) {
    _pocketView = [[MXActivityView alloc] initwithImageName:@"Share_Pocket"
                                                      title:@"Pocket"];
    _pocketView.backgroundColor = [UIColor clearColor];
  }
  return _pocketView;
}

- (UIView *)emailView {
  if (!_emailView) {
    _emailView = [[MXActivityView alloc] initwithImageName:@"Share_Email"
                                                     title:@"Email"];
    _emailView.backgroundColor = [UIColor clearColor];
  }
  return _emailView;
}

- (UIView *)twitterView {
  if (!_twitterView) {
    _twitterView = [[MXActivityView alloc] initwithImageName:@"Share_Twitter"
                                                       title:@"Twitter"];
    _twitterView.backgroundColor = [UIColor clearColor];
  }
  return _twitterView;
}

@end
