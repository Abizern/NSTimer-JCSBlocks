//
//  NSTimer+JCSBlocks.h
//  atime
//
//  Created by Abizer Nasir on 26/08/11
//  Copyright 2011 Jungle Candy Software. All rights reserved.
//
//  Additions to NSTimer that allow it to use blocks as callbacks
//  Requires standard PCH macros for ZAssert()
//    - See http://gist.github.com/325926
//  Requires compilation with ARC

#import <Foundation/NSTimer.h>

typedef void (^timerCallback_t)();
typedef void (^interruptableTimerCallback_t)(BOOL *stop);

@interface NSTimer (JCSBlocks)

+ (NSTimer *)jcs_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats blockHandler:(timerCallback_t)block;
+ (NSTimer *)jcs_scheduledInterrubtableTimerWithTimeInterval:(NSTimeInterval)seconds blockHandler:(interruptableTimerCallback_t)block;

@end
