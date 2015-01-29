//
//  xxiivvViewController+eventsLobby.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/7/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvVariables.h"
#import "xxiivvSettings.h"

#import "xxiivvTouch.h"

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
		if( [user character] == characterDocument && [user location] == 29 ){
			return letterDocument;
		}
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if([user character]==characterDocument){
			return @"gateDocument.open";
		}
		else{
			return @"gateDocument.shut";
		}
	}
	
	// Warp
	if([user character] == characterDocument){
		if([user location] == 29){
			[self eventWarp:@"30" :@"0,-1"];
		}
		else if([user location] == 30){
			[self eventWarp:@"29" :@"0,1"];
		}
	}
	else{
		[self eventDialog :eventDialogLocked:eventTutorial];
		[self audioEffectPlayer:@"doorlocked"];
		[self eventSpellRefresh];
	}
	
	return @"";
}

-(NSString*)event_gateNephtaline :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNephtaline);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
        if([user character]==2 && [userStorageEvents[storageQuestPillarNemedique] intValue] != 1 && [user location] == 1 ){
            return letterUnlocked; // letterUnlocked
        }
        // Nestorine Pillar Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNestorine] intValue] != 1 && [user location] == 93 ){
            return letterPillar; // letterUnlocked
        }
        // Lobby Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNephtaline] intValue] != 1 && [user location] == 1 ){
            return letterPillar; // letterUnlocked
        }
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		// Nemedique pillar
		if([user location] == 93 && [userStorageEvents[storageQuestPillarNestorine] intValue] == 1){
			return @"19";
		}
		if([user character]==characterNephtaline || [user character] == 7){
			return @"gateNephtalineOpen";
		}
		else{
			return @"gateNephtalineClosed";
		}
	}
	
	// Nemedique pillar
	if([user location] == 93 && [userStorageEvents[storageQuestPillarNestorine] intValue] == 1){
		return @"";
	}
	
	// Warp
	if([user character] == characterNephtaline || [user character] == 7){
		if([user location] == 38){
			[self eventWarp:@"39" :@"0,-1"];
		}
		else if([user location] == 39){
			[self eventWarp:@"38" :@"0,1"];
		}
		else if([user location] == 1){
			[self eventWarp:@"40" :@"-1,-1"];
		}
		else if([user location] == 40){
			[self eventWarp:@"1" :@"1,0"];
		}
		// Nestorine
		else if([user location] == 93){
			[self eventWarp:@"90" :@"-1,0"];
		}
		else if([user location] == 90){
			[self eventWarp:@"93" :@"1,0"];
		}
		// Nastalize
		else if([user location] ==	141){
			[self eventWarpDramatic:@"144":@"-1,0"];
		}
		else if([user location] == 144){
			[self eventWarp:@"141" :@"1,0"];
		}
	}
	else{
		[self eventDialog:eventDialogLocked:@"1"];
		[self audioEffectPlayer:@"doorlocked"];
		[self eventSpellRefresh];
	}
	return @"";
}

-(NSString*)event_gateNeomine :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNeomine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
        if([user character]==3 && [userStorageEvents[storageQuestPillarNemedique] intValue] != 1 && [user location] == 3 ){
            return letterUnlocked; // letterUnlocked
        }
        // Lobby Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNeomine] intValue] != 1 && [user location] == 3 ){
            return letterPillar; // letterUnlocked
        }
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if([user character]==characterNeomine || [user character] == 7 || [user character] == 8 ){
			return @"gateNeomineOpen";
		}
		else{
			return @"gateNeomineClosed";
		}
	}
	// Warp
	if([user character] == characterNeomine || [user character] == 7 || [user character] == 8){
		if([user location] == 60){
			[self eventWarp:@"3" :@"1,0"];
		}
		else if([user location] == 3){
			[self eventWarp:@"60" :@"-1,0"];
		}
		else if([user location] == 34){
			[self eventWarp:@"71" :@"-1,1"];
		}
		else if([user location] == 71){
			[self eventWarp:@"34" :@"1,1"];
		}
		else if([user location] == 58){
			[self eventWarp:@"59" :@"-1,0"];
		}
		else if([user location] == 59){
			[self eventWarp:@"58" :@"1,0"];
		}
		// Nastalize
		else if([user location] ==	142){
			[self eventWarpDramatic:@"145":@"-1,0"];
		}
		else if([user location] == 145){
			[self eventWarp:@"142" :@"1,0"];
		}
	}
	else{
		[self eventDialog:eventDialogLocked:@"1"];
		[self audioEffectPlayer:@"doorlocked"];
		[self eventSpellRefresh];
	}
	return @"";
}

-(NSString*)event_gateNestorine :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNestorine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
        if([user character]==4 && [userStorageEvents[storageQuestPillarNemedique] intValue] != 1 && [user location] == 7 ){
            return letterUnlocked; // letterUnlocked
        }
        // Necomedre Pillar Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNecomedre] intValue] != 1 && [user location] == 34 ){
            return letterPillar; // letterUnlocked
        }
        // Lobby Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNestorine] intValue] != 1 && [user location] == 7 ){
            return letterPillar; // letterUnlocked
        }
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		// Condemned pillar doors: Neomine
		if([user location] == 34 && [userStorageEvents[storageQuestPillarNecomedre] intValue] == 1){
			return @"25";
		}
		if([user character]==characterNestorine || [user character] == 7){
			return @"gateNestorineOpen";
		}
		else{
			return @"gateNestorineClosed";
		}
	}
	
	// Condemned pillar doors: Neomine
	if([user location] == 34 && [userStorageEvents[storageQuestPillarNecomedre] intValue] == 1){
		return @"";
	}
	
	// Warp
	if([user character] == characterNestorine || [user character] == 7){
		if([user location] == 7){
			[self eventWarpDramatic:@"96" :@"0,-1"];
		}
		else if([user location] == [locationNestorineEnter intValue]){
			[self eventWarp:locationNestorineLobby:@"0,1"];
		}
		else if([user location] == 34){
			[self eventWarp:@"120" :@"-1,0"];
		}
		else if([user location] == 120){
			[self eventWarp:@"34":@"1,0"];
		}
		else if([user location] == 69){
			[self eventWarpDramatic:@"70":@"0,-1"];
		}
		else if([user location] == 70){
			[self eventWarp:@"69":@"0,1"];
		}
	}
	else{
		[self eventDialog:eventDialogLocked:@"1"];
		[self audioEffectPlayer:@"doorlocked"];
		[self eventSpellRefresh];
	}
	
	return @"";
}

-(NSString*)event_gateNecomedre :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNecomedre);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([user character]==1 && [userStorageEvents[storageQuestPillarNemedique] intValue] != 1 && [user location] == 5 ){
			return letterUnlocked; // letterUnlocked
        }
        // Neomine Pillar Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNeomine] intValue] != 1 && [user location] == 62 ){
            return letterPillar;
        }
        // Nemedique Pillar Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 0 && [userStorageEvents[storageQuestPillarNecomedre] intValue] != 1 && [user location] == 101 ){
            return letterPillar; // letterUnlocked
        }
        // Lobby Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNecomedre] intValue] != 1 && [user location] == 5 ){
            return letterPillar; // letterUnlocked
        }
        
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		
		// Nemedique pillar
		if([user location] == 101 && [userStorageEvents[storageQuestPillarNemedique] intValue] == 1){
			return @"13";
		}
		// Neomine pillar
		if([user location] == 62 && [userStorageEvents[storageQuestPillarNeomine] intValue] == 1){
			return @"36";
		}
		
		if([user character]==characterNecomedre || [user character] == 7){
			return @"gateNecomedreOpen";
		}
		else{
			return @"gateNecomedreClosed";
		}
	}
	
	// Condemned pillar doors: Nemedique
	if([user location] == 101 && [userStorageEvents[storageQuestPillarNemedique] intValue] == 1){
		[self eventWarp:@"105":@"0,-1"];
		return @"";
	}
	// Condemned pillar doors: Neomine
	if([user location] == 62 && [userStorageEvents[storageQuestPillarNeomine] intValue] == 1){
		return @"";
	}
	
	// Warp
	if([user character] == characterNecomedre || [user character] == 7){
		if([user location] == 62){
			[self eventWarp:@"71" :@"0,-1"];
		}
		else if([user location] == 71){
			[self eventWarp:@"62" :@"0,1"];
		}
		else if([user location] == 5){
			[self eventWarp:@"32" :@"0,-1"];
		}
		else if([user location] == 32){
			[self eventWarp:@"5" :@"0,1"];
		}
		// Nemedique Pillar
		else if([user location] == 101){
			[self eventWarp:locationNemediquePillar :@"0,-1"];
		}
		else if([user location] == [locationNemediquePillar intValue]){
			[self eventWarp:@"101" :@"0,1"];
		}
	}
	else{
		[self eventDialog:eventDialogLocked:@"1"];
		[self audioEffectPlayer:@"doorlocked"];
		[self eventSpellRefresh];
	}
	return @"";
}

-(NSString*)event_gateNemedique :(NSString*)option
{
	NSString* eventDialogLocked = dialogHaveCharacterNot(letterNemedique);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
        if([user character]==5 && [userStorageEvents[storageQuestPillarNemedique] intValue] != 1 && [user location] == 9 ){
            return letterUnlocked;
        }
        // Nephtaline Pillar Door
        if( [userStorageEvents[storageQuestPillarNemedique] intValue] == 1 && [userStorageEvents[storageQuestPillarNephtaline] intValue] != 1 && [user location] == 50 ){
            return letterPillar;
        }
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		// Nemedique pillar
		if([user character]==5 || [user character] == 7){
			return @"gateNemediqueOpen";
		}
		else{
			return @"gateNemediqueClosed";
		}
	}
	
	// Condemned pillar doors
	if([user location] == 50 && [userStorageEvents[storageQuestPillarNephtaline] intValue] == 1 && [user character] == characterNemedique){
		[self eventWarp:@"117" :@"-1,0"];
		return @"";
	}
	
	// Warp
	if([user character] == characterNemedique || [user character] == 7){
		if([user location] == 50){
			[self eventWarpDramatic:@"121" :@"-1,0"];
			[self eventDialog:dialogInfoPillar:eventOwl];
		}
		else if([user location] == 121){
			[self eventWarp:@"50" :@"1,0"];
		}
		else if([user location] == 9){
			[self eventWarp:locationNemediqueEnter :@"-1,0"];
		}
		else if([user location] == 100){
			[self eventWarp:locationNemediqueLobby :@"1,0"];
		}
		// Nestorine
		else if([user location] == 94){
			[self eventWarpDramatic:@"92":@"0,-1"];
		}
		else if([user location] == 92){
			[self eventWarp:@"94" :@"1,0"];
		}
		// Nastalize
		else if([user location] ==	143){
			[self eventWarpDramatic:@"146":@"-1,0"];
		}
		else if([user location] == 146){
			[self eventWarp:@"143" :@"1,0"];
		}
	}
	else{
		[self eventDialog:eventDialogLocked:@"1"];
		[self audioEffectPlayer:@"doorlocked"];
		[self eventSpellRefresh];
	}
	return @"";
}

-(NSString*)event_gateHiversaires :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if( [userStorageEvents[storageQuestPillarHiversaires] intValue] == 1){
			return @"41";
		}
		return @"";
	}
	
	if( [userStorageEvents[storageQuestPillarHiversaires] intValue] == 1){
		[self eventWarpDramatic:@"148":@"-1,0"];
	}
	else{
		[self eventDialog:@"123":eventOwl];
	}
	
	return @"";
}

-(NSString*)event_gateCatfish:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if([user character] == 7){
			return @"gateCatOpen";
		}
		else{
			return @"gateCatClosed";
		}
	}
	
	// Warp todo: warp to 113(random door warp is missing)
	if([user character] == 7){
        if([user location] == 130){ [self eventWarp:@"131":@"-1,-1"]; }
        else if([user location] == 131){ [self eventWarp:@"130":@"-1,1"]; }
        else if([user location] == 112){ [self eventWarp:@"113":@"0,-1"]; }
	}
    else{
        NSString* eventDialogLocked = dialogHaveCharacterNot(letterCat);
        [self eventDialog:eventDialogLocked:eventOwl];
    }
	
	return @"";
}

-(NSString*)event_gateNastazie :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if([user character] == 8){
			return @"gateNastazieOpen";
		}
		else{
			return @"gateNastazieClosed";
		}
	}
	
	if([user character] == 8){
		if([user location] == 130){ [self eventWarpDramatic:@"147":@"0,-1"]; }
		else if([user location] == 147){ [self eventWarp:@"130":@"0,1"]; }
	}
	
	[self eventDialog:@"123":eventOwl];
	
	return @"";
}


-(NSString*)event_gateEnd:(NSString*)option
{
	// count pillars
	int count = 0;
	if([userStorageEvents[storageQuestPillarNecomedre] intValue] == 1){ count += 1; }
	if([userStorageEvents[storageQuestPillarNemedique] intValue] == 1){ count += 1; }
	if([userStorageEvents[storageQuestPillarNeomine] intValue] == 1){ count += 1; }
	if([userStorageEvents[storageQuestPillarNephtaline] intValue] == 1){ count += 1; }
	if([userStorageEvents[storageQuestPillarNestorine] intValue] == 1){ count += 1; }
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		
		if(count == 5){
			return @"gateRedOpen";
		}
		else{
			return @"gateRedClosed";
		}
	}
	
	if(userGameCompleted == 1 && count == 5){
		[self eventWarp:@"115":@"-1,0"];
	}
	else if(count == 5){
		[self eventWarpDramatic:@"104":@"-1,0"];
		[self apiContact:@"oquonie":@"analytics":@"ending":@"1"];
	}
	else{
		[self eventDialog:dialogHavePillarsNot:eventRed];
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
    [user setState:@"warp"];
	[self moveAnimation];
	[UIView animateWithDuration:0.5 animations:^(void){
		self.userPlayer.frame = [self tileLocation:4:0:0];
        if( [user location] == 80 ){ // Special warp in Nestorine
            self.userPlayer.frame = [self tileLocation:4:1:1];
        }
    } completion:^(BOOL finished){
		[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(userSave) userInfo:nil repeats:NO];
		[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(warpLobbyAnimationSpriteUpdate) userInfo:nil repeats:NO];
		[self eventTransitionPan:locationLobbyLanding:roomCenter];
	}];
}

-(void)warpLobbyAnimationSpriteUpdate
{
	[self userSpriteUpdate:[NSString stringWithFormat:@"char%d.warp.l.f.1.png",[user character]]];
	[user setState:@"warp"];
    [user setHorizontal:@"l"];
    [user setVertical:@"f"];
}

// =======================
// @ Events: Pillars
// =======================

# pragma mark Pillars -

-(NSString*)event_pillar:(NSString*)option
{
	int pillarInstanceStorageId;
	NSString* pillarInstanceWarp;
	
	if([user location] == [locationNeominePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNeomine;
		pillarInstanceWarp = locationNeomineLobby;
	}
	else if ([user location] == [locationNecomedrePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNecomedre;
		pillarInstanceWarp = locationNecomedreLobby;
	}
	else if ([user location] == [locationNephtalinePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNephtaline;
		pillarInstanceWarp = locationNephtalineLobby;
	}
	else if ([user location] == [locationNestorinePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNestorine;
		pillarInstanceWarp = locationNestorineLobby;
	}
	else if ([user location] == [locationNemediquePillar intValue]){
		pillarInstanceStorageId = storageQuestPillarNemedique;
		pillarInstanceWarp = locationNemediqueLobby;
	}
	// Hiversaires
	else if ([user location] == 147){
		pillarInstanceStorageId = storageQuestPillarHiversaires;
		pillarInstanceWarp = locationNeomineLobby;
	}
		
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
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
		[self audioDialogPlayer:@"bump"];
		[self eventDialog:dialogGainPillar:eventOwl];
		[self eventTransitionPan:pillarInstanceWarp:roomCenter];
		// Clear Spellbook
		userSpellbook = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
	}
	else{
		userStorageEvents[pillarInstanceStorageId] = @"0";
	}
    
    if([user location] == [locationNeominePillar intValue]){
        [self apiContact:@"oquonie":@"analytics":@"neomine-pillar":@"1"];
    }
    else if ([user location] == [locationNecomedrePillar intValue]){
        [self apiContact:@"oquonie":@"analytics":@"necomedre-pillar":@"1"];
    }
    else if ([user location] == [locationNephtalinePillar intValue]){
        [self apiContact:@"oquonie":@"analytics":@"nephtaline-pillar":@"1"];
    }
    else if ([user location] == [locationNestorinePillar intValue]){
        [self apiContact:@"oquonie":@"analytics":@"nestorine-pillar":@"1"];
    }
    else if ([user location] == [locationNemediquePillar intValue]){
        [self apiContact:@"oquonie":@"analytics":@"nemedique-pillar":@"1"];
    }
    else if ([user location] == 147){
        [self apiContact:@"oquonie":@"analytics":@"hiversaires-pillar":@"1"];
    }
	
	[self roomStart];
	
	// Default
	return @"";
}

-(NSString*)event_socket :(NSString*)option
{
	int socketInstanceStorageId;
	
	if([user location] == [locationNeomineLobby intValue]){
		socketInstanceStorageId = storageQuestPillarNeomine;
	}
	else if([user location] == [locationNestorineLobby intValue]){
		socketInstanceStorageId = storageQuestPillarNestorine;
	}
	else if([user location] == [locationNecomedreLobby intValue]){
		socketInstanceStorageId = storageQuestPillarNecomedre;
	}
	else if([user location] == [locationNephtalineLobby intValue]){
		socketInstanceStorageId = storageQuestPillarNephtaline;
	}
	else if([user location] == [locationNemediqueLobby intValue]){
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
	[self audioEffectPlayer:@"bump1"];
	
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
	if([user location] == 32){
		self.mapImage.image = [UIImage imageNamed:@"map.1.Necomedre.png"];
	}
	if([user location] == 2){
		self.mapImage.image = [UIImage imageNamed:@"map.1.Lobby.png"];
	}
	if([user location] == 60){
		self.mapImage.image = [UIImage imageNamed:@"map.1.Neomine.png"];
	}
	if([user location] == 50){
		self.mapImage.image = [UIImage imageNamed:@"map.1.Nephtaline.png"];
	}
	if([user location] == 85){
		self.mapImage.image = [UIImage imageNamed:@"map.1.Nestorine.png"];
	}
	
	[self audioEffectPlayer:@"bump1"];
	[UIView animateWithDuration:1 animations:^(void){
		self.mapImage.alpha = 1;
	} completion:^(BOOL finished){
		[self eventDialog:dialogMapHelp:eventOwl];
	}];
	
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

-(NSString*)event_redGhost:(NSString*)option
{
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if([user location] == 31||[user location] == 36||[user location] == 40|[user location] == 68||[user location] == 86){
			return eventRed;
		}
		return @"";
    }
	
	for (UIImageView *subview in [self.spritesContainer subviews]) {
		if(subview.tag != 20){ continue; }
		int tileId = -1;
		while (tileId < 21) {
			tileId += 1;
            
            Tile* tile = [[Tile alloc] initWithString:[room tileAtId:tileId]];
            
			// Lets identify the current subview
			if(![[tile name] isEqualToString:@"redGhost"]){ continue; }
			if( subview.frame.origin.x != [self tileLocation:4:[self flattenTileId:tileId :@"x"]:[self flattenTileId:tileId :@"y"]].origin.x ){ continue;}
			if( subview.frame.origin.y != [self tileLocation:4:[self flattenTileId:tileId :@"x"]:[self flattenTileId:tileId :@"y"]].origin.y ){ continue;}
			
			if( [user location] == 31 && [userStorageEvents[storageGhostOffice] intValue] == 1){ subview.alpha = 0; return @"";}
			if( [user location] == 36 && [userStorageEvents[storageGhostNecomedre] intValue] == 1){ subview.alpha = 0; return @"";}
			if( [user location] == 40 && [userStorageEvents[storageGhostNephtaline] intValue] == 1){ subview.alpha = 0; return @"";}
			if( [user location] == 68 && [userStorageEvents[storageGhostNeomine] intValue] == 1){ subview.alpha = 0; return @"";}
			if( [user location] == 86 && [userStorageEvents[storageGhostNestorine] intValue] == 1){ subview.alpha = 0; return @"";}
			
			[self moveDisable:2];
			
			[UIView animateWithDuration:2 animations:^(void){
				[UIView setAnimationDelay:1];
				subview.alpha = 0;
			} completion:^(BOOL finished){}];
            
            
            
            if([user location] == 31){
                userStorageEvents[storageGhostOffice] = @"1";
            }
            if([user location] == 36){
                userStorageEvents[storageGhostNecomedre] = @"1";
            }
            if([user location] == 40){
                userStorageEvents[storageGhostNephtaline] = @"1";
            }
            if([user location] == 68){
                userStorageEvents[storageGhostNeomine] = @"1";
            }
            if([user location] == 86){
                userStorageEvents[storageGhostNestorine] = @"1";
            }
		}
	}
	return @"";
}

-(NSString*)event_owlSave :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @""; }		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @""; }		// Broadcast Event Sprite Change
	
	// Dialog
    [self eventDialog:dialogOwlSave:eventOwl];
	[self audioDialogPlayer:@"owl"];
	[self userSave];
	
	// Return storage Id
	return @"";
}

-(NSString*)event_shark :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[storageQuestPillarNemedique] intValue] > 0 && [user character] != 1){ return letterConfused;}
		return @"";
	}		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @""; }		// Broadcast Event Sprite Change
	
	if([userStorageEvents[storageQuestPillarNemedique] intValue] > 0 || [user location] == 102){
		
		[self audioDialogPlayer:@"shark"];
	
		[self eventDialog:dialogSharkHelp:eventShark];
		[self moveDisable:4];
		[NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(roomClearDialog) userInfo:nil repeats:NO];
		[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(event_sharkDialog) userInfo:nil repeats:NO];
		[NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(event_sharkTransform) userInfo:nil repeats:NO];
		[NSTimer scheduledTimerWithTimeInterval:3.5 target:self selector:@selector(roomClearDialog) userInfo:nil repeats:NO];
		
		// Clear Spellbook
		userSpellbook = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
	}
	else{
		[self audioDialogPlayer:@"shark"];
		[self eventDialog:dialogSharkTransform:eventShark];
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
	
	if( [user location] == [locationNestorineRamen intValue]){
		ramenStorage = storageQuestRamenNestorine;
	}
	else if( [user location] == [locationNeomineRamen intValue]){
		ramenStorage = storageQuestRamenNeomine;
	}
	else if( [user location] == [locationNecomedreRamen intValue]){
		ramenStorage = storageQuestRamenNecomedre;
	}
	else if( [user location] == [locationNephtalineRamen intValue]){
		ramenStorage = storageQuestRamenNephtaline;
	}
	else if( [user location] == [locationNemediqueRamen intValue]){
		ramenStorage = storageQuestRamenNemedique;
	}
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
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
		[self eventWarp:[user locationString]:userPositionString];
		[self eventDialog:dialogGainRamen:eventRamen];
		[self audioDialogPlayer:@"ramen"];
	}
	
	return @"";
}

-(NSString*)event_ramenLobby :(NSString*)option
{
	int ramenStorage;
	NSString* saySpell;
	int giveSpell;
	
	// Characters Settings
	if([user character] == characterNestorine){
		ramenStorage = storageQuestRamenNestorine;
		saySpell = letterNephtaline;
		giveSpell = spellNephtaline;
	}
	else if([user character] == characterNephtaline){
		ramenStorage = storageQuestRamenNephtaline;
		saySpell = letterNemedique;
		giveSpell = spellNemedique;
	}
	else if([user character] == characterNecomedre){
		ramenStorage = storageQuestRamenNecomedre;
		saySpell = letterNestorine;
		giveSpell = spellNestorine;
	}
	else if([user character] == characterNemedique){
		ramenStorage = storageQuestRamenNemedique;
		saySpell = letterNeomine;
		giveSpell = spellNeomine;
	}
	else if([user character] == characterNeomine){
		ramenStorage = storageQuestRamenNeomine;
		saySpell = letterNecomedre;
		giveSpell = spellNecomedre;
	}
	
	if(userGameCompleted ==1){
		[self audioEffectPlayer:@"ramen"];
		return @"";
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
		[self audioDialogPlayer:@"ramen"];
	}
	
	return @"";
}

-(NSString*)event_speakerphone :(NSString*)option
{
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(self.audioAmbientPlayer.volume<1.0){ return @"22"; }
		else{ return @"9"; }
	}
	
	// Dialogs
	if(self.audioAmbientPlayer.volume<1){
		[self eventAudioToggle:1];
		[self eventDialog:dialogAudioOn:eventAudio];
		[self audioDialogPlayer:@"speakerphone"];
	}
	else{
		[self eventAudioToggle:0];
		[self eventDialog:dialogAudioOff:eventAudio];
		[self audioDialogPlayer:@"speakerphone"];
	}
	
	[self roomStart];
	
	return @"";
}

-(NSString*)event_sauvegarde:(NSString*)option
{
	// lokiva
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	[self eventDialog:dialogHiversaires:eventHiversaires];
	
	return @"";
}

// =======================
// @ Events: Misc
// =======================

# pragma mark Misc -

-(NSString*)event_tree :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		
		// count pillars
		int count = 0;
		if([userStorageEvents[storageQuestPillarNecomedre] intValue] == 1){ count += 1; }
		if([userStorageEvents[storageQuestPillarNemedique] intValue] == 1){ count += 1; }
		if([userStorageEvents[storageQuestPillarNeomine] intValue] == 1){ count += 1; }
		if([userStorageEvents[storageQuestPillarNephtaline] intValue] == 1){ count += 1; }
		if([userStorageEvents[storageQuestPillarNestorine] intValue] == 1){ count += 1; }
		
		if(count == 0){ return @"23";}
		if(count == 1){ return @"24";}
		if(count == 2){ return @"25";}
		if(count == 3){ return @"26";}
		if(count >  3){ return @"27";}
		
		return @"";
	}
	// Default
	return @"";
}

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

-(NSString*)event_courtyard:(NSString*)option
{
	// Broadcast Notification |warp|11|1,0
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	if(userGameCompleted ==1){
		[self eventWarpDramatic:@"116":@"1,0"];
	}
	else{
		[self eventWarpDramatic:@"11":@"1,0"];
		
	}
	
	// Default
	return @"";
}

@end
