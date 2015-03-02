//
//  ViewController.m
//  MXActivityViewControllerDemo
//
//  Created by MexiQQ on 15/3/2.
//  Copyright (c) 2015年 MexiQQ. All rights reserved.
//

#import "ViewController.h"
#import "MXUIActivityWindow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)shareAction:(id)sender {
  [[MXUIActivityWindow shareInstance] show];
}
@end
