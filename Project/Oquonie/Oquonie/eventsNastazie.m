//
//  UIViewController+eventsNastazie.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2014-06-15.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "xxiivvEvents.h"
#import "eventsNastazie.h"

@implementation xxiivvViewController (eventsNastazie)

-(NSString*)event_nastazieNastazie1 :(NSString*)option
{
	// Event Identifier
	NSString * eventSpellId		= @"nastazieNastazie1";
	NSString * eventCharacter	= @"nastazie";
	NSString * eventSpriteId	= eventNastazie;
	int		   eventSpell		= spellNastazie;
	NSString * eventLetter		= letterNastazie;
	
	NSString * eventDialogSpell = dialogGainSpell(eventLetter);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return eventLetter;
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
	[self audioDialogPlayer:eventCharacter];
	
	return @"";
}

-(NSString*)event_nastazieNastazie2 :(NSString*)option
{
	// Event Identifier
	NSString * eventSpellId		= @"nastazieNastazie2";
	NSString * eventCharacter	= @"nastazie";
	NSString * eventSpriteId	= eventNastazie;
	int		   eventSpell		= spellNastazie;
	NSString * eventLetter		= letterNastazie;
	
	NSString * eventDialogSpell = dialogGainSpell(eventLetter);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return eventLetter;
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
	[self audioDialogPlayer:eventCharacter];
	
	return @"";
}

-(NSString*)event_nastazieNastazie3 :(NSString*)option
{
	// Event Identifier
	NSString * eventSpellId		= @"nastazieNastazie3";
	NSString * eventCharacter	= @"nastazie";
	NSString * eventSpriteId	= eventNastazie;
	int		   eventSpell		= spellNastazie;
	NSString * eventLetter		= letterNastazie;
	
	NSString * eventDialogSpell = dialogGainSpell(eventLetter);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return eventLetter;
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
	[self audioDialogPlayer:eventCharacter];
	
	return @"";
}

-(NSString*)event_nastazieNemedique1 :(NSString*)option
{
	// Event Identifier
	NSString * eventSpellId		= @"nastazieNemedique1";
	NSString * eventCharacter	= @"nemedique";
	NSString * eventSpriteId	= eventNemedique;
	int		   eventSpell		= spellNemedique;
	NSString * eventLetter		= letterNemedique;
	
	NSString * eventDialogSpell = dialogGainSpell(eventLetter);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return eventLetter;
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
	[self audioDialogPlayer:eventCharacter];
	
	return @"";
}

-(NSString*)event_nastazieNemedique2 :(NSString*)option
{
	// Event Identifier
	NSString * eventSpellId		= @"nastazieNemedique2";
	NSString * eventCharacter	= @"nemedique";
	NSString * eventSpriteId	= eventNemedique;
	int		   eventSpell		= spellNemedique;
	NSString * eventLetter		= letterNemedique;
	
	NSString * eventDialogSpell = dialogGainSpell(eventLetter);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return eventLetter;
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
	[self audioDialogPlayer:eventCharacter];
	
	return @"";
}

-(NSString*)event_nastazieNemedique3 :(NSString*)option
{
	// Event Identifier
	NSString * eventSpellId		= @"nastazieNemedique3";
	NSString * eventCharacter	= @"nemedique";
	NSString * eventSpriteId	= eventNemedique;
	int		   eventSpell		= spellNemedique;
	NSString * eventLetter		= letterNemedique;
	
	NSString * eventDialogSpell = dialogGainSpell(eventLetter);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return eventLetter;
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
	[self audioDialogPlayer:eventCharacter];
	
	return @"";
}

-(NSString*)event_nastazieNeomine1 :(NSString*)option
{
	// Event Identifier
	NSString * eventSpellId		= @"nastazieNeomine1";
	NSString * eventCharacter	= @"neomine";
	NSString * eventSpriteId	= eventNeomine;
	int		   eventSpell		= spellNeomine;
	NSString * eventLetter		= letterNeomine;
	
	NSString * eventDialogSpell = dialogGainSpell(eventLetter);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return eventLetter;
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
	[self audioDialogPlayer:eventCharacter];
	
	return @"";
}
-(NSString*)event_nastazieNeomine2 :(NSString*)option
{
	// Event Identifier
	NSString * eventSpellId		= @"nastazieNeomine2";
	NSString * eventCharacter	= @"neomine";
	NSString * eventSpriteId	= eventNeomine;
	int		   eventSpell		= spellNeomine;
	NSString * eventLetter		= letterNeomine;
	
	NSString * eventDialogSpell = dialogGainSpell(eventLetter);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return eventLetter;
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
	[self audioDialogPlayer:eventCharacter];
	
	return @"";
}
-(NSString*)event_nastazieNeomine3 :(NSString*)option
{
	// Event Identifier
	NSString * eventSpellId		= @"nastazieNeomine3";
	NSString * eventCharacter	= @"neomine";
	NSString * eventSpriteId	= eventNeomine;
	int		   eventSpell		= spellNeomine;
	NSString * eventLetter		= letterNeomine;
	
	NSString * eventDialogSpell = dialogGainSpell(eventLetter);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return eventLetter;
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
	[self audioDialogPlayer:eventCharacter];
	
	return @"";
}

-(NSString*)event_nastazieNephtaline1 :(NSString*)option
{
	// Event Identifier
	NSString * eventSpellId		= @"nastazieNephtaline1";
	NSString * eventCharacter	= @"nephtaline";
	NSString * eventSpriteId	= eventNephtaline;
	int		   eventSpell		= spellNephtaline;
	NSString * eventLetter		= letterNephtaline;
	
	NSString * eventDialogSpell = dialogGainSpell(eventLetter);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return eventLetter;
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
	[self audioDialogPlayer:eventCharacter];
	
	return @"";
}

-(NSString*)event_nastazieNephtaline2 :(NSString*)option
{
	// Event Identifier
	NSString * eventSpellId		= @"nastazieNephtaline2";
	NSString * eventCharacter	= @"nephtaline";
	NSString * eventSpriteId	= eventNephtaline;
	int		   eventSpell		= spellNephtaline;
	NSString * eventLetter		= letterNephtaline;
	
	NSString * eventDialogSpell = dialogGainSpell(eventLetter);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return eventLetter;
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
	[self audioDialogPlayer:eventCharacter];
	
	return @"";
}

-(NSString*)event_nastazieNephtaline3 :(NSString*)option
{
	// Event Identifier
	NSString * eventSpellId		= @"nastazieNephtaline3";
	NSString * eventCharacter	= @"nephtaline";
	NSString * eventSpriteId	= eventNephtaline;
	int		   eventSpell		= spellNephtaline;
	NSString * eventLetter		= letterNephtaline;
	
	NSString * eventDialogSpell = dialogGainSpell(eventLetter);
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userCharacter != eventSpell ){
			return eventLetter;
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
	[self audioDialogPlayer:eventCharacter];
	
	return @"";
}

@end
