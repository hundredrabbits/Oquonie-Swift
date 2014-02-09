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

// End Tree
-(NSString*)event_endReset :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @""; }		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"]){ return @"";}
	
	[self moveDisable:10];
	[self audioEffectPlayer:@"bump1"];
	
	[UIView animateWithDuration:5 animations:^(void){
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		self.spritesContainer.alpha = 0;
	} completion:^(BOOL finished){
		NSLog(@"step 1");
		[UIView animateWithDuration:5 animations:^(void){
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			self.parallaxBack.frame = CGRectOffset(self.parallaxBack.frame, 0, 100);
			self.parallaxFront.frame = CGRectOffset(self.parallaxFront.frame, 0, 200);
			self.parallaxBack.alpha = 0;
			self.parallaxFront.alpha = 0;
			self.roomContainer.frame = CGRectOffset(self.roomContainer.frame, 0, 50);
			self.roomContainer.alpha = 0;
		} completion:^(BOOL finished){
			NSLog(@"step 2");
			[UIView animateWithDuration:5 animations:^(void){
				[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
				self.parallaxBack.frame = parallaxBackOrigin;
				self.parallaxFront.frame = parallaxFrontOrigin;
			} completion:^(BOOL finished){
				NSLog(@"step 3");
				NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
				[[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
				[self start];
				userGameCompleted = 1;
				[self userSave];
				[self eventWarpDramatic:@"1":@"0,0"];
				[UIView animateWithDuration:5 animations:^(void){
					[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
					self.roomContainer.alpha = 1;
					self.roomBackground.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1];
				} completion:^(BOOL finished){
					NSLog(@"step 4");
					[UIView animateWithDuration:5 animations:^(void){
						[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
						self.spritesContainer.alpha = 1;
					} completion:^(BOOL finished){
						NSLog(@"step 5");
						[UIView animateWithDuration:5 animations:^(void){
							[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
						} completion:^(BOOL finished){
							NSLog(@"step 5");
						}];
					}];
					
				}];
			}];
		}];
	}];
	
	return @"";
}

// Red Character

-(NSString*)event_redEnd :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @""; }		// Broadcast Notification
	if([option isEqualToString:@"postUpdate"]){
		if( [userStorageEvents[storageEndForm] intValue] == 0){
			[self redEndSequence];
			userStorageEvents[storageEndForm] = @"1";
			return eventRed;
		}
	}
	return @"";
}

-(void)redEndSequence
{
	NSLog(@"Step 0");
	[self moveDisable:20];
	// Remove Background
	[UIView animateWithDuration:7.5 animations:^(void){
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	} completion:^(BOOL finished){
		NSLog(@"Step 1");
		self.parallaxBack.frame = CGRectOffset(self.parallaxBack.frame, 0, 100);
		self.parallaxFront.frame = CGRectOffset(self.parallaxFront.frame, 0, 200);
		self.parallaxBack.alpha = 0;
		self.parallaxFront.alpha = 0;
		[UIView animateWithDuration:2.5 animations:^(void){
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			self.parallaxBack.frame = parallaxBackOrigin;
			self.parallaxFront.frame = parallaxFrontOrigin;
			self.parallaxBack.alpha = 1;
			self.parallaxFront.alpha = 1;
		} completion:^(BOOL finished){
			NSLog(@"Step 2");
			[self eventDialog:dialogEnd1:eventRed];
			[self eventVignette:@"1"];
			[UIView animateWithDuration:2.5 animations:^(void){
				[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
				self.roomContainer.alpha = 1;
			} completion:^(BOOL finished){
				NSLog(@"Step 3");
				[UIView animateWithDuration:6.5 animations:^(void){
					self.roomContainer.alpha = 0;
				} completion:^(BOOL finished){
					NSLog(@"Step 4");
					[self roomClearDialog];
					[UIView animateWithDuration:5.5 animations:^(void){
						[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
						self.roomBackground.backgroundColor = [UIColor whiteColor];
					} completion:^(BOOL finished){
						NSLog(@"Step 5");
						[self eventWarp:@"106":@"-1,0"];
						[UIView animateWithDuration:5.5 animations:^(void){
							[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
							self.roomContainer.alpha = 1;
						} completion:^(BOOL finished){
							NSLog(@"Step 6");
							[self roomClearDialog];
						}];
					}];
				}];
			}];
		}];
	}];
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
	[self audioDialogPlayer:@"rekka"];
	
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
	[self audioDialogPlayer:@"devine"];
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
