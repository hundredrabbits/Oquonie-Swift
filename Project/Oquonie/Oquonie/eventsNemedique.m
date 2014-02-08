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
#import "xxiivvWorld.h"

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
	
	[self audioDialogPlayer:@"nestorine"];
	// If doesn't have the first pillar
	if([userStorageEvents[storageQuestPillarNemedique] intValue] == 0){ [self eventDialog:dialogHavePillarsNot:eventSpriteId]; return @""; }
	// If the wrong character
	if(userCharacter != eventRequirement){ [self eventDialog:eventWrongCharacter:eventSpriteId]; return @""; }
	// If without the ramen guy
	if([userStorageEvents[eventRamenRequirement] intValue] < 1){ [self eventDialog:dialogHaveRamenNot:eventSpriteId]; return @""; }
	
	[self eventSpellAdd:eventSpellId:eventSpell];
	[self eventDialog:eventDialogSpell:eventSpriteId];
	
	return @"";
}

// =======================
// @ Events: NPCs
// =======================

# pragma mark NPCs -

-(NSString*)event_endReset :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @""; }		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"]){ return @"";}
	
	[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(endReset_Trigger) userInfo:nil repeats:NO];
	
	return @"";
}

-(void)endReset_Trigger
{
	[self eventTransitionPan:@"29":@"0,0"];
}

-(NSString*)event_redEnd :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @""; }		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{
		if( [userStorageEvents[storageEndForm] intValue] == 1)
		{
			return eventNepturne;
		}
		return eventRed;
	}
	
	if( ![userStorageEvents[storageEndForm] intValue] == 1)
	{
		userStorageEvents[storageEndForm] = @"1";
		[self roomClearSprites];
		[self roomGenerateEvents];
		[self event_redEnd:@"anything"];
		return @"";
	}
	
	[self moveDisable:8];
	
	// Dialog
	
	[UIView animateWithDuration:5.0 animations:^(void){
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		self.roomContainer.alpha = 0;
	} completion:^(BOOL finished){
		[self eventDialog:dialogEnd1:eventNepturne];
	}];
	
	[UIView animateWithDuration:10.5 animations:^(void){
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		self.parallaxBack.frame = CGRectOffset(self.parallaxBack.frame, 0, -1*screen.size.height+100);
		self.parallaxFront.frame = CGRectOffset(self.parallaxFront.frame, 0, -1*screen.size.height+200);
		self.parallaxBack.alpha = 0;
		self.parallaxFront.alpha = 0;
	} completion:^(BOOL finished){
		[self roomClearDialog];
		
		self.parallaxBack.frame = CGRectOffset(self.parallaxBack.frame, 0, 1*screen.size.height+100);
		self.parallaxFront.frame = CGRectOffset(self.parallaxFront.frame, 0, 1*screen.size.height+200);
		[UIView animateWithDuration:2.5 animations:^(void){
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			self.parallaxBack.frame = parallaxBackOrigin;
			self.parallaxFront.frame = parallaxFrontOrigin;
			self.parallaxBack.alpha = 1;
			self.parallaxFront.alpha = 1;
		} completion:^(BOOL finished){
			[self eventVignette:@"1"];
			[self eventWarp:@"106":@"0,0"];
			
			[UIView animateWithDuration:2.5 animations:^(void){
				[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
				self.roomContainer.alpha = 1;
			} completion:^(BOOL finished){
			}];
		}];
	}];
	
	[UIView animateWithDuration:2.5 animations:^(void){
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	} completion:^(BOOL finished){
	}];
	
	// Return storage Id
	return @"";
}

-(NSString*)event_credit1 :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		NSLog(@"CREDIT PART1");
		return @"";
	}		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @"";}
	return @"";
}
-(NSString*)event_credit2 :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		NSLog(@"CREDIT PART1");
		return @"";
	}		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @"";}
	return @"";
}
-(NSString*)event_credit3 :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		NSLog(@"CREDIT PART1");
		return @"";
	}		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @"";}
	return @"";
}

// =======================
// @ Events: Misc
// =======================

# pragma mark Misc -

@end
