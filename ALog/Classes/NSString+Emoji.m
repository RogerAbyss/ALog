//
//  NSString+Emoji.m
//  ALog
//
//  Created by 任超 on 2018/1/6.
//

#import "NSString+Emoji.h"
#import "Emoji.h"

@implementation NSString (emoji)

- (NSString *)emoji:(Emoji)emoji
{
    NSString* emojiString = @"";
    
    switch (emoji)
    {
        case EmojiBug:
            emojiString = @":bug: ";
            break;
            
        default:
            break;
    }
    
    return [self emojiWithString:emojiString];
}

- (NSString *)emojiWithString:(NSString *)emojiString
{
    return [emojiString stringByAppendingString:self].emojiString;
}

- (NSString *)emojiString
{
    static dispatch_once_t onceToken;
    static NSRegularExpression *regex = nil;
    dispatch_once(&onceToken, ^{
        regex = [[NSRegularExpression alloc] initWithPattern:@"(:[a-z0-9-+_]+:)" options:NSRegularExpressionCaseInsensitive error:NULL];
    });
    
    __block NSString *resultText = self;
    NSRange matchingRange = NSMakeRange(0, [resultText length]);
    [regex enumerateMatchesInString:resultText options:NSMatchingReportCompletion range:matchingRange usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        if (result && ([result resultType] == NSTextCheckingTypeRegularExpression) && !(flags & NSMatchingInternalError)) {
            NSRange range = result.range;
            if (range.location != NSNotFound) {
                NSString *code = [self substringWithRange:range];
                NSString *unicode = [NSString emojiAliases][code];
                if (unicode) {
                    resultText = [resultText stringByReplacingOccurrencesOfString:code withString:unicode];
                }
            }
        }
    }];
    
    return resultText;
}

+ (NSString *)emojizedStringWithString:(NSString *)text
{
    static dispatch_once_t onceToken;
    static NSRegularExpression *regex = nil;
    dispatch_once(&onceToken, ^{
        regex = [[NSRegularExpression alloc] initWithPattern:@"(:[a-z0-9-+_]+:)" options:NSRegularExpressionCaseInsensitive error:NULL];
    });
    
    __block NSString *resultText = text;
    NSRange matchingRange = NSMakeRange(0, [resultText length]);
    [regex enumerateMatchesInString:resultText options:NSMatchingReportCompletion range:matchingRange usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        if (result && ([result resultType] == NSTextCheckingTypeRegularExpression) && !(flags & NSMatchingInternalError)) {
            NSRange range = result.range;
            if (range.location != NSNotFound) {
                NSString *code = [text substringWithRange:range];
                NSString *unicode = self.emojiAliases[code];
                if (unicode) {
                    resultText = [resultText stringByReplacingOccurrencesOfString:code withString:unicode];
                }
            }
        }
    }];
    
    return resultText;
}

+ (NSDictionary *)emojiAliases {
    static NSDictionary *_emojiAliases;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _emojiAliases = EMOJI_HASH;
    });
    return _emojiAliases;
}

#pragma mark --

- (NSString *)emojiBug
{
    return [self emoji:EmojiBug];
}

@end
