//
//  xxiivvViewController+eventsNestorine.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvVariables.h"
#import "xxiivvSettings.h"
#import "xxiivvEvents.h"
#import "eventsNestorine.h"

@implementation xxiivvViewController (eventsNestorine)

// =======================
// @ Events: Gates
// =======================

# pragma mark Gates -

-(NSString*)event_warpNestorine:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @""; // try with 17 ?
	}
	
	[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(warpNestorineAnimation) userInfo:nil repeats:NO];
	
	return @"";
}

-(void)warpNestorineAnimation
{
    [user setState:@"warp"];
	[self moveAnimation];
	[UIView animateWithDuration:0.5 animations:^(void){
		self.userPlayer.frame = [self tileLocation:4:0:0];
        [user setX:0];
        [user setY:0];
    } completion:^(BOOL finished){
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(warpLobbyAnimationSpriteUpdate) userInfo:nil repeats:NO];
		[self eventTransitionPan:@"80":roomCenter];
	}];
}

// =======================
// @ Events: Pillars
// =======================

# pragma mark Wizards -


-(NSString*)event_nestorineNemedique1 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId	= @"nestorineNemedique1";
	NSString*	eventSpriteId	= eventNemedique;
	int			eventSpell		= spellNemedique;
	NSString* eventDialogSpell = dialogGainSpell(letterNemedique);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
			return letterNemedique;
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if( eventSpell == [user character])				{ [self eventDialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [self eventDialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [self eventDialog:eventDialogSpell:eventSpriteId]; }
	
	// Spell
	[user spellCollect:eventSpellId:eventSpell];
	[self audioDialogPlayer:@"nemedique"];
	
	return @"";
}

-(NSString*)event_nestorineNemedique2 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId	= @"nestorineNemedique2";
	NSString*	eventSpriteId	= eventNemedique;
	int			eventSpell		= spellNemedique;
	NSString* eventDialogSpell = dialogGainSpell(letterNemedique);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
			return letterNemedique;
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if( eventSpell == [user character])				{ [self eventDialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [self eventDialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [self eventDialog:eventDialogSpell:eventSpriteId]; }
	
	// Spell
	[user spellCollect:eventSpellId:eventSpell];
	[self audioDialogPlayer:@"nemedique"];
	
	return @"";
}

-(NSString*)event_nestorineNemedique3 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId	= @"nestorineNemedique3";
	NSString*	eventSpriteId	= eventNemedique;
	int			eventSpell		= spellNemedique;
	NSString* eventDialogSpell = dialogGainSpell(letterNemedique);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
			return letterNemedique;
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if( eventSpell == [user character])				{ [self eventDialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [self eventDialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [self eventDialog:eventDialogSpell:eventSpriteId]; }
	
	// Spell
	[user spellCollect:eventSpellId:eventSpell];
	[self audioDialogPlayer:@"nemedique"];
	
	return @"";
}

-(NSString*)event_nestorineNephtaline1 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"nestorineNephtaline1";
	NSString*	eventDialogSpell	= dialogGainSpell(letterNephtaline);
	NSString*	eventLetter			= letterNephtaline;
	NSString*	eventSpriteId		= eventNephtaline;
	int			eventSpell			= spellNephtaline;
	
	NSString*	eventWrongCharacter	= dialogHaveCharacterNot(letterNestorine);
	int			eventRequirement	= characterNestorine;
	int eventRamenRequirement		= storageQuestRamenNestorine;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		// Must be Nephtaline
		if([user character] != eventRequirement){ return @""; }
		// Must have ramen guy
		if(![user eventExists: eventRamenRequirement]){ return @""; }
		// If doesn't have spell already
		if([user spellExists:eventSpellId]){ return @""; }
		// Have the first pillar
		if(![user eventExists: storageQuestPillarNemedique]){ return @""; }
		// Else
		return eventLetter;
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	[self audioDialogPlayer:@"nephtaline"];
	// If doesn't have the first pillar
	if(![user eventExists: storageQuestPillarNemedique]){ [self eventDialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
	// If the wrong character
	if([user character] != eventRequirement){ [self eventDialog:eventWrongCharacter:eventSpriteId]; return @""; }
	// If without the ramen guy
	if(![user eventExists: eventRamenRequirement]){ [self eventDialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
	
	[user spellCollect:eventSpellId:eventSpell];
	[self eventDialog:eventDialogSpell:eventSpriteId];
	
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

// =======================
// @ Events: Misc
// =======================

# pragma mark Misc -

@end
