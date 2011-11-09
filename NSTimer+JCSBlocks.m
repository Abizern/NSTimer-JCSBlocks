//
//  NSTimer+JCSBlocks.m
//  atime
//
//  Created by Abizer Nasir on 26/08/11
//  Copyright 2011 Jungle Candy Software. All rights reserved.
//  Licences under the MIT Licence. See the README for details.
//

#import "NSTimer+JCSBlocks.h"

@interface JCSTimerBlockHandler : NSObject
@property (nonatomic, strong) id block;
- (void)jcs_handleBlockWithTimer:(NSTimer *)timer;
- (void)jcs_handleBlockWithInterruptableTimer:(NSTimer *)timer;

@end

@implementation NSTimer (JCSBlocks)

+ (NSTimer *)jcs_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats blockHandler:(JCSTimerCallback)block {
	
	JCSTimerBlockHandler *blockHandler = [[JCSTimerBlockHandler alloc] init];
	blockHandler.block = [block copy];
	
    return [self scheduledTimerWithTimeInterval:seconds target:blockHandler selector:@selector(jcs_handleBlockWithTimer:) userInfo:nil repeats:repeats];
}

+ (NSTimer *)jcs_scheduledInterruptableTimerWithTimeInterval:(NSTimeInterval)seconds blockHandler:(JCSInterruptableTimerCallback)block{
	
	JCSTimerBlockHandler *blockHandler = [[JCSTimerBlockHandler alloc] init];
	blockHandler.block = [block copy];
	
    return [self scheduledTimerWithTimeInterval:seconds target:blockHandler selector:@selector(jcs_handleBlockWithInterruptableTimer:) userInfo:nil repeats:YES];
}

@end

@implementation JCSTimerBlockHandler

@synthesize block;

- (void)jcs_handleBlockWithTimer:(NSTimer *)timer {
    
    JCSTimerCallback callbackBlock = self.block;
    
    callbackBlock();
}

- (void)jcs_handleBlockWithInterruptableTimer:(NSTimer *)timer {
    
    JCSInterruptableTimerCallback callbackBlock = self.block;
    
    BOOL stop;
    callbackBlock(&stop);
    
    if (stop) {
        [timer invalidate];
        timer = nil;
    }
}

@end