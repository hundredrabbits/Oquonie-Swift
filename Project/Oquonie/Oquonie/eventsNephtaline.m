//
//  xxiivvViewController+eventsNephtaline.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvVariables.h"
#import "xxiivvSettings.h"
#import "xxiivvEvents.h"
#import "eventsNephtaline.h"

@implementation xxiivvViewController (eventsNephtaline)

// =======================
// @ Events: Gates
// =======================

# pragma mark Gates -

// =======================
// @ Events: Pillars
// =======================

# pragma mark Wizards -


// =======================
// @ Events: Wizards
// =======================

# pragma mark Wizards -

-(NSString*)event_nephtalineNeomine1 :(NSString*)option
{
	// Event Identifier
	NSString *eventSpellId = @"nephtalineNeomine1";
	NSString *eventSpriteId = @"4";
	int		  eventSpell = 3;
	NSString *eventDialogSpell = dialogGainSpell(letterNeomine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
			return @"E";
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if( eventSpell == [user character])			{ [self eventDialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [self eventDialog:dialogHaveSpell:eventSpriteId]; }
    else										{ [self eventDialog:eventDialogSpell:eventSpriteId]; }
	
	// Spell
	[user spellCollect:eventSpellId:eventSpell];
	[self audioDialogPlayer:@"neomine"];
	
	return @"";
}
-(NSString*)event_nephtalineNeomine2 :(NSString*)option
{
	// Event Identifier
	NSString *eventSpellId = @"nephtalineNeomine2";
	NSString*	eventSpriteId = @"4";
	int			eventSpell = 3;
	NSString* eventDialogSpell = dialogGainSpell(letterNeomine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
			return @"E";
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
	[self audioDialogPlayer:@"neomine"];
	
	return @"";
}

-(NSString*)event_nephtalineNeomine3 :(NSString*)option
{
	// Event Identifier
	NSString *eventSpellId = @"nephtalineNeomine3";
	NSString*	eventSpriteId = @"4";
	int			eventSpell = 3;
	NSString* eventDialogSpell = dialogGainSpell(letterNeomine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![user spellExists:eventSpellId] && [user character] != eventSpell ){
			return @"E";
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if( eventSpell == [user character] )				{ [self eventDialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [user spellExists:eventSpellId] )	{ [self eventDialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [self eventDialog:eventDialogSpell:eventSpriteId]; }
	
	// Spell
	[user spellCollect:eventSpellId:eventSpell];
	[self audioDialogPlayer:@"neomine"];
	
	return @"";
}

-(NSString*)event_nephtalineNemedique1 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"nephtalineNemedique1";
	NSString*	eventDialogSpell	= dialogGainSpell(letterNemedique);
	NSString*	eventLetter			= letterNemedique;
	NSString*	eventSpriteId		= eventNemedique;
	int			eventSpell			= spellNemedique;
	
	NSString*	eventWrongCharacter	= dialogHaveCharacterNot(letterNephtaline);
	int			eventRequirement	= characterNephtaline;
	int eventRamenRequirement		= storageQuestRamenNephtaline;
	
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
	
	[self audioDialogPlayer:@"nemedique"];
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

-(NSString*)event_nephtalineNecomedre1 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"necomedreNecomedre1";
	NSString*	eventDialogSpell	= dialogGainSpell(letterNecomedre);
	NSString*	eventLetter			= letterNecomedre;
	NSString*	eventSpriteId		= eventNecomedre;
	int			eventSpell			= spellNecomedre;
	
	NSString*	eventWrongCharacter	= dialogHaveCharacterNot(letterNeomine);
	int			eventRequirement	= characterNeomine;
	int eventRamenRequirement		= storageQuestRamenNeomine;
	
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
	
	[self audioDialogPlayer:@"necomedre"];
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
// @ Events: NPCs
// =======================

# pragma mark NPCs -

// =======================
// @ Events: Misc
// =======================

# pragma mark Misc -

@end
