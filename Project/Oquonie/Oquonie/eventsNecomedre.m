//
//  xxiivvViewController+eventsNecomedre.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/7/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvEvents.h"

#import "eventsNecomedre.h"

@implementation xxiivvViewController (eventsNecomedre)

-(int)event_photocopier1 :(NSString*)option
{
	int userStorageEventId = 10;
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
        [self eventSpell:userStorageEventId:6];
    }
	// Return storage Id
	return userStorageEventId;
}

-(int)event_photocopier2 :(NSString*)option
{
	int userStorageEventId = 11;
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
        [self eventSpell:userStorageEventId:6];
    }
	// Return storage Id
	return userStorageEventId;
}

-(int)event_photocopier3 :(NSString*)option
{
	int userStorageEventId = 12;
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
        [self eventSpell:userStorageEventId:6];
    }
	// Return storage Id
	return userStorageEventId;
}

-(int)event_photocopierDoor :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		if(userSpriteCharId == 6){
		}
		return 0;
	}
	if(userSpriteCharId == 6){
		// Door from side A
		if( userLocation == 19 ){
			[self eventWarp:@"20":@"0,-1"];
		}
		// Door from side B
		else if ( userLocation == 20 ){
			[self eventWarp:@"19":@"0,1"];
		}
	}
	else{
		[self eventDialog:@"UVW":@"1"];
	}
	return false;
}

@end
