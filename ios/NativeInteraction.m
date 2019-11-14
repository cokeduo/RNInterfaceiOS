//
//  IOSCallReactNative.m
//  RNInterfactionwithiOS
//
//  Created by 王铎 on 2019/11/14.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "NativeInteraction.h"
#import <React/RCTBridge.h>
#import <React/RCTBridgeModule.h>

#define TestNativeJsonData @"{\"key\":\"value\"}"

@implementation NativeInteraction{
  RCTPromiseResolveBlock _resolveBlock;
  RCTPromiseRejectBlock _rejectBlock;
}

// 导出桥接模块，参数传空或者当前class的类名; 参数为空，默认模块名为当前class类名
RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(RNCallIOSWithoutParams) {
  NSLog(@"RN调用iOS，无回调无参数");
}


RCT_EXPORT_METHOD(RNCallIOSWithParameter:(NSString *)log) {
  NSLog(@"RN调用iOS，参数为: %@", log);
}


RCT_EXPORT_METHOD(RNCallIOSWithCallBack: (RCTResponseSenderBlock)callback){
  callback(@[[NSString stringWithFormat:@"RN调用iOS，无参数，有回调，iOS回调数据为： %@", TestNativeJsonData]]);
}


RCT_REMAP_METHOD(RNCallIOSWithParameterAndCallBack, // 方法名字，rn调用
                 para1:(NSString *)para1            // 参数1
                 para2:(NSString *)para2            // 参数2
                 resolver:(RCTPromiseResolveBlock)resolver  // rn 回调
                 rejecter:(RCTPromiseRejectBlock)reject) {  // rn 回调
  
  _resolveBlock = resolver; // 一般数据处理为异步处理，所以要先保存 resolver
  _rejectBlock = reject;
  NSString *jsonString = [NSString stringWithFormat:@"RN调用iOS，有参数，参数为：%@-%@，有回调，iOS回调数据为%@", para1,para2,TestNativeJsonData];

  _resolveBlock(@[jsonString]);
}


@end
