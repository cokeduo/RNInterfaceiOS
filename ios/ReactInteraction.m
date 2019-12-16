//
//  ReactInteraction.m
//  RNInterfactionwithiOS
//
//  Created by 王铎 on 2019/11/14.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "ReactInteraction.h"

#define EventWithInfo @"EventWithInfo"
#define EventWithoutInfo @"EventWithoutInfo"

@implementation ReactInteraction

RCT_EXPORT_MODULE();
+ (instancetype)shareInstance{
    static ReactInteraction *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      instance = [[[self class] alloc] init];
    });
    return instance;
}

- (NSArray<NSString *> *)supportedEvents{
    return @[EventWithInfo, EventWithoutInfo];
}


- (void)callReactNativeWithOutInfo{
    [self.bridge enqueueJSCall:@"RCTDeviceEventEmitter"
                      method:@"emit"
                        args:@[EventWithoutInfo]
                  completion:nil];
}



- (void)callReactNativeWithInfo:(NSString *)info{
    [self.bridge enqueueJSCall:@"RCTDeviceEventEmitter"
                      method:@"emit"
                        args:@[EventWithInfo, info]
                  completion:nil];

}



@end
