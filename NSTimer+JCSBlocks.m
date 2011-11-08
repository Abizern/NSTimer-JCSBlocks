//
//  NSTimer+JCSBlocks.m
//  atime
//
//  Created by Abizer Nasir on 26/08/11
//  Copyright 2011 Jungle Candy Software. All rights reserved.
//  Licences under the MIT Licence. See the README for details.
//

#import "NSTimer+JCSBlocks.h"

@interface NSTimer (JCSBlocks_Private)

+ (void)jcs_handleBlockWithTimer:(NSTimer *)timer;
+ (void)jcs_handleBlockWithInterruptableTimer:(NSTimer *)timer;

@end

@implementation NSTimer (JCSBlocks)

+ (NSTimer *)jcs_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats blockHandler:(timerCallback_t)block {
    return [self scheduledTimerWithTimeInterval:seconds target:self selector:@selector(jcs_handleBlockWithTimer:) userInfo:[block copy] repeats:repeats];
    
}

+ (NSTimer *)jcs_scheduledInterruptableTimerWithTimeInterval:(NSTimeInterval)seconds blockHandler:(interruptableTimerCallback_t)block{
    return [self scheduledTimerWithTimeInterval:seconds target:self selector:@selector(jcs_handleBlockWithInterruptableTimer:) userInfo:[block copy] repeats:YES];
}

@end

@implementation NSTimer (JCSBlocks_Private)

+ (void)jcs_handleBlockWithTimer:(NSTimer *)timer {
    ZAssert(([timer isValid] && [timer userInfo]), @"the timer is not valid");
    
    timerCallback_t block = [timer userInfo];
    
    block();
}

+ (void)jcs_handleBlockWithInterruptableTimer:(NSTimer *)timer {
    ZAssert(([timer isValid] && [timer userInfo]), @"the timer is not valid");
    
    interruptableTimerCallback_t block = [timer userInfo];
    
    BOOL stop;
    block(&stop);
    
    if (stop) {
        [timer invalidate];
        timer = nil;
    }
}

@end