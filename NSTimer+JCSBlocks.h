//
//  NSTimer+JCSBlocks.h
//  atime
//
//  Created by Abizer Nasir on 26/08/11
//  Copyright 2011 Jungle Candy Software. All rights reserved.
//  Licences under the MIT Licence. See the README for details.
//
//  Additions to NSTimer that allow it to use blocks as callbacks
//  Requires compilation with ARC

#import <Foundation/NSTimer.h>

/** An NSTimer Extension that runs a block when the timer is fired.
 
 Blocks are frequently more convenient to use instead of callbacks. They appear in the same context as the code that calls
 them and, and it's easier to pass state information to them at the same time.
 
 This extension creates two methods, one which creates an optionally repeating timer which fires a block, and the other creates
 a repeating timer but passes a reference to a stop parameter to the block so the timer can be stopped from within the block.
 
*/
typedef void (^JCSTimerCallback)();
typedef void (^JCSInterruptableTimerCallback)(BOOL *stop);

@interface NSTimer (JCSBlocks)

/** Create an optionally repeating timer with a block to run when the timer is fired.
 
 @return An NSTimer that will fire events as configured.
 @param seconds NSInterval. The number of seconds between the the firing of the timer.
 @param repeats BOOL. Whether the timer should be repeating or not.
 @param block A block which has a void return and takes no paramaters. This is run whenever the timer fires.
 
 The type is JCSTimerCallback which is defined as:
 
     typedef void (^JCSTimerCallback)();
 
 */
+ (NSTimer *)jcs_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats blockHandler:(JCSTimerCallback)block;


/** Create a repeating timer which can be stopped from within the passed block
 
 @return An NSTimer that will fire events as configured.
 @param seconds NSInterval. The number of seconds between the the firing of the timer.
 @param block A block which has a void return but has a `BOOL *stop` parameter.
 
 Setting this parameter to `NO` from within the block will prevent any more events to be fired by the timer. 
 Additionally, the timer will be invalidated and set to nil when it is stopped this way.
 
 The type is JCSInterruptableTimerCallback which is defined as 
 
     typedef void (^JCSInterruptableTimerCallback)(BOOL *stop);
 
 */
+ (NSTimer *)jcs_scheduledInterruptableTimerWithTimeInterval:(NSTimeInterval)seconds blockHandler:(JCSInterruptableTimerCallback)block;

@end
