//
//  NSTimer+JCSBlocks.m
//  atime
//
//  Created by Abizer Nasir on 26/08/11
//  Copyright 2011 Jungle Candy Software. All rights reserved.
//

#import "NSTimer+JCSBlocks.h"

@interface NSTimer (JCSBlocks_Private)

+ (void)handleBlockWithTimer:(NSTimer *)timer;

@end

@implementation NSTimer (JCSBlocks)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats blockHandler:(timerCallback_t)block {
    return [self scheduledTimerWithTimeInterval:seconds target:self selector:@selector(handleBlockWithTimer:) userInfo:[[block copy] autorelease] repeats:repeats];
    
}


@end

@implementation NSTimer (JCSBlocks_Private)

+ (void)handleBlockWithTimer:(NSTimer *)timer {
    ZAssert(([timer isValid] && [timer userInfo]), @"the timer is not valid");
    
    timerCallback_t block = [timer userInfo];
    block();
}

@end