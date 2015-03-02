//
//  MXUIActivityViewController.m
//  OAuthSignUtil
//
//  Created by MexiQQ on 15/2/28.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

#import "MXUIActivityViewController.h"
#import "purelayout.h"
#import "MXActivityView.h"
#import "MXMenuViewController.h"
#import "MXUIActivityWindow.h"
@interface MXUIActivityViewController ()
@property(nonatomic, strong) UILabel *titlelable;
@property(nonatomic, strong) UIButton *reportButton;
@property(nonatomic, strong) UIButton *cancelButton;
@property(nonatomic, assign) BOOL didSetupConstraints;
@end

@implementation MXUIActivityViewController

- (void)loadView {
  self.view = [[UIView new] initWithFrame:CGRectMake(0, 0, 320, 350)];
  self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

  self.pageViewController = [[UIPageViewController alloc]
      initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
        navigationOrientation:
            UIPageViewControllerNavigationOrientationHorizontal
                      options:nil];
  self.pageViewController.dataSource = self;

  MXMenuViewController *startingViewController = [self viewControllerAtIndex:0];
  NSArray *viewControllers = @[ startingViewController ];
  [self.pageViewController
      setViewControllers:viewControllers
               direction:UIPageViewControllerNavigationDirectionForward
                animated:NO
              completion:nil];

  //  self.pageViewController.view = [UIView newAutoLayoutView];
  self.pageViewController.view.frame =
      CGRectMake(0, 0, self.view.frame.size.width, 180);

  self.pageViewController.view.backgroundColor = [UIColor clearColor];

  [self addChildViewController:_pageViewController];
  [self.view addSubview:_pageViewController.view];
  [self.pageViewController didMoveToParentViewController:self];

  UIPageControl *pageControl = [UIPageControl appearance];
  pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
  pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
  pageControl.backgroundColor = [UIColor groupTableViewBackgroundColor];

  [self.view addSubview:self.reportButton];
  [self.view addSubview:self.cancelButton];
  [self.view addSubview:self.titlelable];

  [self.view setNeedsUpdateConstraints]; // bootstrap Auto Layout
}

- (MXMenuViewController *)viewControllerAtIndex:(NSUInteger)index {

  MXMenuViewController *pageContentViewController =
      [[MXMenuViewController alloc] init];
  pageContentViewController.pageIndex = index;

  NSLog(@"index is %d", index);
  return pageContentViewController;
}

#pragma mark - Page View Controller Data Source
- (UIViewController *)pageViewController:
                          (UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {

  NSUInteger index = ((MXMenuViewController *)viewController).pageIndex;

  NSLog(@"index is before %d", index);

  if ((index == 0) || (index == NSNotFound)) {
    return nil;
  }

  index--;
  return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:
                          (UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController {
  NSUInteger index = ((MXMenuViewController *)viewController).pageIndex;
  NSLog(@"index is after %d", index);
  if (index == NSNotFound) {
    return nil;
  }
  index++;
  if (index == 2) {
    return nil;
  }
  return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:
        (UIPageViewController *)pageViewController {
  return 2;
}

- (NSInteger)presentationIndexForPageViewController:
        (UIPageViewController *)pageViewController {
  return 0;
}

/**
 *  设置 Autolayout
 */
- (void)updateViewConstraints {
  if (!self.didSetupConstraints) {
    [self.titlelable autoPinToTopLayoutGuideOfViewController:self withInset:10];
    [self.titlelable autoAlignAxisToSuperviewAxis:ALAxisVertical];

    [self.pageViewController.view autoPinToTopLayoutGuideOfViewController:self
                                                                withInset:40.0];
    [self.pageViewController.view
        autoSetDimensionsToSize:CGSizeMake(320, 200.0)];

    [self.reportButton autoPinEdge:ALEdgeTop
                            toEdge:ALEdgeBottom
                            ofView:self.self.pageViewController.view
                        withOffset:5.0];

    [self.reportButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16.0];
    [self.reportButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16.0];
    [self.reportButton autoSetDimension:ALDimensionHeight toSize:40.0];

    [self.cancelButton autoPinEdge:ALEdgeTop
                            toEdge:ALEdgeBottom
                            ofView:self.reportButton
                        withOffset:10.0];

    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16];
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16];
    [self.cancelButton autoSetDimension:ALDimensionHeight toSize:40.0];

    self.didSetupConstraints = YES;
  }

  [super updateViewConstraints];
}

- (UIButton *)reportButton {
  if (!_reportButton) {
    _reportButton = [UIButton newAutoLayoutView];
    _reportButton.backgroundColor = [UIColor whiteColor];
    [_reportButton setTitleColor:[UIColor grayColor]
                        forState:UIControlStateNormal];
    [_reportButton setTitle:@"举报" forState:UIControlStateNormal];
  }
  return _reportButton;
}

- (UIButton *)cancelButton {
  if (!_cancelButton) {
    _cancelButton = [UIButton newAutoLayoutView];
    _cancelButton.backgroundColor = [UIColor whiteColor];
    [_cancelButton setTitleColor:[UIColor grayColor]
                        forState:UIControlStateNormal];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelButton addTarget:self
                      action:@selector(cancelShare:)
            forControlEvents:UIControlEventTouchUpInside];
  }
  return _cancelButton;
}

- (UILabel *)titlelable {
  if (!_titlelable) {
    _titlelable = [UILabel newAutoLayoutView];
    _titlelable.text = @"分享";
    _titlelable.textColor = [UIColor grayColor];
  }
  return _titlelable;
}

- (IBAction)cancelShare:(id)sender {
  [[MXUIActivityWindow shareInstance] show];
}
@end
