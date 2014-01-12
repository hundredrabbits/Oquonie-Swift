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

-(NSString*)event_neomineNepomucene1 :(NSString*)option
{
	// Event Identifier
	NSString *eventSpellId = @"neomineNepomucene1";
	NSString*	eventSpriteId = @"5";
	int			eventSpell = 4;
	
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
    else											{ [self eventDialog:dialogGiveSpellNeomine:eventSpriteId]; }
	
	// Spell
	[self eventSpellAdd:eventSpellId:4];
	
	return @"";
}

-(NSString*)event_neomineNepomucene2 :(NSString*)option
{
	// Event Identifier
	NSString *eventSpellId = @"neomineNepomucene2";
	NSString*	eventSpriteId = @"5";
	int			eventSpell = 4;
	
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
    else											{ [self eventDialog:dialogGiveSpellNeomine:eventSpriteId]; }
	
	// Spell
	[self eventSpellAdd:eventSpellId:4];
	
	return @"";
}

-(NSString*)event_neomineNepomucene3 :(NSString*)option
{
	// Event Identifier
	NSString *eventSpellId = @"neomineNepomucene3";
	NSString*	eventSpriteId = @"5";
	int			eventSpell = 4;
	
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
    else											{ [self eventDialog:dialogGiveSpellNeomine:eventSpriteId]; }
	
	
	// Spell
	[self eventSpellAdd:eventSpellId:eventSpell];
	
	return @"";
}


-(NSString*)event_neomineNecomedre1 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId = @"neomineNecomedre1";
	NSString*	eventSpriteId = @"2";
	int			eventSpell = 1;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return @"D";
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
    else											{ [self eventDialog:dialogGiveSpellNecomedre:eventSpriteId]; }
	
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
