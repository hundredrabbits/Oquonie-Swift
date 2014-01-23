//
//  xxiivvViewController+eventsNemedique.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "xxiivvEvents.h"
#import "eventsNemedique.h"

@implementation xxiivvViewController (eventsNemedique)

// =======================
// @ Events: Gates
// =======================

# pragma mark Gates -

// =======================
// @ Events: Wizards
// =======================

# pragma mark Wizards -


-(NSString*)event_nemediqueNestorine1 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"nemediqueNestorine1";
	NSString*	eventDialogSpell	= dialogGainSpell(letterNestorine);
	NSString*	eventLetter			= letterNestorine;
	NSString*	eventSpriteId		= eventNestorine;
	int			eventSpell			= spellNestorine;
	
	NSString*	eventWrongCharacter	= dialogHaveCharacterNot(letterNecomedre);
	int			eventRequirement	= characterNecomedre;
	int eventRamenRequirement		= storageQuestRamenNecomedre;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell && userCharacter == eventRequirement && [userStorageEvents[eventRamenRequirement] intValue] > 0){ return eventLetter; }
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
