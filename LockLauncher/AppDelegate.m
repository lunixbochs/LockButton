//
//  AppDelegate.m
//  LockLauncher
//
//  Created by Ryan Hileman on 1/17/18.
//  Copyright © 2018 Ryan Hileman. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)_ {
    id mainApp = @"info.bochs.LockButton";
    for (id app in [[NSWorkspace sharedWorkspace] runningApplications]) {
        if ([[app bundleIdentifier] isEqualToString:mainApp]) {
            [NSApp terminate:nil];
            return;
        }
    }
    NSArray *path = [[[NSBundle mainBundle] bundlePath] pathComponents];
    NSString *app = [NSString pathWithComponents:[path subarrayWithRange:NSMakeRange(0, [path count] - 4)]];
    [[NSWorkspace sharedWorkspace] launchApplication:app];
    [NSApp terminate:nil];
}


- (void)applicationWillTerminate:(NSNotification *)_ {}

@end

