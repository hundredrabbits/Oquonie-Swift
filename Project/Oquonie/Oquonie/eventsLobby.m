//
//  xxiivvViewController+eventsLobby.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/7/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "eventsLobby.h"
#import "xxiivvEvents.h"
#import "xxiivvUser.h"

@implementation xxiivvViewController (eventsLobby)

// =======================
// @ Events: Wizards
// =======================

# pragma mark Wizards -

-(int)event_wizard1 :(NSString*)option
{
	int userStorageEventId = 1;
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[userStorageEventId] intValue]<1){
			return 1;
		}
		return 0;
	}
	
	// Dialog
    if([userStorageEvents[userStorageEventId] intValue]>0){
        [self eventDialog:@"AAA":@"1"];
    }
    else{
        [self eventDialog:@"UVW":@"2"];
    }
	
	// Return storage Id
	return userStorageEventId;
}

-(int)event_wizard2 :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[2] intValue]<1){
			return 1;
		}
		return 0;
	}
	
	// Dialog
    if([userStorageEvents[2] intValue]>0){
        [self eventDialog:@"AAA":@"1"];
    }
    else{
        [self eventDialog:@"EGJ":@"1"];
    }
	
	// Return storage Id
	return 2;
}

-(int)event_wizard3 :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[3] intValue]<1){
			return 1;
		}
		return 0;
	}
	
	// Dialog
    if([userStorageEvents[3] intValue]>0){
        [self eventDialog:@"AAA":@"1"];
    }
    else{
        [self eventDialog:@"EGJ":@"1"];
    }
	
	// Return storage Id
	return 3;
}


// =======================
// @ Events: Tips
// =======================

# pragma mark Tips -

-(int)event_spellgiver :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return 50;
	}
	// Dialog
    [self eventDialog:@"UVW":@"7"];
	// Return storage Id
	return 2;
}

-(int)event_owlSave :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return 0;
	}
	// Dialog
    [self eventDialog:@"UVW":@"1"];
	[self userSave];
	
	// Return storage Id
	return 2;
}

-(int)event_tip3 :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return 0;
	}
	// Dialog
    [self eventDialog:@"UVW":@"8"];
	// Return storage Id
	return 2;
}

// =======================
// @ Events: Misc
// =======================

# pragma mark Misc -

-(int)event_colours1 :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return 0;
	}
	// Dialog
    [self eventDialog:@"UVW":@"10"];
	// Return storage Id
	return 2;
}

@end
