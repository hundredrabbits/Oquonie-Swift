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

@end
