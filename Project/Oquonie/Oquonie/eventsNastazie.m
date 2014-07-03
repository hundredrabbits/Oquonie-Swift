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

-(NSString*)event_baba :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @""; }		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @""; }		// Broadcast Event Sprite Change
	
	// Dialog
	[self eventDialog:dialogEnd1:eventBaba];
//	[self audioDialogPlayer:@"owl"];
//	[self userSave];
	
	// Return storage Id
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

@end
