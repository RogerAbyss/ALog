//
//  ALog.h
//  ALog
//
//  Created by 任超 on 2018/1/6.
//

#import <Foundation/Foundation.h>
#define Log(_message_) [ALog ALogMessage:_message_];
#import "NSString+Emoji.h"

/**
 # ALog
 ```
 打印详细日志, 支持emoji！！
 ```
 
 ## 关于内存消耗
 
 打印日志, 以类的方式定义每个打印, 比较消耗内存!<br>
 请使用AControl类控制release版本的性能。<br>
 
 */
@interface ALog : NSObject

/** [传入]输出信息 */
@property (nonatomic, copy) NSString* message;
/** 当前类名 */
@property (nonatomic, copy) NSString* className;
/** 当前方法名 */
@property (nonatomic, copy) NSString* methodName;
/** 当前库名 */
@property (nonatomic, copy) NSString* frameworkName;
/** 当前地址 */
@property (nonatomic, copy) NSString* memorryAddress;

/**
 ## 打印, 核心类
 ```
 通常使用宏 Log()方式调用比较美观
 ```
 */
+ (instancetype)ALogMessage:(NSString *)message;

/**
 打印
 */
- (void)echo;
@end
