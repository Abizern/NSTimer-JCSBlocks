//
//  NSTimer+JCSBlocks.h
//  atime
//
//  Created by Abizer Nasir on 26/08/11
//  Copyright 2011 Jungle Candy Software. All rights reserved.
//
//  Additions to NSTimer that allow it to use blocks as callbacks
//  Requires standard PCH macros for ZAssert()

#import <Foundation/NSTimer.h>

typedef void (^timerCallback_t)();

@interface NSTimer (JCSBlocks)

+ (NSTimer *)jcs_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats blockHandler:(timerCallback_t)block;

@end
