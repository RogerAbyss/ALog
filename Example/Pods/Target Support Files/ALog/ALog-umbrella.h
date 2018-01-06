#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ALog.h"
#import "Emoji.h"
#import "NSString+Emoji.h"

FOUNDATION_EXPORT double ALogVersionNumber;
FOUNDATION_EXPORT const unsigned char ALogVersionString[];

