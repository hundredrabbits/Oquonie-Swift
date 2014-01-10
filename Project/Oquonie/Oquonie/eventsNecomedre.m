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
			return userStorageEventId;
		}
		return 0;
	}
	// Dialog
    if([userStorageEvents[userStorageEventId] intValue]>0){
        [self eventDialog:@"AAA":@"11"];
        [self eventSpell:userStorageEventId:0];
    }
    else{
        [self eventDialog:@"IPX":@"11"];
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
			return userStorageEventId;
		}
		return 0;
	}
	// Dialog
    if([userStorageEvents[userStorageEventId] intValue]>0){
        [self eventDialog:@"AAA":@"11"];
        [self eventSpell:userStorageEventId:0];
    }
    else{
        [self eventDialog:@"UVW":@"11"];
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
			return userStorageEventId;
		}
		return 0;
	}
	// Dialog
    if([userStorageEvents[userStorageEventId] intValue]>0){
        [self eventDialog:@"AAA":@"11"];
        [self eventSpell:userStorageEventId:0];
    }
    else{
        [self eventDialog:@"UVW":@"11"];
        [self eventSpell:userStorageEventId:6];
    }
	// Return storage Id
	return userStorageEventId;
}

-(int)event_speakerphone :(NSString*)option
{
	int userStorageEventId = 1;
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[userStorageEventId] intValue]<1){
			return 0;
		}
		return userStorageEventId;
	}
	// Dialog
    if([userStorageEvents[userStorageEventId] intValue]>0){
        [self eventDialog:@"AAA":@"11"];
        [self eventSpell:userStorageEventId:0];
		[self eventAudioToggle:1];
    }
    else{
        [self eventDialog:@"AAA":@"11"];
        [self eventSpell:userStorageEventId:1];
		[self eventAudioToggle:0];
    }
	return userStorageEventId;
}


-(int)event_tutorialRedDoor :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		return 0;
	}
	[self eventTransitionPan:@"1":@"0,0"];
	
	return 0;
}

-(int)event_tutorialCharacter :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		if(userSpriteCharId == 1){
			return 1;
		}
		return 0;
	}
	if(userSpriteCharId == 1){
		[self eventWarp:@"31" :@"0,0"];
	}
	if(userSpriteCharId == 6){
		[self eventTranform:1];
	}
	
	return 0;
}

-(int)event_tutorialCharacterTransformed :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		return 0;
	}
	[self eventWarp:@"31" :@"0,0"];
	[self eventTranform:1];
	
	return 0;
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
		if( userLocation == 29 ){
			[self eventWarp:@"30":@"0,-1"];
		}
		// Door from side B
		else if ( userLocation == 30 ){
			[self eventWarp:@"29":@"0,1"];
		}
	}
	else{
		[self eventDialog:@"UVW":@"1"];
	}
	return false;
}

@end
