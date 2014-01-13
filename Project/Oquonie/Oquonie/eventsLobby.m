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

-(NSString*)event_gateNephtaline :(NSString*)option
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
	if(userCharacter == 2){
		if(userLocation == 38){
			[self eventWarp:@"39" :@"0,-1"];
		}
		else if(userLocation == 39){
			[self eventWarp:@"38" :@"0,1"];
		}
		else if(userLocation == 1){
			[self eventWarp:@"40" :@"-1,0"];
		}
		else if(userLocation == 40){
			[self eventWarp:@"1" :@"1,0"];
		}
	}
	else{
		[self eventDialog:dialogDoorLocked:@"1"];
	}
	return @"";
}

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
		else if(userLocation == 34){
			[self eventWarp:@"71" :@"-1,1"];
		}
		else if(userLocation == 71){
			[self eventWarp:@"34" :@"1,1"];
		}
	}
	else{
		[self eventDialog:dialogDoorLocked:@"1"];
	}
	return @"";
}

-(NSString*)event_gateNepomucene :(NSString*)option
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
	if(userCharacter == 4){
		if(userLocation == 69){
			[self eventWarp:@"70" :@"0,-1"];
		}
		else if(userLocation == 70){
			[self eventWarp:@"69" :@"0,1"];
		}
	}
	else{
		[self eventDialog:dialogDoorLocked:@"1"];
	}
	
	return @"";
}

-(NSString*)event_gateNecomedre :(NSString*)option
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
	if(userCharacter == 1){
		if(userLocation == 62){
			[self eventWarp:@"71" :@"0,-1"];
		}
		else if(userLocation == 71){
			[self eventWarp:@"62" :@"0,1"];
		}
		else if(userLocation == 5){
			[self eventWarp:@"32" :@"0,-1"];
		}
		else if(userLocation == 32){
			[self eventWarp:@"5" :@"0,1"];
		}
	}
	else{
		[self eventDialog:dialogDoorLocked:@"1"];
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
