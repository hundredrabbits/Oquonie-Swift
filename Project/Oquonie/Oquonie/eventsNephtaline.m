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
    else											{ [self eventDialog:dialogGiveSpellNeomine:eventSpriteId]; }
	
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
    else											{ [self eventDialog:dialogGiveSpellNeomine:eventSpriteId]; }
	
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
    else											{ [self eventDialog:dialogGiveSpellNeomine:eventSpriteId]; }
	
	// Spell
	[self eventSpellAdd:eventSpellId:eventSpell];
	
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
