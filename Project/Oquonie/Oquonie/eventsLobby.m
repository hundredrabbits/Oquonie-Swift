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
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterDocument);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(userCharacter==6){
			return @"gateDocument.open";
		}
		else{
			return @"gateDocument.shut";
		}
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
		[self eventDialog:eventDialogLocked:eventTutorial];
		[self eventSpellRefresh];
	}
	
	return @"";
}

-(NSString*)event_gateNephtaline :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNephtaline);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if(userCharacter == characterNephtaline){
			return @""; // letterUnlocked
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(userCharacter==2){
			return @"gateNephtalineOpen";
		}
		else{
			return @"gateNephtalineClosed";
		}
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
		// Nestorine
		else if(userLocation == 93){
			[self eventWarp:@"90" :@"-1,0"];
		}
		else if(userLocation == 90){
			[self eventWarp:@"93" :@"1,0"];
		}
	}
	else{
		[self eventDialog:eventDialogLocked:@"1"];
		[self eventSpellRefresh];
	}
	return @"";
}

-(NSString*)event_gateNeomine :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNeomine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if(userCharacter == characterNeomine){
			return @""; // letterUnlocked
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(userCharacter==3){
			return @"gateNeomineOpen";
		}
		else{
			return @"gateNeomineClosed";
		}
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
		[self eventDialog:eventDialogLocked:@"1"];
		[self eventSpellRefresh];
	}
	return @"";
}

-(NSString*)event_gateNestorine :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNestorine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if(userCharacter==4){
			return @""; // letterUnlocked
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(roomDoorState==1){
			return @"gateNestorineOpen";
		}
		else{
			return @"gateNestorineClosed";
		}
	}
	// Warp
	if(userCharacter == characterNestorine){
		if(userLocation == [locationNestorineLobby intValue]){
			[self eventWarp:locationNestorineEnter :@"0,-1"];
		}
		else if(userLocation == [locationNestorineEnter intValue]){
			[self eventWarp:locationNestorineLobby:@"0,1"];
		}
		else if(userLocation == 34){
			[self eventWarp:@"120" :@"-1,0"];
		}
		else if(userLocation == 120){
			[self eventWarp:@"34":@"1,0"];
		}
		else if(userLocation == 69){
			[self eventWarp:@"70":@"0,-1"];
		}
	}
	else{
		[self eventDialog:eventDialogLocked:@"1"];
		[self eventSpellRefresh];
	}
	
	return @"";
}

-(NSString*)event_gateNecomedre :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNecomedre);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if(userCharacter==1){
			return @""; // letterUnlocked
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(userCharacter==1){
			return @"gateNecomedreOpen";
		}
		else{
			return @"gateNecomedreClosed";
		}
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
		// Nemedique Pillar
		else if(userLocation == 101){
			[self eventWarp:locationNemediquePillar :@"0,-1"];
		}
		else if(userLocation == [locationNemediquePillar intValue]){
			[self eventWarp:@"101" :@"0,1"];
		}
	}
	else{
		[self eventDialog:eventDialogLocked:@"1"];
		[self eventSpellRefresh];
	}
	return @"";
}

-(NSString*)event_gateNemedique :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNemedique);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if(userCharacter == characterNemedique){
			return @""; // letterUnlocked
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(userCharacter==5){
			return @"gateNemediqueOpen";
		}
		else{
			return @"gateNemediqueClosed";
		}
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
		// Nestorine
		else if(userLocation == 94){
			[self eventWarp:@"92":@"0,-1"];
		}
		else if(userLocation == 92){
			[self eventWarp:@"94" :@"1,0"];
		}
	}
	else{
		[self eventDialog:eventDialogLocked:@"1"];
		[self eventSpellRefresh];
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
		return @""; // try with 17 ?
	}
	
	[self eventDialog:dialogWarpLobby:@"1"];
	[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(warpLobbyAnimation) userInfo:nil repeats:NO];
	
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
	else if (userLocation == [locationNestorinePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNestorine;
		pillarInstanceWarp = locationNestorineLobby;
	}
	else if (userLocation == [locationNemediquePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNemedique;
		pillarInstanceWarp = locationNemediqueLobby;
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
		[self eventDialog:dialogGainPillar:eventOwl];
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
	[self eventDialog:dialogMapHelp:eventOwl];
	
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
    [self eventDialog:@"UVW":eventOwl];
	[self userSave];
	
	// Return storage Id
	return @"";
}

-(NSString*)event_shark :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[storageQuestPillarNemedique] intValue] > 0 && userCharacter != 1){ return letterConfused;}
		return @"";
	}		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @""; }		// Broadcast Event Sprite Change
	
	
	if([userStorageEvents[storageQuestPillarNemedique] intValue] > 0 || userLocation == 102){
		// Dialog
		if(userCharacter == 1){
			[self eventDialog:dialogSharkTransform:eventShark];
		}
		else{
			[self eventDialog:dialogSharkHelp:eventShark];
			[self moveDisable:4];
			[NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(roomClearDialog) userInfo:nil repeats:NO];
			[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(event_sharkDialog) userInfo:nil repeats:NO];
			[NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(event_sharkTransform) userInfo:nil repeats:NO];
			[NSTimer scheduledTimerWithTimeInterval:3.5 target:self selector:@selector(roomClearDialog) userInfo:nil repeats:NO];
		}
	}
	
	// Return storage Id
	return @"";
}

-(void)event_sharkDialog
{
	[self eventDialog:dialogSharkTransform:eventShark];
}

-(void)event_sharkTransform
{
	[self eventTranform:1];
}

-(NSString*)event_ramen :(NSString*)option
{
	int ramenStorage;
	
	if( userLocation == [locationNestorineRamen intValue]){
		ramenStorage = storageQuestRamenNestorine;
	}
	else if( userLocation == [locationNeomineRamen intValue]){
		ramenStorage = storageQuestRamenNeomine;
	}
	else if( userLocation == [locationNecomedreRamen intValue]){
		ramenStorage = storageQuestRamenNecomedre;
	}
	else if( userLocation == [locationNephtalineRamen intValue]){
		ramenStorage = storageQuestRamenNephtaline;
	}
	else if( userLocation == [locationNemediqueRamen intValue]){
		ramenStorage = storageQuestRamenNemedique;
	}
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		
		NSLog(@"notif");
		if([userStorageEvents[ramenStorage] intValue] == 0){
			return letterGuide;
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		// Completed
		if([userStorageEvents[ramenStorage] intValue] == 1){
			return eventRamenSeat;
		}
		else{
			return eventRamen;
		}
	}
	
	// Dialogs
	if([userStorageEvents[ramenStorage] intValue] == 0){
		userStorageEvents[ramenStorage] = @"1";
		[self eventWarp:userLocationString:userPositionString];
		[self eventDialog:dialogGainRamen:eventRamen];
	}
	
	return @"";
}

-(NSString*)event_ramenLobby :(NSString*)option
{
	int ramenStorage;
	NSString* saySpell;
	int giveSpell;
	
	// Characters Settings
	if(userCharacter == characterNestorine){
		ramenStorage = storageQuestRamenNestorine;
		saySpell = letterNephtaline;
		giveSpell = spellNephtaline;
	}
	else if(userCharacter == characterNephtaline){
		ramenStorage = storageQuestRamenNephtaline;
		saySpell = letterNemedique;
		giveSpell = spellNemedique;
	}
	else if(userCharacter == characterNecomedre){
		ramenStorage = storageQuestRamenNecomedre;
		saySpell = letterNestorine;
		giveSpell = spellNestorine;
	}
	else if(userCharacter == characterNemedique){
		ramenStorage = storageQuestRamenNemedique;
		saySpell = letterNeomine;
		giveSpell = spellNeomine;
	}
	else if(userCharacter == characterNeomine){
		ramenStorage = storageQuestRamenNeomine;
		saySpell = letterNecomedre;
		giveSpell = spellNecomedre;
	}
	
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[ramenStorage] intValue] == 1 && ![self eventSpellCheck:@"ramenQuestSpell"] ){
			return saySpell;
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		// Completed
		if([userStorageEvents[ramenStorage] intValue] == 1){
			return eventRamen;
		}
		else{
			return eventRamenSeat;
		}
	}
	
	if([userStorageEvents[ramenStorage] intValue] == 1){
		[self eventSpellAdd:@"ramenQuestSpell":giveSpell];
	}
	
	return @"";
}

-(NSString*)event_speakerphone :(NSString*)option
{
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		NSLog(@"%f",self.audioAmbientPlayer.volume);
		if(self.audioAmbientPlayer.volume<1.0){ return letterAudio; }
		else{ return @""; }
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if(self.audioAmbientPlayer.volume<1){
		[self eventAudioToggle:1];
		[self eventDialog:dialogAudioOn:eventAudio];
		[self audioEffectPlayer:@"tic"];
	}
	else{
		[self eventAudioToggle:0];
		[self eventDialog:dialogAudioOff:eventAudio];
		[self audioEffectPlayer:@"tic"];
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
