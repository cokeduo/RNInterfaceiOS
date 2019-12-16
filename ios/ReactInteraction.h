//
//  ReactInteraction.h
//  RNInterfactionwithiOS
//
//  Created by 王铎 on 2019/11/14.
//  Copyright © 2019 Facebook. All rights reserved.
//


#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

// ios call rn
@interface ReactInteraction : RCTEventEmitter

+ (instancetype)shareInstance;

/// ios 调用 reactNative, 不带参数
- (void)callReactNativeWithOutInfo;

/// ios 调用 reactNative, info: 携带参数
- (void)callReactNativeWithInfo:(NSString *)info;


@end
