//
//  NSString+Emoji.h
//  ALog
//
//  Created by 任超 on 2018/1/6.
//

#import <Foundation/Foundation.h>

/**
 # NSString+Emoji
 ```
 提供NSString支持emoji的策略类
 ```
 */
typedef NS_ENUM(NSUInteger, Emoji)
{
    /** bug **/
    EmojiBug,
};

@interface NSString (emoji)

/**
 在字符串后面添加 emoji 的enum
 */
- (NSString *)emoji:(Emoji)emoji;

/**
 在字符串后面添加 emoji 的字符串
 like ``:bug:``
 */
- (NSString *)emojiWithString:(NSString *)emojiString;

/**
 将字符串emoji编码一次
 */
- (NSString *)emojiString;

/**
 将字符串添加:bug:
 emoji编码
 */
- (NSString *)emojiBug;

@end
