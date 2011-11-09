//
//  AppDelegate.h
//  TimerTester
//
//  Created by Abizer Nasir on 08/11/2011.
//  Copyright (c) 2011 Jungle Candy Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong, nonatomic) NSTimer *timer1;
@property (strong, nonatomic) NSTimer *timer2;

@end
