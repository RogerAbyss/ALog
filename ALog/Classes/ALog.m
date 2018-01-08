//
//  ALog.m
//  ALog
//
//  Created by 任超 on 2018/1/6.
//

#import "ALog.h"
#import <objc/runtime.h>
#import "NSString+Emoji.h"

@interface NSString (ALog)
- (NSString *)UTF8encoding;
@end
@implementation NSString (ALog)
- (NSString *)UTF8encoding
{
    return [NSString stringWithCString:[self cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
}
@end

@implementation ALog

+ (instancetype)ALogSomething:(id)something
{
    NSString       *sourceString = [[NSThread callStackSymbols] objectAtIndex:1];
    NSCharacterSet *separatorSet = [NSCharacterSet characterSetWithCharactersInString:@" -[]+?.,"];
    NSMutableArray *array        = [NSMutableArray arrayWithArray:[sourceString  componentsSeparatedByCharactersInSet:separatorSet]];
    [array removeObject:@""];
    
    ALog* log = [ALog new];

    if ([something isKindOfClass:[NSString class]]) {
        log.message = something;
    } else {
        
        @try {
            log.message = [[something description] UTF8encoding];
        } @catch (NSException *exception) {
            NSLog(@"%@",exception);
            NSLog(@"未知类型 [%s] in %s at %d",__func__,__FILE__,__LINE__);
        }
    }
    
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
