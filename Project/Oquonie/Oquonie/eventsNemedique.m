//
//  xxiivvViewController+eventsNemedique.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvViewController.h"
#import "xxiivvSettings.h"
#import "xxiivvEvents.h"
#import "eventsNemedique.h"
#import "xxiivvWorld.h"
#import "xxiivvUser.h"

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
	
	[self moveDisable:10];
	
	[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(endReset_Trigger) userInfo:nil repeats:NO];
	
	[UIView animateWithDuration:5 animations:^(void){
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		self.spritesContainer.alpha = 0;
	} completion:^(BOOL finished){}];
	
	return @"";
}

-(void)endReset_Trigger
{
	NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
	[[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
	
	[self start];
	
	userGameCompleted = 1;
	
	[self userSave];
	
	[self eventTransitionPan:@"29":@"0,0"];
}


-(void)redEndTransition
{
	
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
			[self eventWarp:@"106":@"-1,0"];
			[UIView animateWithDuration:2.5 animations:^(void){
				[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
				self.roomContainer.alpha = 1;
			} completion:^(BOOL finished){
			}];
		}];
	}];
	userStorageEvents[storageEndFormTrigger] = @"1";
}

-(NSString*)event_redEnd :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @""; }		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"]){
		
		if( [userStorageEvents[storageEndForm] intValue] == 0){
			
			self.roomContainer.alpha = 0;
			self.spritesContainer.alpha = 0;
			
			[UIView animateWithDuration:4.5 animations:^(void){
				[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
				[UIView setAnimationDelay:1];
				self.roomContainer.alpha = 1;
				self.spritesContainer.alpha = 1;
			} completion:^(BOOL finished){
				[self eventDialog:dialogEnd1:eventNepturne];
			}];
			
			[self moveDisable:8];
			[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(redEndTransition) userInfo:nil repeats:NO];
			userStorageEvents[storageEndForm] = @"1";
			return eventRed;
		}
		if([userStorageEvents[storageEndFormTrigger] intValue]==1){
			return eventNepturne;
		}
		return eventRed;
		
	}
	return @"";
}

-(NSString*)event_credit1 :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		NSLog(@"CREDIT PART1");
		self.creditsImage.backgroundColor = [UIColor blackColor];
		self.creditsImage.hidden = NO;
		self.creditsImage.alpha = 1;
		self.creditsImage.image = [UIImage imageNamed:@"credit.rekka.jpg"];
		return @"";
	}		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @"";}
	
	[self eventDialog:@"AAA":@"31"];
	
	return @"";
}
-(NSString*)event_credit2 :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		NSLog(@"CREDIT PART2");
		self.creditsImage.alpha = 1;
		self.creditsImage.image = [UIImage imageNamed:@"credit.devine.jpg"];
		return @"";
	}		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"])		{ return @"";}
	[self eventDialog:@"AAA":@"32"];
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
