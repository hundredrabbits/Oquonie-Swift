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
// @ Events: Pillars
// =======================

# pragma mark Wizards -

-(NSString*)event_nemediqueNeomine1 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId	= @"nemediqueNeomine1";
	NSString*	eventSpriteId	= eventNeomine;
	int			eventSpell		= spellNeomine;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return letterNeomine;
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
    else											{ [self eventDialog:dialogGiveSpellNemedique:eventSpriteId]; }
	
	// Spell
	[self eventSpellAdd:eventSpellId:eventSpell];
	
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
