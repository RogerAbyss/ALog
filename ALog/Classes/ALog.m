//
//  ALog.m
//  ALog
//
//  Created by 任超 on 2018/1/6.
//

#import "ALog.h"
#import <objc/runtime.h>
#import "NSString+Emoji.h"

@implementation ALog

+ (instancetype)ALogMessage:(NSString *)message
{
    NSString       *sourceString = [[NSThread callStackSymbols] objectAtIndex:1];
    NSCharacterSet *separatorSet = [NSCharacterSet characterSetWithCharactersInString:@" -[]+?.,"];
    NSMutableArray *array        = [NSMutableArray arrayWithArray:[sourceString  componentsSeparatedByCharactersInSet:separatorSet]];
    [array removeObject:@""];
    
    ALog* log = [ALog new];
    
    log.message = message;
    log.className = [array objectAtIndex:3];
    log.methodName = [array objectAtIndex:4];
    log.frameworkName = [array objectAtIndex:1];
    log.memorryAddress = [array objectAtIndex:2];
    
    [log echo];
    
    return log;
}

- (void)echo
{
    NSString* echoString = [NSString stringWithFormat:@"\n%@\nfrom: [%@](%@)-%@",self.message,self.className,self.methodName,self.frameworkName];
    
    NSLog(@"%@",echoString.emojiString);
}

@end
