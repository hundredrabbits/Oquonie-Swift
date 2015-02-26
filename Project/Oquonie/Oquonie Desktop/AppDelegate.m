//
//  AppDelegate.m
//  Oquonie Desktop
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)clickWiki:(id)sender
{
	NSURL *url = [NSURL URLWithString:@"http://wiki.xxiivv.com/oquonie"];
	[[NSWorkspace sharedWorkspace] openURL:url];
}

- (IBAction)clickKokorobot:(id)sender
{
	NSURL *url = [NSURL URLWithString:@"http://kokorobot.ca"];
	[[NSWorkspace sharedWorkspace] openURL:url];
}

- (IBAction)clickXxiivv:(id)sender
{
	NSURL *url = [NSURL URLWithString:@"http://xxiivv.com"];
	[[NSWorkspace sharedWorkspace] openURL:url];
}
@end
