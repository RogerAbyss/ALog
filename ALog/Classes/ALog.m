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

- (void)echo:(NSString *)something;
{
    NSString       *sourceString = [[NSThread callStackSymbols] objectAtIndex:1];
    NSCharacterSet *separatorSet = [NSCharacterSet characterSetWithCharactersInString:@" -[]+?.,"];
    NSMutableArray *array        = [NSMutableArray arrayWithArray:[sourceString  componentsSeparatedByCharactersInSet:separatorSet]];
    [array removeObject:@""];

    if ([something isKindOfClass:[NSString class]]) {
        self.message = something;
    } else {
        
        @try {
            self.message = [[something description] UTF8encoding];
        } @catch (NSException *exception) {
            NSLog(@"%@",exception);
            NSLog(@"未知类型 [%s] in %s at %d",__func__,__FILE__,__LINE__);
        }
    }
    
    self.className = [array objectAtIndex:3];
    self.methodName = [array objectAtIndex:4];
    self.frameworkName = [array objectAtIndex:1];
    self.memorryAddress = [array objectAtIndex:2];
    
    [self echo];
}

- (void)echo
{
    NSString* echoString = [NSString stringWithFormat:@"\n%@\nfrom: [%@](%@)-%@",self.message,self.className,self.methodName,self.frameworkName];
    
    NSLog(@"%@",echoString.emojiString);
}

@end
