//
//  xxiivvViewController+eventsNecomedre.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/7/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "xxiivvEvents.h"
#import "eventsNecomedre.h"

@implementation xxiivvViewController (eventsNecomedre)

// =======================
// @ Events: Gates
// =======================

# pragma mark Gates -

// =======================
// @ Events: Pillars
// =======================

# pragma mark Wizards -

-(NSString*)event_photocopier1 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId	= @"photocopier1";
	NSString*	eventSpriteId	= eventPhotocopier;
	int			eventSpell		= spellDocument;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return letterDocument;
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
    else											{ [self eventDialog:dialogGiveSpellDocument:eventSpriteId]; }
	
	[self eventSpellAdd:eventSpellId:6];
	
	return @"";
}

-(NSString*)event_photocopier2 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId	= @"photocopier2";
	NSString*	eventSpriteId	= eventPhotocopier;
	int			eventSpell		= spellDocument;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return letterDocument;
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
    else											{ [self eventDialog:dialogGiveSpellDocument:eventSpriteId]; }
	
	[self eventSpellAdd:eventSpellId:6];
	
	return @"";
}

-(NSString*)event_photocopier3 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId	= @"photocopier3";
	NSString*	eventSpriteId	= eventPhotocopier;
	int			eventSpell		= spellDocument;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return letterDocument;
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
    else											{ [self eventDialog:dialogGiveSpellDocument:eventSpriteId]; }
	
	[self eventSpellAdd:eventSpellId:6];
	
	return @"";
}

-(NSString*)event_necomedreNephtaline1 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId	= @"necomedreNephtaline1";
	NSString*	eventSpriteId	= eventNephtaline;
	int			eventSpell		= spellNephtaline;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return letterNephtaline;
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

-(NSString*)event_necomedreNephtaline2 :(NSString*)option
{
	
	// Event Identifier
	NSString*	eventSpellId	= @"necomedreNephtaline2";
	NSString*	eventSpriteId	= eventNephtaline;
	int			eventSpell		= spellNephtaline;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return letterNephtaline;
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

-(NSString*)event_necomedreNephtaline3 :(NSString*)option
{
	// Event Identifier
	NSString*	eventSpellId	= @"necomedreNephtaline3";
	NSString*	eventSpriteId	= eventNephtaline;
	int			eventSpell		= spellNephtaline;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return letterNephtaline;
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

-(NSString*)event_tutorialRedDoor :(NSString*)option
{
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	[self eventTransitionPan:@"1":@"0,0"];
	[self eventDialog:dialogSeeYou:eventRed];
	
	return @"";
}

-(NSString*)event_tutorialCharacter :(NSString*)option
{
	// Broadcast Notifications
	if([option isEqualToString:@"postNotification"]){
		if(userLocation == 30){
			if(userCharacter == 6){ return letterHelp; }
			if(userCharacter == 1){ return letterConfused; }
			else{ return @""; }
		}
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		if(userLocation == 31){
			return eventRed;
		}
		return @"";
	}
	
	// Dialogs
	if(userLocation==30){
		if(userCharacter == 6){
			[self eventTranform:1];
			[self eventDialog:dialogThankYou:eventTutorial];
		}
		else if(userCharacter == 1){
			[self eventDialog:dialogConfusion:eventRed];
			[self eventWarp:@"31" :@"0,0"];
			[self eventVignette:@"12"];
		}
		else{
			[self eventDialog:dialogConfusion:eventTutorial];
		}
	}
	
	return @"";
}

@end
