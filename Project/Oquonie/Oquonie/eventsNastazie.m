//
//  UIViewController+eventsNastazie.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2014-06-15.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "xxiivvEvents.h"
#import "eventsNastazie.h"

@implementation xxiivvViewController (eventsNastazie)

-(NSString*)event_baba :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @""; }		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @""; }		// Broadcast Event Sprite Change
	
	// Dialog
	[self eventDialog:dialogEnd1:eventBaba];
//	[self audioDialogPlayer:@"owl"];
//	[self userSave];
	
	// Return storage Id
	return @"";
}

@end
