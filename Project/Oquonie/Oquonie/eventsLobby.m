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
		[self eventDialog:dialogDoorLocked:eventTutorial];
	}
	
	return @"";
}

-(NSString*)event_gateNephtaline :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if(userCharacter == characterNephtaline){
			return @""; // letterUnlocked
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	// Warp
	if(userCharacter == characterNephtaline){
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
			return @""; // letterUnlocked
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	// Warp
	if(userCharacter == characterNeomine){
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
			return @""; // letterUnlocked
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	// Warp
	if(userCharacter == characterNestorine){
		if(userLocation == 7){
			[self eventWarp:locationNestorineEnter :@"0,-1"];
		}
		else if(userLocation == 80){
			[self eventWarp:locationNestorineLobby:@"0,1"];
		}
		else if(userLocation == 34){
			[self eventWarp:@"120" :@"-1,0"];
		}
		else if(userLocation == 120){
			[self eventWarp:@"34":@"1,0"];
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
			return @""; // letterUnlocked
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	// Warp
	if(userCharacter == characterNecomedre){
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

-(NSString*)event_gateNemedique :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if(userCharacter == characterNemedique){
			return @""; // letterUnlocked
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	// Warp
	if(userCharacter == characterNemedique){
		if(userLocation == 50){
			[self eventWarp:locationNephtalinePillar :@"-1,0"];
		}
		else if(userLocation == 121){
			[self eventWarp:@"50" :@"1,0"];
		}
		else if(userLocation == 9){
			[self eventWarp:locationNemediqueEnter :@"1,0"];
		}
		else if(userLocation == 100){
			[self eventWarp:locationNemediqueLobby :@"1,0"];
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
	// Necomedre
	if(userCharacter == characterNephtaline && userLocation == 39){
		[self eventDialog:dialogWarpLobby:@"1"];
		[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(warpLobbyAnimation) userInfo:nil repeats:NO];
	}
	// Nephtaline
	else if(userCharacter == characterNeomine && userLocation == 59){
		[self eventDialog:dialogWarpLobby:@"1"];
		[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(warpLobbyAnimation) userInfo:nil repeats:NO];
	}
	// Neomine
	else if(userCharacter == characterNestorine && userLocation == 70){
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

# pragma mark Pillars -

-(NSString*)event_pillar:(NSString*)option
{
	int pillarInstanceStorageId;
	NSString* pillarInstanceWarp;
	
	if(userLocation == [locationNeominePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNeomine;
		pillarInstanceWarp = locationNeomineLobby;
	}
	else if (userLocation == [locationNecomedrePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNecomedre;
		pillarInstanceWarp = locationNecomedreLobby;
	}
	else if (userLocation == [locationNephtalinePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNephtaline;
		pillarInstanceWarp = locationNephtalineLobby;
	}
	
	// Initial Animation
	if(![option isEqualToString:@"postUpdate"] && ![option isEqualToString:@""] && [userStorageEvents[storageQuestPillarNephtaline] intValue] == 0){
	
		self.userPlayer.alpha = 0;
		[UIView animateWithDuration:2 animations:^(void){
			self.userPlayer.alpha = 1;
		} completion:^(BOOL finished){}];
		
		[self moveDisable:2];
		[self eventDialog:dialogFoundPillar:eventOwl];
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
		[self eventTransitionPan:pillarInstanceWarp:roomCenter];
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
	else if(userLocation == [locationNestorineLobby intValue]){
		socketInstanceStorageId = storageQuestPillarNestorine;
	}
	else if(userLocation == [locationNecomedreLobby intValue]){
		socketInstanceStorageId = storageQuestPillarNecomedre;
	}
	else if(userLocation == [locationNephtalineLobby intValue]){
		socketInstanceStorageId = storageQuestPillarNephtaline;
	}
	else if(userLocation == [locationNemediqueLobby intValue]){
		socketInstanceStorageId = storageQuestPillarNemedique;
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
		if([userStorageEvents[storageQuestRamen] intValue] == 1 && userLocation != 63){
			if(userCharacter == characterNeomine && userLocation == 2 && ![self eventSpellCheck:@"lobbyNecomedre"]){
				return letterNecomedre;
			}
		}
		else if( userLocation == 63 && [userStorageEvents[storageQuestRamen] intValue] == 0 ){
			return letterHelp;
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		// Quest: At his location
		if(userLocation == 63 && [userStorageEvents[storageQuestRamen] intValue] == 0){
			return eventRamen;
		}
		else if(userLocation != 63 && [userStorageEvents[storageQuestRamen] intValue] == 1){
			return eventRamen;
		}
		else{
			return eventRamenSeat;
		}
	}
	
	// Dialogs
	if( userLocation == 63 && [userStorageEvents[storageQuestRamen] intValue] == 0){
		userStorageEvents[storageQuestRamen] = @"1";
		[self eventWarp:userLocationString:userPositionString];
		[self eventDialog:dialogSeeYou:eventRamen];
	}
	else if([userStorageEvents[storageQuestRamen] intValue] == 1){
		if(userCharacter == characterNeomine && userLocation == 2){
			[self eventSpellAdd:@"lobbyNecomedre":spellNecomedre];
		}
	}
	
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
