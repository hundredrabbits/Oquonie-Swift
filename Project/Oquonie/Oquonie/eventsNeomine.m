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
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell && userCharacter == eventRequirement){ return eventLetter; }
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	// Dialog
	if( eventSpell == userCharacter)				{ [self eventDialog:dialogHaveCharacter:eventSpriteId]; }		// Dialog: Already character
	else if(userCharacter != eventRequirement)		{ [self eventDialog:eventWrongCharacter:eventSpriteId]; }		// If the right character
	else if([userStorageEvents[eventRamenRequirement] intValue] < 1)	{ [self eventDialog:dialogHaveRamenNot:eventSpriteId]; }		// The ramen spell is unaccessible
    else{
		[self eventSpellAdd:eventSpellId:eventSpell];
		[self eventDialog:eventDialogSpell:eventSpriteId];
	}
	
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
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell && userCharacter == eventRequirement){ return eventLetter; }
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	// Dialog
	if( eventSpell == userCharacter)				{ [self eventDialog:dialogHaveCharacter:eventSpriteId]; }		// Dialog: Already character
	else if(userCharacter != eventRequirement)		{ [self eventDialog:eventWrongCharacter:eventSpriteId]; }		// If the right character
	else if([userStorageEvents[eventRamenRequirement] intValue] < 1)	{ [self eventDialog:dialogHaveRamenNot:eventSpriteId]; }		// The ramen spell is unaccessible
    else{
		[self eventSpellAdd:eventSpellId:eventSpell];
		[self eventDialog:eventDialogSpell:eventSpriteId];
	}
	
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
