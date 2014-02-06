//
//  xxiivvViewController+eventsNeophine.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "xxiivvEvents.h"
#import "eventsNeomine.h"

@implementation xxiivvViewController (eventsNeomine)

// =======================
// @ Events: Gates
// =======================

# pragma mark Gates -

// =======================
// @ Events: Pillars
// =======================

# pragma mark Pillars -

// =======================
// @ Events: Wizards
// =======================

# pragma mark Wizards -

-(NSString*)event_neomineNestorine1 :(NSString*)option
{
	// Event Identifier
	NSString *eventSpellId = @"neomineNestorine1";
	NSString*	eventSpriteId = @"5";
	int			eventSpell = 4;
	
	NSString* eventDialogSpell = dialogGainSpell(letterNestorine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return @"B";
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if( eventSpell == userCharacter)				{ [self eventDialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [self eventSpellCheck:eventSpellId] )	{ [self eventDialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [self eventDialog:eventDialogSpell:eventSpriteId]; }
	
	// Spell
	[self eventSpellAdd:eventSpellId:4];
	[self audioDialogPlayer:@"nestorine"];
	
	return @"";
}

-(NSString*)event_neomineNestorine2 :(NSString*)option
{
	// Event Identifier
	NSString *eventSpellId = @"neomineNestorine2";
	NSString*	eventSpriteId = @"5";
	int			eventSpell = 4;
	NSString* eventDialogSpell = dialogGainSpell(letterNestorine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return @"B";
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if( eventSpell == userCharacter)				{ [self eventDialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [self eventSpellCheck:eventSpellId] )	{ [self eventDialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [self eventDialog:eventDialogSpell:eventSpriteId]; }
	
	// Spell
	[self eventSpellAdd:eventSpellId:4];
	
	return @"";
}

-(NSString*)event_neomineNestorine3 :(NSString*)option
{
	// Event Identifier
	NSString *eventSpellId = @"neomineNestorine3";
	NSString*	eventSpriteId = @"5";
	int			eventSpell = 4;
	NSString* eventDialogSpell = dialogGainSpell(letterNestorine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return @"B";
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	// Dialogs
	if( eventSpell == userCharacter)				{ [self eventDialog:dialogHaveCharacter:eventSpriteId]; }
    else if( [self eventSpellCheck:eventSpellId] )	{ [self eventDialog:dialogHaveSpell:eventSpriteId]; }
    else											{ [self eventDialog:eventDialogSpell:eventSpriteId]; }
	
	
	// Spell
	[self eventSpellAdd:eventSpellId:eventSpell];
	[self audioDialogPlayer:@"nestorine"];
	
	return @"";
}

-(NSString*)event_neomineNecomedre1 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"neomineNecomedre1";
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
		if(userCharacter != eventRequirement){ return @""; }
		// Must have ramen guy
		if([userStorageEvents[eventRamenRequirement] intValue] < 1){ return @""; }
		// If doesn't have spell already
		if([self eventSpellCheck:eventSpellId]){ return @""; }
		// Have the first pillar
		if([userStorageEvents[storageQuestPillarNemedique] intValue] == 0){ return @""; }
		// Else
		return eventLetter;
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	[self audioDialogPlayer:@"necomedre"];
	// If the wrong character
	if(userCharacter != eventRequirement){ [self eventDialog:eventWrongCharacter:eventSpriteId]; return @""; }
	// If without the ramen guy
	if([userStorageEvents[eventRamenRequirement] intValue] < 1){ [self eventDialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
	// If have spell already
	if([self eventSpellCheck:eventSpellId]){ [self eventDialog:dialogHaveCharacter:eventSpriteId]; return @""; }
	// If doesn't have the first pillar
	if([userStorageEvents[storageQuestPillarNemedique] intValue] == 0){ [self eventDialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
	
	[self eventSpellAdd:eventSpellId:eventSpell];
	[self eventDialog:eventDialogSpell:eventSpriteId];
	
	return @"";
}

-(NSString*)event_neomineNephtaline1 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"neomineNephtaline1";
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
		if(userCharacter != eventRequirement){ return @""; }
		// Must have ramen guy
		if([userStorageEvents[eventRamenRequirement] intValue] < 1){ return @""; }
		// If doesn't have spell already
		if([self eventSpellCheck:eventSpellId]){ return @""; }
		// Have the first pillar
		if([userStorageEvents[storageQuestPillarNemedique] intValue] == 0){ return @""; }
		// Else
		return eventLetter;
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	[self audioDialogPlayer:@"nephtaline"];
	// If the wrong character
	if(userCharacter != eventRequirement){ [self eventDialog:eventWrongCharacter:eventSpriteId]; return @""; }
	// If without the ramen guy
	if([userStorageEvents[eventRamenRequirement] intValue] < 1){ [self eventDialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
	// If have spell already
	if([self eventSpellCheck:eventSpellId]){ [self eventDialog:dialogHaveCharacter:eventSpriteId]; return @""; }
	// If doesn't have the first pillar
	if([userStorageEvents[storageQuestPillarNemedique] intValue] == 0){ [self eventDialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
	
	[self eventSpellAdd:eventSpellId:eventSpell];
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
