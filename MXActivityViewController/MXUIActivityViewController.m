//
//  MXUIActivityViewController.m
//  OAuthSignUtil
//
//  Created by MexiQQ on 15/2/28.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

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

@property(nonatomic, strong) NSMutableArray *singlePageImages;
@property(nonatomic, strong) NSMutableArray *singlePageTitles;

@property(nonatomic, strong) NSArray *images;
@property(nonatomic, strong) NSArray *titles;
@end

@implementation MXUIActivityViewController

- (instancetype)initWithImages:(NSArray *)images titles:(NSArray *)titles {
  self = [super init];
  if (self) {
    self.images = images;
    self.titles = titles;
  }
  return self;
}

- (void)viewDidLoad {
  self.view =
      [[UIView new] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,
                                             (SCREEN_HEIGHT / 568) * 350)];
  self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

  self.singlePageImages = [[NSMutableArray alloc] init];
  self.singlePageTitles = [[NSMutableArray alloc] init];

  // 计算 pageContentViewController 内容
  if (self.images.count > 16) {
    NSIndexSet *s1 = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 8)];
    NSIndexSet *s2 = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(8, 8)];
    NSIndexSet *s3 = [NSIndexSet
        indexSetWithIndexesInRange:NSMakeRange(16, self.images.count - 16)];
    [self.singlePageImages addObject:[self.images objectsAtIndexes:s1]];
    [self.singlePageImages addObject:[self.images objectsAtIndexes:s2]];
    [self.singlePageImages addObject:[self.images objectsAtIndexes:s3]];
    [self.singlePageTitles addObject:[self.titles objectsAtIndexes:s1]];
    [self.singlePageTitles addObject:[self.titles objectsAtIndexes:s2]];
    [self.singlePageTitles addObject:[self.titles objectsAtIndexes:s3]];
  } else if (8 < self.images.count < 17) {
    NSIndexSet *s1 = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 8)];
    NSIndexSet *s2 = [NSIndexSet
        indexSetWithIndexesInRange:NSMakeRange(8, self.images.count - 8)];
    [self.singlePageImages addObject:[self.images objectsAtIndexes:s1]];
    [self.singlePageImages addObject:[self.images objectsAtIndexes:s2]];
    [self.singlePageTitles addObject:[self.titles objectsAtIndexes:s1]];
    [self.singlePageTitles addObject:[self.titles objectsAtIndexes:s2]];
  } else {
    [self.singlePageImages addObject:self.images];
    [self.singlePageTitles addObject:self.titles];
  }

  // 添加 pageViewController
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

  self.pageViewController.view.frame =
      CGRectMake(0, 0, SCREEN_WIDTH, (SCREEN_HEIGHT / 568) * 180);

  self.pageViewController.view.backgroundColor = [UIColor clearColor];

  [self addChildViewController:_pageViewController];
  [self.view addSubview:_pageViewController.view];
  [self.pageViewController didMoveToParentViewController:self];

  // 设置 pageControl 样式
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
  pageContentViewController.pageIndex = (NSInteger *)index;

  NSMutableArray *a = [NSMutableArray
      arrayWithArray:[self.singlePageImages objectAtIndex:index]];
  NSMutableArray *b = [NSMutableArray
      arrayWithArray:[self.singlePageTitles objectAtIndex:index]];
  pageContentViewController.images = a;
  pageContentViewController.titles = b;
  return pageContentViewController;
}

#pragma mark - Page View Controller Data Source
- (UIViewController *)pageViewController:
                          (UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {

  NSUInteger index = (int)((MXMenuViewController *)viewController).pageIndex;

  if ((index == 0) || (index == NSNotFound)) {
    return nil;
  }

  index--;
  return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:
                          (UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController {
  NSUInteger index = (int)((MXMenuViewController *)viewController).pageIndex;

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
  return self.singlePageImages.count;
}

- (NSInteger)presentationIndexForPageViewController:
        (UIPageViewController *)pageViewController {
  return 0;
}

#pragma mark - Autolayout
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
        autoSetDimensionsToSize:CGSizeMake(SCREEN_WIDTH,
                                           (SCREEN_HEIGHT / 568) * 200)];

    [self.reportButton autoPinEdge:ALEdgeTop
                            toEdge:ALEdgeBottom
                            ofView:self.self.pageViewController.view
                        withOffset:(SCREEN_HEIGHT / 568) * 5];

    [self.reportButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16.0];
    [self.reportButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16.0];
    [self.reportButton autoSetDimension:ALDimensionHeight
                                 toSize:(SCREEN_HEIGHT / 568) * 40];

    [self.cancelButton autoPinEdge:ALEdgeTop
                            toEdge:ALEdgeBottom
                            ofView:self.reportButton
                        withOffset:(SCREEN_HEIGHT / 568) * 10];

    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16];
    [self.cancelButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16];
    [self.cancelButton autoSetDimension:ALDimensionHeight
                                 toSize:(SCREEN_HEIGHT / 568) * 40];

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
}
@end
