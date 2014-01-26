//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"

#import "xxiivvWorld.h"
#import "xxiivvViewController.h"
#import "xxiivvTemplates.h"
#import "xxiivvUtils.h"

#import "eventsLobby.h"
#import "eventsNecomedre.h"

@implementation xxiivvViewController (Events)

// =======================
// @ Events: Routers
// =======================

# pragma mark Routers -

-(void)eventRouter :(NSString*)eventType :(NSString*)eventId :(NSString*)eventData {
	
	if ([eventType isEqualToString:@"warp"]) {
		[self eventWarp:eventId:eventData];
	}
	if ([eventType isEqualToString:@"event"]) {
		NSString *eventSelector = [NSString stringWithFormat:@"event_%@:",[self eventParser:eventId:0]];
		NSLog(@"------- - ------------ - -------------------");
		NSLog(@"! EVENT | Load..       * %@", eventId );
		NSLog(@"------- - ------------ - -------------------");
		
		#pragma clang diagnostic push
		#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
		[self performSelector:NSSelectorFromString(eventSelector) withObject:@""];
		#pragma clang diagnostic pop

		[self roomClearNotifications];
        [self roomGenerateNotifications];
	}
	
}

- (NSString*) eventParser :(NSString*)eventString :(int)index {
	
	NSArray* array = [eventString componentsSeparatedByString: @"_"];
	if( [array count] < (index+1) && index > 0 ){
		return 0;
	}
	NSString* value = [array objectAtIndex: index];
	
	return value;
}

// =======================
// @ Events: Generic Events
// =======================

# pragma mark Generic Events -

- (void)eventWarp :(NSString*)nodeId :(NSString*)eventData
{
	NSLog(@"> EVENT | Warp         | Node.%@",nodeId );
	
	NSArray* array = [eventData componentsSeparatedByString: @","];
	int x = [[array objectAtIndex: 0] intValue];
	int y = [[array objectAtIndex: 1] intValue];
	
	self.userPlayerChar.alpha = 0;
	
	userPositionX = x;
	userPositionY = y;
	userLocation = [nodeId intValue];
	self.userPlayer.frame = [self tileLocation:4:userPositionX:userPositionY];
	
	[UIView beginAnimations: @"Fade In" context:nil];
	[UIView setAnimationDuration:0.3];
	self.userPlayerChar.alpha = 1;
	[UIView commitAnimations];
	
	[self roomStart];
	[self templateRoomAnimation];
	[self moveParallax];
	[self moveOrder];
	
	[self audioEffectPlayer:@"warp"];
}

- (void)eventDialog :(NSString*)dialog :(NSString*)characterId
{
	NSLog(@"  EVENT | Dialog       | Letters %@",dialog);
	
	userDialogActive = 1;
	
    self.dialogCharacter1.image = [UIImage imageNamed:@""];
    self.dialogCharacter2.image = [UIImage imageNamed:@""];
    self.dialogCharacter3.image = [UIImage imageNamed:@""];

    if(dialog.length > 2){
        self.dialogCharacter3.image = [UIImage imageNamed:[NSString stringWithFormat:@"letter%@.png",[dialog substringFromIndex:2]]];
    }
    if(dialog.length > 1){
        self.dialogCharacter2.image = [UIImage imageNamed:[NSString stringWithFormat:@"letter%@.png",[dialog substringWithRange:NSMakeRange(1, 1)]]];
    }
    if(dialog.length > 0){
        self.dialogCharacter1.image = [UIImage imageNamed:[NSString stringWithFormat:@"letter%@.png",[dialog substringToIndex:1]]];
    }
	
	self.dialogCharacter.frame = CGRectOffset(portraitOrigin, 0, 2);
	self.dialogCharacter.image = [UIImage imageNamed:[NSString stringWithFormat:@"event.%@.portrait.png",characterId]];
	self.dialogCharacter.alpha = 0;
	
	self.dialogBubble.frame = CGRectOffset(bubbleOrigin, 3, 0);
	self.dialogBubble.alpha = 0;
	
	self.dialogCharacter1.alpha = 0;
	self.dialogCharacter2.alpha = 0;
	self.dialogCharacter3.alpha = 0;
	
	[UIView beginAnimations: @"animate dialog" context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	self.dialogCharacter.frame = portraitOrigin;
	self.dialogCharacter.alpha = 1;
	self.dialogBubble.frame = CGRectOffset(bubbleOrigin, 0, 0);
	self.dialogBubble.alpha = 1;
	self.dialogCharacter2.alpha = 1;
	self.dialogVignette.alpha = 1;
	[UIView commitAnimations];
	
	[UIView beginAnimations: @"animate dialog" context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDelay:0.2];
	self.dialogCharacter1.alpha = 1;
	self.dialogCharacter3.alpha = 1;
	[UIView commitAnimations];
	
	// Hide spellbook if unecessary
	
	[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(eventSpellHide) userInfo:nil repeats:NO];
	
	[self audioEffectPlayer:@"dialog"];
	
}

-(void)eventSpellAdd :(NSString*)spellId :(int)spellType
{
    NSLog(@"  EVENT | Spell        | Updating..");
	
	// If already the character
	if(spellType == userCharacter){
		NSLog(@"  EVENT | Spell        | Already type:%d",spellType);
		[self eventSpellRefresh];
		return;
	}
	
	int index = 0;
	for (NSArray *spellbookItem in userSpellbook) {
		if( [spellbookItem[0] isEqualToString:spellId] && [spellbookItem[1] intValue] == spellType){
			NSLog(@"- EVENT | Spell        | Removed  -> id:%@ type:%d",spellId,spellType);
			userSpellbook[index] = @[@"",@""];
			[self audioEffectPlayer:@"spellRemoved"];
			[self eventSpellRefresh];
			return;
		}
		index += 1;
	}
	
    NSLog(@"> EVENT | Spell        | Looking for free slot");

	int spellSlot = -1;
	if( [userSpellbook[0][0] isEqualToString:@""] ){ spellSlot = 0; }
	else if( [userSpellbook[1][0] isEqualToString:@""] ){ spellSlot = 1; }
	else if( [userSpellbook[2][0] isEqualToString:@""] ){ spellSlot = 2; }
	
	if(spellSlot > -1){
		NSLog(@"> EVENT | Spell        | Added    -> id:%@ type:%d",spellId,spellType);
		userSpellbook[spellSlot] = @[[NSString stringWithFormat:@"%@",spellId],[NSString stringWithFormat:@"%d",spellType]];
		[self audioEffectPlayer:@"spellAdded"];
		[self eventSpellRefresh];
	}
	else{
		NSLog(@"> EVENT | Spell        | No available slot");
		[self audioEffectPlayer:@"error"];
	}
}

-(void)eventSpellRefresh
{
	NSLog(@"> EVENT | Spell        | Refresh");
	
	int index = 0;
	
	int indexTransform = 0;
	int indexTransformPrevious = 0;
	
	for (NSArray *spellbookItem in userSpellbook) {
		
		NSLog(@"  EVENT | Spell %d      | Type:%@ Id:%@",index, spellbookItem[1], spellbookItem[0]);
		
		NSString* letterName = [self util_CharIdToLetter:[spellbookItem[1] intValue]];
		UIImage* letterImage;
		
		if([letterName isEqualToString:@""]){
			letterImage = [UIImage imageNamed:@"letterSpell0.png"];
		}
		else{
			letterImage = [UIImage imageNamed:[NSString stringWithFormat:@"letterSpell%@.png",letterName]];
		}
		
		[UIView animateWithDuration:0.2 animations:^(void){
			[UIView setAnimationDelay:index*0.1];
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			if(index == 0){
				self.spellCharacter1.frame = CGRectOffset(self.spellCharacter1.frame, 0, 5);
				self.spellCharacter1.alpha = 0;
			}
			else if(index == 1){
				self.spellCharacter2.frame = CGRectOffset(self.spellCharacter2.frame, 0, 5);
				self.spellCharacter2.alpha = 0;
			}
			else if(index == 2){
				self.spellCharacter3.frame = CGRectOffset(self.spellCharacter3.frame, 0, 5);
				self.spellCharacter3.alpha = 0;
			}
		} completion:^(BOOL finished){
			[UIView animateWithDuration:0.2 animations:^(void){
				[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
				if(index == 0){
					self.spellCharacter1.image = letterImage;
					self.spellCharacter1.frame = spellCharacter1Origin;
					self.spellCharacter1.alpha = 1;
				}
				else if(index == 1){
					self.spellCharacter2.image = letterImage;
					self.spellCharacter2.frame = spellCharacter2Origin;
					self.spellCharacter2.alpha = 1;
				}
				else if(index == 2){
					self.spellCharacter3.image = letterImage;
					self.spellCharacter3.frame = spellCharacter3Origin;
					self.spellCharacter3.alpha = 1;
				}
			} completion:^(BOOL finished){
			}];
		}];
		
		index += 1;
		
		// Look for a sequence of 3
		if( indexTransformPrevious == [spellbookItem[1] intValue] ){
			indexTransform += 1;
		}
		else{
			indexTransform = 1;
		}
		indexTransformPrevious = [spellbookItem[1] intValue];
	}
	
	if( indexTransform == 3 ){
		if( [userSpellbook[0][1] intValue] > 0 ){
			[self eventTranform:[userSpellbook[0][1] intValue]];
		}
	}
}

-(void)eventSpellMistake
{

}

-(void)eventSpellHide
{
	int emptySpell = 0;
	for (NSArray *spellbookItem in userSpellbook) {
		if([spellbookItem[1] intValue] == 0){
			emptySpell += 1;
		}
	}
	
	if(emptySpell==3){
		int index = 0;
		while(index < 3){
			[UIView animateWithDuration:0.2 animations:^(void){
				[UIView setAnimationDelay:index*0.1];
				[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
				if(index == 0){
					self.spellCharacter1.frame = CGRectOffset(self.spellCharacter1.frame, 0, 5);
					self.spellCharacter1.alpha = 0;
				}
				else if(index == 1){
					self.spellCharacter2.frame = CGRectOffset(self.spellCharacter2.frame, 0, 5);
					self.spellCharacter2.alpha = 0;
				}
				else if(index == 2){
					self.spellCharacter3.frame = CGRectOffset(self.spellCharacter3.frame, 0, 5);
					self.spellCharacter3.alpha = 0;
				}
			} completion:^(BOOL finished){}];
			index += 1;
		}
	}
}

-(bool)eventSpellCheck :(NSString*)spellId
{
	NSLog(@"  EVENT | Spell        | Looking for: %@",spellId);
	for (NSArray *spellbookItem in userSpellbook) {
		if( [spellbookItem[0] isEqualToString:spellId] ){
			return TRUE;
		}
	}
	return FALSE;
}

-(void)eventTranform :(int)charId
{
	NSLog(@"------- - ------------ - -------------------");
	NSLog(@"! EVENT | Transform..  * %d", charId );
	NSLog(@"------- - ------------ - -------------------");
	
	NSLog(@"  EVENT | Spell        | Clear Spellbook" );
	
	userSpellbook = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
	
	NSLog(@"  EVENT | Spell        | Change Sprite" );
	
	// TODO: Create the FX sprites
	
	[self moveDisable:7];
	[UIView animateWithDuration:2.0 animations:^(void){
		// Start
		userSpriteOrientationHorizontal = @"l";
		userSpriteOrientationVertical = @"f";
	} completion:^(BOOL finished){
		// First stop
		[UIView animateWithDuration:1.0 animations:^(void){
			// Part 1
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			self.userPlayer.frame = CGRectOffset([self tileLocation:4:userPositionX:userPositionY], 0, -20);
			[self userSpriteUpdate:[NSString stringWithFormat:@"char%d.warp.l.f.1.png",userCharacter]];
			userSpriteState = @"warp";
			self.userPlayerShadow.alpha = 0;
			[self audioEffectPlayer:@"transform"];
		} completion:^(BOOL finished){
			[UIView animateWithDuration:1.0 animations:^(void){
				self.userPlayer.frame = CGRectOffset([self tileLocation:4:userPositionX:userPositionY], 0, -10);
			} completion:^(BOOL finished){
				[UIView animateWithDuration:1.0 animations:^(void){
					self.userPlayer.frame = CGRectOffset([self tileLocation:4:userPositionX:userPositionY], 0, -15);
				} completion:^(BOOL finished){
					[self eventVignette:@"1"];
					userCharacter = charId;
					[self eventSpellRefresh];
					[self userSpriteUpdate:[NSString stringWithFormat:@"char%d.warp.l.f.1.png",userCharacter]];
					[UIView animateWithDuration:1.0 animations:^(void){
						self.userPlayer.frame = CGRectOffset([self tileLocation:4:userPositionX:userPositionY], 0, -10);
					} completion:^(BOOL finished){
						[UIView animateWithDuration:1.0 animations:^(void){
							self.userPlayer.frame = CGRectOffset([self tileLocation:4:userPositionX:userPositionY], 0, -15);
						} completion:^(BOOL finished){
							[UIView animateWithDuration:1.0 animations:^(void){
								self.userPlayer.frame = CGRectOffset([self tileLocation:4:userPositionX:userPositionY], 0, 0);
							} completion:^(BOOL finished){
								[self userSpriteUpdate:[NSString stringWithFormat:@"char%d.stand.l.f.1.png",userCharacter]];
								self.userPlayerShadow.alpha = 1;
								[self roomClearDialog];
								[self roomGenerateTiles];
								[self roomGenerateEvents];
								[self roomClearNotifications];
								userDialogActive = 0;
							}];
						}];
					}];
				}];
			}];
		}];
	}];
}

-(void)eventAudioToggle :(int)toggle
{
	[self audioEffectPlayer:@"tic"];
	if(toggle == 1){
		NSLog(@"•  ROOM | Audio        | Turned On");
		self.audioAmbientPlayer.volume = 1;
	}
	else{
		NSLog(@"•  ROOM | Audio        | Turned Off");
		self.audioAmbientPlayer.volume = 0;
	}
}

-(void)eventTransitionPan :(NSString*)destinationId :(NSString*)destinationCoordinates
{
	[self moveDisable:5.5];
	[UIView animateWithDuration:2.5 animations:^(void){
		NSLog(@"  EVENT | Pan          | Panning Out");
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		[UIView setAnimationDelay:0.2];
		self.roomContainer.frame = CGRectOffset(self.roomContainer.frame, 0, screen.size.height);
		self.spritesContainer.frame = CGRectOffset(self.spritesContainer.frame, 0, screen.size.height-30);
		self.parallaxBack.frame = CGRectOffset(self.parallaxBack.frame, 0, screen.size.height-100);
		self.parallaxFront.frame = CGRectOffset(self.parallaxFront.frame, 0, screen.size.height-200);
	} completion:^(BOOL finished){
		NSLog(@"  EVENT | Pan          | Panning In");
		
		[self eventWarp:destinationId:destinationCoordinates];
		
		self.roomContainer.frame = CGRectOffset(self.roomContainer.frame, 0, -1*screen.size.height);
		self.spritesContainer.frame = CGRectOffset(self.spritesContainer.frame, 0, -1*screen.size.height);
		self.parallaxBack.frame = CGRectOffset(self.parallaxBack.frame, 0, -1*screen.size.height+100);
		self.parallaxFront.frame = CGRectOffset(self.parallaxFront.frame, 0, -1*screen.size.height+200);
		
		self.userPlayer.frame = CGRectOffset(self.userPlayer.frame, 0, -1*screen.size.height+200);
		
		[UIView animateWithDuration:2.5 animations:^(void){
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			self.roomContainer.frame = roomContainerOrigin;
			self.spritesContainer.frame = spriteContainerOrigin;
			self.parallaxBack.frame = parallaxBackOrigin;
			self.parallaxFront.frame = parallaxFrontOrigin;
			self.userPlayer.frame = [self tileLocation:4 :0 :0];
		} completion:^(BOOL finished){
			[self roomClearDialog];
			[self userSpriteUpdate:[NSString stringWithFormat:@"char2.stand.l.f.1.png"]];
			userSpriteState = @"stand";
			userSpriteOrientationHorizontal = @"l";
			userSpriteOrientationVertical = @"f";
			userDialogActive = 0;
		}];
		
	}];
}

-(void)eventVignette :(NSString*) vignetteType
{
	self.vignette.image = [UIImage imageNamed:@"fx.vignette.1.png"];
	[UIView animateWithDuration:1.5 animations:^(void){
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		self.vignette.alpha = 0;
	} completion:^(BOOL finished){}];
	
}

// =======================
// @ Events: Clear Events
// =======================

# pragma mark Clear Events -

-(void)roomClearDialog
{
	NSLog(@"> EVENT | Dialog       | Closed");
	[UIView animateWithDuration:0.2 animations:^(void){
		self.dialogCharacter.frame = portraitOrigin;
		self.dialogCharacter.alpha = 0;
		self.dialogBubble.frame = bubbleOrigin;
		self.dialogBubble.alpha = 0;
		self.dialogCharacter1.alpha = 0;
		self.dialogCharacter2.alpha = 0;
		self.dialogCharacter3.alpha = 0;
		self.dialogVignette.alpha = 0;
	} completion:^(BOOL finished){}];
	[self audioEffectPlayer:@"tic"];
}

@end