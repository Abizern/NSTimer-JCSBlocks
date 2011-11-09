//
//  AppDelegate.m
//  TimerTester
//
//  Created by Abizer Nasir on 08/11/2011.
//  Copyright (c) 2011 Jungle Candy Software. All rights reserved.
//

#import "AppDelegate.h"
#import "NSTimer+JCSBlocks.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize timer1 = _timer1;
@synthesize timer2 = _timer2;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    __block NSInteger count = 0;
    
    // This timer will fire continuously
    self.timer1 = [NSTimer jcs_scheduledTimerWithTimeInterval:1.5 repeats:YES blockHandler:^{
        NSLog(@"Hello World");
        
        // Will randomly set the __block variable count to 8 to stop the second timer.
        NSInteger value = arc4random() % 3;
        if (value == 2) {
            count = 8;
        }
    }];
    
    // This timer will fire until the `count` variable becomes 8. either by being set within the block,
    // or from elsewhere.
    self.timer2 = [NSTimer jcs_scheduledInterruptableTimerWithTimeInterval:1 blockHandler:^(BOOL *stop){
        count++;
        NSLog(@"Hello Universe: %ld", count);
        
        if (count >= 8) {
            *stop = YES;
        }
    }];
    
}

@end
