//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvVariables.h"
#import "xxiivvSettings.h"

#import "xxiivvTouch.h"
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

-(void)eventRouter :(NSString*)eventType :(NSString*)eventName :(NSString*)eventData
{
	if ([eventType isEqualToString:@"warp"]) {
		[self eventWarp:eventName:eventData];
	}
    if ([eventType isEqualToString:@"event"]) {
        
		NSString *eventSelector = [NSString stringWithFormat:@"event_%@:",[self eventParser :eventName:0]];
		
		#pragma clang diagnostic push
		#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
		[self performSelector:NSSelectorFromString(eventSelector) withObject:@""];
		#pragma clang diagnostic pop

		[self roomClearNotifications];
        [self roomGenerateNotifications];
	}
	
}

- (NSString*) eventParser :(NSString*)eventString :(int)index
{
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
    
    [user setX:x];
    [user setY:y];
    [user setLocation:[nodeId intValue]];
    
	self.userPlayer.frame = [position tile:4:[user x]:[user y]];
	
	[UIView beginAnimations: @"Fade In" context:nil];
	[UIView setAnimationDuration:0.3];
	self.userPlayerChar.alpha = 1;
	[UIView commitAnimations];
	
	[self roomStart];
	[self templateRoomAnimation];
	[self moveParallax];
	[self moveOrder];
}

- (void)eventWarpDramatic :(NSString*)nodeId :(NSString*)eventData
{
	NSLog(@"> EVENT | Warp Drama   | Node.%@",nodeId );
	
	NSArray* array = [eventData componentsSeparatedByString: @","];
	int x = [[array objectAtIndex: 0] intValue];
	int y = [[array objectAtIndex: 1] intValue];
	
	self.userPlayerChar.alpha = 0;
	
    [user setX:x];
    [user setY:y];
    [user setLocation:[nodeId intValue]];
    
	self.userPlayer.frame = [position tile:4:[user x]:[user y]];
	
	[self moveDisable:1.3];
	
	[UIView beginAnimations: @"Fade In" context:nil];
	[UIView setAnimationDuration:1];
	self.userPlayerChar.alpha = 1;
	[UIView commitAnimations];
	
	[self moveAnimation];
	
	[self roomStart];
	[self templateRoomAnimation];
	[self moveParallax];
	[self moveOrder];
	
	[self audioEffectPlayer:@"warp"];
}

- (void)eventDialog :(NSString*)dialog :(NSString*)characterId
{
	NSLog(@"  EVENT | Dialog       | Letters %@",dialog);
	
    [user talking:1];
	
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
}

-(void)eventSpellHide
{
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

-(void)eventTranform :(int)charId
{
	NSLog(@"------- - ------------ - -------------------");
	NSLog(@"! EVENT | Transform..  * %d", charId );
	NSLog(@"------- - ------------ - -------------------");
	
	NSLog(@"  EVENT | Spell        | Clear Spellbook" );
	
    [user clearSpellbook];
	
	NSLog(@"  EVENT | Spell        | Change Sprite" );
	
	[self moveDisable:7];
	[UIView animateWithDuration:2.0 animations:^(void){
		// Start
	} completion:^(BOOL finished){
		
		[user setHorizontal:@"l"];
		[user setVertical:@"f"];
		[user setState:@"warp"];
		// First stop
		[UIView animateWithDuration:1.0 animations:^(void){
			// Part 1
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			self.userPlayer.frame = CGRectOffset([position tile:4:[user x]:[user y]], 0, -20);
			[self userSpriteUpdate:[NSString stringWithFormat:@"char%d.warp.l.f.1.png",[user character]]];
			self.userPlayerShadow.alpha = 0;
			[self audioEffectPlayer:@"transform"];
		} completion:^(BOOL finished){
			[UIView animateWithDuration:1.0 animations:^(void){
				self.userPlayer.frame = CGRectOffset([position tile:4:[user x]:[user y]], 0, -10);
			} completion:^(BOOL finished){
				[UIView animateWithDuration:1.0 animations:^(void){
					self.userPlayer.frame = CGRectOffset([position tile:4:[user x]:[user y]], 0, -15);
				} completion:^(BOOL finished){
					[self eventVignette:@"1"];
                    [user setCharacter:charId];
                    [user setState:@"warp"];
					[self userSpriteUpdate:[NSString stringWithFormat:@"char%d.warp.l.f.1.png",[user character]]];
					[UIView animateWithDuration:1.0 animations:^(void){
						self.userPlayer.frame = CGRectOffset([position tile:4:[user x]:[user y]], 0, -10);
					} completion:^(BOOL finished){
						[UIView animateWithDuration:1.0 animations:^(void){
							self.userPlayer.frame = CGRectOffset([position tile:4:[user x]:[user y]], 0, -15);
						} completion:^(BOOL finished){
							[UIView animateWithDuration:1.0 animations:^(void){
								self.userPlayer.frame = CGRectOffset([position tile:4:[user x]:[user y]], 0, 0);
                            } completion:^(BOOL finished){
                                [user setState:@"stand"];
								[self userSpriteUpdate:[NSString stringWithFormat:@"char%d.stand.l.f.1.png",[user character]]];
								self.userPlayerShadow.alpha = 1;
								[self roomClearDialog];
								[self roomGenerateTiles];
								[self roomGenerateEvents];
								[self roomClearNotifications];
								[self moveOrder];
								[self audioEffectPlayer:@"bump"];
                                [user talking:0];
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
	if(toggle == 1){
		NSLog(@"•  ROOM | Audio        | Turned On");
		self.audioAmbientPlayer.volume = 1;
	}
	else{
		NSLog(@"•  ROOM | Audio        | Turned Off");
		self.audioAmbientPlayer.volume = 0;
	}
}

-(void)eventIntroduction
{
	NSLog(@"  EVENT | Pan          | Panning In");
    
	[self moveDisable:2.5];
    
    [user setState:@"warp"];
    [user setHorizontal:@"l"];
    [user setVertical:@"f"];
    
	self.roomContainer.frame = CGRectOffset(self.view.frame, 0, -1*screen.size.height);
	self.spritesContainer.frame = CGRectOffset(self.view.frame, 0, -1*screen.size.height);
	self.parallaxBack.frame = CGRectOffset(self.view.frame, 0, -1*screen.size.height+100);
	self.parallaxFront.frame = CGRectOffset(self.view.frame, 0, -1*screen.size.height+200);
	self.userPlayer.frame = CGRectOffset([position tile:4 :0 :0], 0, -1*screen.size.height+200);
	
	[self userSpriteUpdate:[NSString stringWithFormat:@"char%d.warp.l.f.1.png",[user character]]];
	
	[UIView animateWithDuration:2.5 animations:^(void){
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		self.roomContainer.frame = self.view.frame;
		self.spritesContainer.frame = self.view.frame;
		self.parallaxBack.frame = self.view.frame;
		self.parallaxFront.frame = self.view.frame;
		self.userPlayer.frame = [position tile:4 :0 :0];
	} completion:^(BOOL finished){
		[self roomClearDialog];
		[self userSpriteUpdate:[NSString stringWithFormat:@"char%d.stand.l.f.1.png",[user character]]];
		[user setState:@"stand"];
		[user setHorizontal:@"l"];
		[user setVertical:@"f"];
        [user talking:0];
		[self audioEffectPlayer:@"bump"];
		
		[newDraw dialog:dialogIntroduction:eventOwl];
	}];

}

-(void)eventTransitionPan :(NSString*)destinationId :(NSString*)destinationCoordinates
{
	[self audioEffectPlayer:@"teleport"];
	[self moveDisable:5.5];
	[UIView animateWithDuration:2.5 animations:^(void){
		NSLog(@"  EVENT | Pan          | Panning Out");
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		[UIView setAnimationDelay:0.2];
		self.roomContainer.frame = CGRectOffset(self.view.frame, 0, screen.size.height);
		self.spritesContainer.frame = CGRectOffset(self.view.frame, 0, screen.size.height-30);
		self.parallaxBack.frame = CGRectOffset(self.view.frame, 0, screen.size.height-100);
		self.parallaxFront.frame = CGRectOffset(self.view.frame, 0, screen.size.height-200);
	} completion:^(BOOL finished){
		NSLog(@"  EVENT | Pan          | Panning In");
        
        [user setX:0];
        [user setY:0];
        [user setLocation:[destinationId intValue]];

        self.userPlayer.frame = [position tile:4:[user x]:[user y]];
        [self roomStart];
        [self moveOrder];
		
		self.roomContainer.frame = CGRectOffset(self.view.frame, 0, -1*screen.size.height);
		self.spritesContainer.frame = CGRectOffset(self.view.frame, 0, -1*screen.size.height);
		self.parallaxBack.frame = CGRectOffset(self.view.frame, 0, -1*screen.size.height+100);
		self.parallaxFront.frame = CGRectOffset(self.view.frame, 0, -1*screen.size.height+200);
		self.spritesContainer.alpha = 1;
		self.userPlayer.frame = CGRectOffset(self.userPlayer.frame, 0, -1*screen.size.height+200);
		
		[UIView animateWithDuration:2.5 animations:^(void){
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			self.roomContainer.frame = self.view.frame;
			self.spritesContainer.frame = self.view.frame;
			self.parallaxBack.frame = self.view.frame;
            self.parallaxFront.frame = self.view.frame;
            self.userPlayer.frame = [position tile:4:[user x]:[user y]];
			
		} completion:^(BOOL finished){
			[self roomClearDialog];
			[self userSpriteUpdate:[NSString stringWithFormat:@"char%d.stand.l.f.1.png",[user character]]];
			[user setState:@"stand"];
			[user setHorizontal:@"l"];
			[user setVertical:@"f"];
			[user talking:0];
            
			[self audioEffectPlayer:@"bump"];
		}];
		
	}];
}

-(void)eventVignette :(NSString*) vignetteType
{
	self.vignette.alpha = 1;
	self.vignette.image = [UIImage imageNamed:[NSString stringWithFormat:@"fx.vignette.%@.png",vignetteType]];
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
	[self audioEffectPlayer:@"click1"];
}

@end