//
//  ALogTests.m
//  ALogTests
//
//  Created by roger_ren@qq.com on 01/06/2018.
//  Copyright (c) 2018 roger_ren@qq.com. All rights reserved.
//

// https://github.com/Specta/Specta
#import <Specta/Specta.h>
#import <ALog/ALog.h>

SpecBegin(ALogTest)

describe(@"ALog打印测试", ^{
    
    it(@"打印message", ^{
        NSLog(@"打印message\n\n");
        
        Log(@"我是一个message")
    });
    
    it(@"打印对象", ^{
        NSLog(@"打印对象\n\n");
        
        NSString* obj1 = @"我是字符串对象";
        NSArray* obj2 = @[@"hello",@"我是数组对象"];
        NSDictionary* obj3 = @{@"key":@"value",
                               @"hello":@"我是字典对象"
                               };
        Log(obj1)
        Log(obj2)
        Log(obj3)
    });
    
    it(@"打印emoji", ^{
        NSLog(@"打印emoji\n\n");
        
        Log(@"打印emoji-bug".emojiBug)
        Log(@"打印emoji-:bug::bug:".emojiString)
    });
    
    it(@"打印错误类型", ^{
        NSLog(@"打印错误类型\n\n");
        
        Log(nil)
    });
});

SpecEnd


