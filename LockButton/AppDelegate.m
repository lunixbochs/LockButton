//
//  AppDelegate.m
//  LockButton
//
//  Created by Ryan Hileman on 1/17/18.
//  Copyright © 2018 Ryan Hileman. All rights reserved.
//

@import AppKit;
@import ServiceManagement;

#import "AppDelegate.h"

@interface AppDelegate ()

extern void SACLockScreenImmediate(void);

@property (weak) IBOutlet NSWindow *window;
@property (strong, nonatomic) NSStatusItem *statusItem;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    id icon = [NSImage imageNamed:@"StatusIcon"];
    [icon setTemplate:YES];
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusItem.image = icon;
    id button = self.statusItem.button;
    [button setTarget:self];
    [button setAction:@selector(lockScreen:)];
}

- (void)lockScreen:(NSNotification *)_ {
    SACLockScreenImmediate();
}

- (void)toggleStartOnLogin:(NSMenuItem *)item {
    NSString *bundle = @"info.bochs.LockLauncher";
    NSURL *launcherPath = [[[NSBundle mainBundle] bundleURL] URLByAppendingPathComponent:@"Contents/Library/LoginItems/LockLauncher.app"];
    if ((LSRegisterURL((__bridge CFURLRef)launcherPath, true) == noErr) &&
        SMLoginItemSetEnabled((__bridge CFStringRef)(bundle), YES)) {
    }
}

@end
