//
//  xxiivvViewController+eventsLobby.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/7/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "eventsLobby.h"
#import "xxiivvEvents.h"
#import "xxiivvUser.h"

@implementation xxiivvViewController (eventsLobby)

// =======================
// @ Events: Gates
// =======================

# pragma mark Gates -

-(NSString*)event_gateNeomine :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	// Warp
	if(userCharacter == 3){
		if(userLocation == 60){
			[self eventWarp:@"3" :@"1,0"];
		}
		else if(userLocation == 3){
			[self eventWarp:@"60" :@"-1,0"];
		}
	}
	return @"";
}

// =======================
// @ Events: Pillars
// =======================

# pragma mark Wizards -

-(NSString*)event_pillarTest :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	// Default
	return @"";
}

# pragma mark Wizards -

-(NSString*)event_pillarNeomine :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if([userStorageEvents[5] isEqualToString:@"1"]){
			return @"17";
		}
		return @"";
	}
	
	userStorageEvents[5] = @"1";
	[self eventWarp:userLocationString :userPositionString];
	
	
	
	// Default
	return @"";
}

-(NSString*)event_pillarNeomineSocket :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if([userStorageEvents[5] isEqualToString:@"1"]){
			return @"16";
		}
		return @"";
	}
	// Default
	return @"";
}

// =======================
// @ Events: Wizards
// =======================

# pragma mark Wizards -

// =======================
// @ Events: NPCs
// =======================

# pragma mark NPCs -

-(NSString*)event_owlSave :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @""; }		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @""; }		// Broadcast Event Sprite Change
	
	// Dialog
    [self eventDialog:@"UVW":@"1"];
	[self userSave];
	
	// Return storage Id
	return @"";
}

// =======================
// @ Events: Misc
// =======================

# pragma mark Misc -

-(NSString*)event_null :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	// Default
	return @"";
}

@end
