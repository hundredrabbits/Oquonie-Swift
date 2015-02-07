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
#import "xxiivvWorld.h"

@implementation xxiivvViewController (eventsLobby)

// =======================
// @ Events: Gates
// =======================




-(NSString*)event_gateEnd:(NSString*)option
{
	// count pillars
	int count = 0;
	if([user eventExists:storageQuestPillarNecomedre]){ count += 1; }
	if([user eventExists:storageQuestPillarNemedique]){ count += 1; }
	if([user eventExists:storageQuestPillarNeomine]){ count += 1; }
	if([user eventExists:storageQuestPillarNephtaline]){ count += 1; }
	if([user eventExists:storageQuestPillarNestorine]){ count += 1; }
	
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
	
	if( [user isFinished] && count == 5){
		[self eventWarp:@"115":@"-1,0"];
	}
	else if(count == 5){
		[self eventWarpDramatic:@"104":@"-1,0"];
		[self apiContact:@"oquonie":@"analytics":@"ending":@"1"];
	}
	else{
		[newDraw dialog:dialogHavePillarsNot:eventRed];
	}
	
	return @"";
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
		if( [user eventExists: pillarInstanceStorageId]){
			return eventPillarRemains;
		}
		return @"";
	}
	
	// Dialog
	if(![user eventExists: pillarInstanceStorageId]){
        [user eventCollect:pillarInstanceStorageId];
		[newSound play:@"bump"];
		[newDraw dialog:dialogGainPillar:eventOwl];
		[self eventTransitionPan:pillarInstanceWarp:roomCenter];
		// Clear Spellbook
        [user clearSpellbook];
	}
    else{
        [user eventRemove:pillarInstanceStorageId];
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
        [newDraw ]
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
		[newDraw dialog:dialogMapHelp:eventOwl];
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
            
            // TODO
//			if( subview.frame.origin.x != [position tile:4:[room inflateTileId:tileId :@"x"]:[room inflateTileId:tileId :@"y"]].origin.x ){ continue;}
//			if( subview.frame.origin.y != [position tile:4:[room inflateTileId:tileId :@"x"]:[room inflateTileId:tileId :@"y"]].origin.y ){ continue;}
			
			if( [user location] == 31 && [user eventExists:storageGhostOffice]){ subview.alpha = 0; return @"";}
			if( [user location] == 36 && [user eventExists: storageGhostNecomedre]){ subview.alpha = 0; return @"";}
			if( [user location] == 40 && [user eventExists: storageGhostNephtaline]){ subview.alpha = 0; return @"";}
			if( [user location] == 68 && [user eventExists: storageGhostNeomine]){ subview.alpha = 0; return @"";}
			if( [user location] == 86 && [user eventExists: storageGhostNestorine]){ subview.alpha = 0; return @"";}
			
			[self moveDisable:2];
			
			[UIView animateWithDuration:2 animations:^(void){
				[UIView setAnimationDelay:1];
				subview.alpha = 0;
			} completion:^(BOOL finished){}];
            
            
            
            if([user location] == 31){
                [user eventCollect:storageGhostOffice];
            }
            if([user location] == 36){
                [user eventCollect:storageGhostNecomedre];
            }
            if([user location] == 40){
                [user eventCollect:storageGhostNephtaline];
            }
            if([user location] == 68){
                [user eventCollect:storageGhostNeomine];
            }
            if([user location] == 86){
                [user eventCollect:storageGhostNestorine];
            }
		}
	}
	return @"";
}

-(NSString*)event_shark :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		if( [user eventExists:storageQuestPillarNemedique] && [user character] != 1){ return letterConfused;}
		return @"";
	}		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @""; }		// Broadcast Event Sprite Change
	
	if([user eventExists: storageQuestPillarNemedique] || [user location] == 102){
		
		[newSound play:@"shark"];
	
		[newDraw dialog:dialogSharkHelp:eventShark];
		[self moveDisable:4];
		[NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(roomClearDialog) userInfo:nil repeats:NO];
		[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(event_sharkDialog) userInfo:nil repeats:NO];
		[NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(event_sharkTransform) userInfo:nil repeats:NO];
		[NSTimer scheduledTimerWithTimeInterval:3.5 target:self selector:@selector(roomClearDialog) userInfo:nil repeats:NO];
		
		// Clear Spellbook
        [user clearSpellbook];
	}
	else{
		[newSound play:@"shark"];
		[newDraw dialog:dialogSharkTransform:eventShark];
	}
	
	// Return storage Id
	return @"";
}

-(void)event_sharkDialog
{
	[newDraw dialog:dialogSharkTransform:eventShark];
}

-(void)event_sharkTransform
{
	[self eventTranform:1];
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
	
	[newDraw dialog:dialogHiversaires:eventHiversaires];
	
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
	
	if( [user isFinished] ){
		[self eventWarpDramatic:@"116":@"1,0"];
	}
	else{
		[self eventWarpDramatic:@"11":@"1,0"];
		
	}
	
	// Default
	return @"";
}

@end
