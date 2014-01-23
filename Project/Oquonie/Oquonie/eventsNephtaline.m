//
//  xxiivvViewController+eventsNephtaline.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

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
	NSString*	eventSpriteId = @"4";
	int			eventSpell = 3;
	NSString* eventDialogSpell = dialogGainSpell(letterNeomine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return @"E";
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
-(NSString*)event_nephtalineNeomine2 :(NSString*)option
{
	// Event Identifier
	NSString *eventSpellId = @"nephtalineNeomine2";
	NSString*	eventSpriteId = @"4";
	int			eventSpell = 3;
	NSString* eventDialogSpell = dialogGainSpell(letterNeomine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return @"E";
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

-(NSString*)event_nephtalineNeomine3 :(NSString*)option
{
	// Event Identifier
	NSString *eventSpellId = @"nephtalineNeomine3";
	NSString*	eventSpriteId = @"4";
	int			eventSpell = 3;
	NSString* eventDialogSpell = dialogGainSpell(letterNeomine);
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return @"E";
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
