//
//  xxiivvViewController+eventsLobby.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/7/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "xxiivvViewController.h"
#import "eventsLobby.h"
#import "xxiivvEvents.h"
#import "xxiivvUser.h"
#import "xxiivvWorld.h"

@implementation xxiivvViewController (eventsLobby)

// =======================
// @ Events: Gates
// =======================

# pragma mark Gates -

-(NSString*)event_gateDocument :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if(userCharacter == characterDocument){
			return letterUnlocked;
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	// Warp
	if(userCharacter == characterDocument){
		if(userLocation == 29){
			[self eventWarp:@"30" :@"0,-1"];
		}
		else if(userLocation == 30){
			[self eventWarp:@"29" :@"0,1"];
		}
	}
	else{
		[self eventDialog:dialogDoorLocked:@"1"];
	}
	
	return @"";
}

-(NSString*)event_gateNephtaline :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if(userCharacter == characterNephtaline){
			return letterUnlocked;
		}
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
		if(userCharacter == characterNeomine){
			return letterUnlocked;
		}
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
		else if(userLocation == 58){
			[self eventWarp:@"59" :@"-1,0"];
		}
		else if(userLocation == 59){
			[self eventWarp:@"58" :@"1,0"];
		}
	}
	else{
		[self eventDialog:dialogDoorLocked:@"1"];
	}
	return @"";
}

-(NSString*)event_gateNestorine :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if(userCharacter == characterNestorine){
			return letterUnlocked;
		}
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
		if(userCharacter == characterNecomedre){
			return letterUnlocked;
		}
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


-(NSString*)event_warpLobby:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"0"; // try with 17 ?
	}
	// Warp
	if(userCharacter == characterNephtaline && userLocation == 39){
		[self eventDialog:dialogWarpLobby:@"1"];
		[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(warpLobbyAnimation) userInfo:nil repeats:NO];
	}
	else if(userCharacter == characterNeomine && userLocation == 59){
		[self eventDialog:dialogWarpLobby:@"1"];
		[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(warpLobbyAnimation) userInfo:nil repeats:NO];
	}
	else{
		[self eventDialog:dialogDoorLocked:@"1"];
	}
	return @"";
}

-(void)warpLobbyAnimation
{
	[self moveAnimation];
	[UIView animateWithDuration:0.5 animations:^(void){
		self.userPlayer.frame = [self tileLocation:4:0:0];
	} completion:^(BOOL finished){
		[self eventTransitionPan:locationLobbyLanding:roomCenter];
	}];
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

-(NSString*)event_pillar:(NSString*)option
{
	int pillarInstanceStorageId;
	
	if(userLocation == [locationNeominePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNeomine;
	}
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( [userStorageEvents[pillarInstanceStorageId] intValue] != 1){
			return letterPillar;
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if( [userStorageEvents[pillarInstanceStorageId] intValue] == 1){
			return eventPillarRemains;
		}
		return @"";
	}
	
	// Dialog
	if([userStorageEvents[pillarInstanceStorageId] intValue] != 1){
		userStorageEvents[pillarInstanceStorageId] = @"1";
		[self eventDialog:dialogTakePillar:eventOwl];
	}
	else{
		userStorageEvents[pillarInstanceStorageId] = @"0";
	}
	
	[self roomClearSprites];
	[self roomGenerateEvents];
	
	// Default
	return @"";
}

-(NSString*)event_socket :(NSString*)option
{
	int socketInstanceStorageId;
	
	if(userLocation == [locationNeomineLobby intValue]){
		socketInstanceStorageId = storageQuestPillarNeomine;
	}
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if([userStorageEvents[socketInstanceStorageId] intValue] == 1){
			return eventPillarAssembled;
		}
		return @"";
	}
	// Dialogs
	if([userStorageEvents[socketInstanceStorageId] intValue] == 1){
		[self eventDialog:dialogInfoPillar:eventOwl];
	}	
	
	// Default
	return @"";
}

-(NSString*)event_map :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	// Dialogs
	[self eventDialog:dialogLookMap:eventOwl];
	
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

-(NSString*)event_ramen :(NSString*)option
{
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if([userStorageEvents[storageQuestRamen] intValue] == 1){
			return eventRamen;
		}
		else{
			return eventRamenSeat;
		}
	}
	
	// Dialogs
	
	return @"";
}

-(NSString*)event_speakerphone :(NSString*)option
{
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[storageAudio] intValue]<1){ return letterAudio; }
		else{ return @""; }
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if([userStorageEvents[storageAudio] intValue]<1){
		[self eventAudioToggle:1];
		[self eventDialog:dialogAudioOn:eventAudio];
	}
	else{
		[self eventAudioToggle:0];
		[self eventDialog:dialogAudioOff:eventAudio];
	}
	
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
