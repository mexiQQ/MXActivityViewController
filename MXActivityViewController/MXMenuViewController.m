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
@property(nonatomic, strong) MXActivityView *a1;
@property(nonatomic, strong) MXActivityView *a2;
@property(nonatomic, strong) MXActivityView *a3;
@property(nonatomic, strong) MXActivityView *a4;
@property(nonatomic, strong) MXActivityView *a5;
@property(nonatomic, strong) MXActivityView *a6;
@property(nonatomic, strong) MXActivityView *a7;
@property(nonatomic, strong) MXActivityView *a8;

@property(nonatomic, strong) UIButton *button;

@property(nonatomic, assign) BOOL didSetupConstraints;
@property(nonatomic, assign) NSInteger *activityNumber;

@end

@implementation MXMenuViewController
@synthesize images = _images;
@synthesize titles = _titles;
@synthesize activityActionBlock = _activityActionBlock;
- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];

  while (self.images.count < 8) {
    [self.images addObject:@"null"];
  }

  while (self.titles.count < 8) {
    [self.titles addObject:@"null"];
  }

  [self.view addSubview:self.a1];
  [self.view addSubview:self.a2];
  [self.view addSubview:self.a3];
  [self.view addSubview:self.a4];
  [self.view addSubview:self.a5];
  [self.view addSubview:self.a6];
  [self.view addSubview:self.a7];
  [self.view addSubview:self.a8];

  [self.view setNeedsUpdateConstraints]; // bootstrap Auto Layouts
}

/**
 *  设置 Autolayout
 */
- (void)updateViewConstraints {
  if (!self.didSetupConstraints) {
    NSArray *views = @[ self.a1, self.a2, self.a3, self.a4 ];

    [views autoDistributeViewsAlongAxis:ALAxisHorizontal
                              alignedTo:ALAttributeHorizontal
                       withFixedSpacing:16.0
                           insetSpacing:YES
                           matchedSizes:YES];
    [self.a1 autoPinToTopLayoutGuideOfViewController:self withInset:0];

    NSArray *views2 = @[ self.a5, self.a6, self.a7, self.a8 ];

    [views2 autoDistributeViewsAlongAxis:ALAxisHorizontal
                               alignedTo:ALAttributeHorizontal
                        withFixedSpacing:16.0
                            insetSpacing:YES
                            matchedSizes:YES];

    [self.a5 autoPinEdge:ALEdgeTop
                  toEdge:ALEdgeBottom
                  ofView:self.a1
              withOffset:0];

    self.didSetupConstraints = YES;
  }
  [super updateViewConstraints];
}
- (UIView *)a1 {
  if (!_a1) {
    _a1 =
        [[MXActivityView alloc] initwithImageName:[self.images objectAtIndex:0]
                                            title:[self.titles objectAtIndex:0]
                                            index:((int)self.pageIndex * 8) + 1
                                            block:self.activityActionBlock];
    _a1.backgroundColor = [UIColor clearColor];
  }
  return _a1;
}

- (UIView *)a2 {
  if (!_a2) {
    _a2 =
        [[MXActivityView alloc] initwithImageName:[self.images objectAtIndex:1]
                                            title:[self.titles objectAtIndex:1]
                                            index:((int)self.pageIndex * 8) + 2
                                            block:self.activityActionBlock];
    _a2.backgroundColor = [UIColor clearColor];
  }
  return _a2;
}

- (UIView *)a3 {
  if (!_a3) {
    _a3 =
        [[MXActivityView alloc] initwithImageName:[self.images objectAtIndex:2]
                                            title:[self.titles objectAtIndex:2]
                                            index:((int)self.pageIndex * 8) + 3
                                            block:self.activityActionBlock];
    _a3.backgroundColor = [UIColor clearColor];
  }
  return _a3;
}

- (UIView *)a4 {
  if (!_a4) {
    _a4 =
        [[MXActivityView alloc] initwithImageName:[self.images objectAtIndex:3]
                                            title:[self.titles objectAtIndex:3]
                                            index:((int)self.pageIndex * 8) + 4
                                            block:self.activityActionBlock];
    _a4.backgroundColor = [UIColor clearColor];
  }
  return _a4;
}

- (UIView *)a5 {
  if (!_a5) {
    _a5 =
        [[MXActivityView alloc] initwithImageName:[self.images objectAtIndex:4]
                                            title:[self.titles objectAtIndex:4]
                                            index:((int)self.pageIndex * 8) + 5
                                            block:self.activityActionBlock];
    _a5.backgroundColor = [UIColor clearColor];
  }
  return _a5;
}

- (UIView *)a6 {
  if (!_a6) {
    _a6 =
        [[MXActivityView alloc] initwithImageName:[self.images objectAtIndex:5]
                                            title:[self.titles objectAtIndex:5]
                                            index:((int)self.pageIndex * 8) + 6
                                            block:self.activityActionBlock];
    _a6.backgroundColor = [UIColor clearColor];
  }
  return _a6;
}

- (UIView *)a7 {
  if (!_a7) {
    _a7 =
        [[MXActivityView alloc] initwithImageName:[self.images objectAtIndex:6]
                                            title:[self.titles objectAtIndex:6]
                                            index:((int)self.pageIndex * 8) + 7
                                            block:self.activityActionBlock];
    _a7.backgroundColor = [UIColor clearColor];
  }
  return _a7;
}

- (UIView *)a8 {
  if (!_a8) {
    _a8 =
        [[MXActivityView alloc] initwithImageName:[self.images objectAtIndex:7]
                                            title:[self.titles objectAtIndex:7]
                                            index:((int)self.pageIndex * 8) + 8
                                            block:self.activityActionBlock];
    _a8.backgroundColor = [UIColor clearColor];
  }
  return _a8;
}

@end
