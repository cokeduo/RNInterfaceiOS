//
//  JJViewController.m
//  RNInterfactionwithiOS
//
//  Created by 王铎 on 2019/11/14.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "JJViewController.h"
#import <React/RCTRootView.h>
#import "ReactInteraction.h"

@interface JJViewController ()<RCTBridgeDelegate>

@property (nonatomic, strong) RCTBridge *bridge;

@end

#define RNBounds CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width - 50, UIScreen.mainScreen.bounds.size.height / 2.f)

@implementation JJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:nil];
    // 用于 rn & ios 交互桥
   [[ReactInteraction shareInstance] setValue:self.bridge forKey:@"bridge"];
}

- (IBAction)openRNOne:(UIButton *)sender {
  [self closeRNView:nil];
  [self loadRNView:@"JJApp1"];
}

- (IBAction)openRNTwo:(UIButton *)sender {
  [self closeRNView:nil];
  [self loadRNView:@"JJApp2"];
}

- (IBAction)closeRNView:(UIButton *)sender {
  
  [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    if ([obj isKindOfClass:[RCTRootView class]]) {
      [obj removeFromSuperview];
    }
  }];
}


- (void)loadRNView:(NSString *)moduleName {
  
  RCTRootView *rnView = [[RCTRootView alloc] initWithBridge:self.bridge
                                                 moduleName:moduleName
                                          initialProperties:nil];
  rnView.bounds = RNBounds;
  rnView.center = self.view.center;
  [self.view addSubview:rnView];
  
}


#pragma mark - RCTBridgeDelegate

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge{
  return [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
}


#pragma mark - iOS原生调用RN事件

- (IBAction)iosCallreactnative:(UIButton *)sender {
  [self openRNOne:nil];
  [[ReactInteraction shareInstance] callReactNativeWithOutInfo];
}

- (IBAction)iosCallReactNativeWithParams:(UIButton *)sender {
  [self openRNOne:nil];
  [[ReactInteraction shareInstance] callReactNativeWithInfo:@"我是iOS参数"];
}




@end
