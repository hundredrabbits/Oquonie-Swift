//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvWorld.h"
#import "xxiivvViewController.h"
#import "xxiivvTemplates.h"

@implementation xxiivvViewController (Events)


-(void)eventRouter :(NSString*)eventType :(NSString*)eventId :(NSString*)eventData {
	
	if ([eventType isEqualToString:@"port"]) {
		NSLog(@"        - #%@ (%@)",eventId, eventData );
		[self eventPort:eventId:eventData];
	}
	if ([eventType isEqualToString:@"warp"]) {
		NSLog(@"        - #%@ (%@)",eventId, eventData );
		[self eventWarp:eventId:eventData];
	}
	if ([eventType isEqualToString:@"event"]) {
		NSString *eventSelector = [NSString stringWithFormat:@"event_%@",eventId];
		NSLog(@"        - #%@", eventSelector );
		[self performSelector:NSSelectorFromString(eventSelector)];
	}
	
}

-(void)eventAudioToggle {
	
	if(userAudioPlaying == 1){
		NSLog(@"        - #audioOff" );
		userAudioPlaying = 0;
	}
	else{
		NSLog(@"        - #audioOn" );
		userAudioPlaying = 1;
	}
	
}


- (void)eventPort :(NSString*)eventId :(NSString*)eventData
{
	NSArray *eventArray;
	eventArray = [NSArray arrayWithObjects: eventId, eventData, nil];
	NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(eventPortWarp:) userInfo:eventArray repeats:NO];
}

- (void)eventPortWarp:(NSTimer*)theTimer {
	
	NSArray *eventArray;
	eventArray = [theTimer userInfo];
	NSString *eventId = eventArray[0];
	NSString *eventData = eventArray[1];
	
	[self eventWarp:eventId :eventData];
}


- (void)eventWarp :(NSString*)eventId :(NSString*)eventData
{
	NSArray* array = [eventData componentsSeparatedByString: @","];
	int x = [[array objectAtIndex: 0] intValue];
	int y = [[array objectAtIndex: 1] intValue];
	
	self.userPlayerChar.alpha = 0;
	
	userPositionX = x;
	userPositionY = y;
	userLocation = [eventId intValue];
	self.userPlayer.frame = [self tileLocation:4:userPositionX:userPositionY];
	
	[UIView beginAnimations: @"Fade In" context:nil];
	[UIView setAnimationDuration:0.3];
	self.userPlayerChar.alpha = 1;
	[UIView commitAnimations];
	
	[self roomStart];
	[self templateRoomAnimation];
}

- (void)eventDialog :(NSString*)dialog
{
	
	NSLog(@"        - #%@ (letters)",dialog);
	
	self.dialogCharacter1.image = [UIImage imageNamed:[NSString stringWithFormat:@"letter%@.png",[dialog substringToIndex:1]]];
	self.dialogCharacter2.image = [UIImage imageNamed:[NSString stringWithFormat:@"letter%@.png",[dialog substringWithRange:NSMakeRange(1, 1)]]];
	self.dialogCharacter3.image = [UIImage imageNamed:[NSString stringWithFormat:@"letter%@.png",[dialog substringFromIndex:2]]];
	
	self.dialogCharacter.frame = CGRectOffset(portraitOrigin, 0, 2);
	self.dialogCharacter.alpha = 0;
	
	self.dialogBubble.frame = CGRectOffset(portraitOrigin, 3, 0);
	self.dialogBubble.alpha = 0;
	
	self.dialogCharacter1.alpha = 0;
	self.dialogCharacter2.alpha = 0;
	self.dialogCharacter3.alpha = 0;
	
	[UIView beginAnimations: @"animate dialog" context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	self.dialogCharacter.frame = portraitOrigin;
	self.dialogCharacter.alpha = 1;
	self.dialogBubble.frame = CGRectOffset(portraitOrigin, 0, 0);
	self.dialogBubble.alpha = 1;
	[UIView commitAnimations];
	
	[UIView beginAnimations: @"animate dialog" context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDelay:0.2];
	self.dialogCharacter1.alpha = 1;
	[UIView commitAnimations];
	
	[UIView beginAnimations: @"animate dialog" context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDelay:0.3];
	self.dialogCharacter2.alpha = 1;
	[UIView commitAnimations];
	
	[UIView beginAnimations: @"animate dialog" context:nil];
	[UIView setAnimationDuration:0.4];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDelay:0.2];
	self.dialogCharacter3.alpha = 1;
	[UIView commitAnimations];
	
}

-(void)eventSpell :(int)spellId :(int)spellType
{
	NSLog(@"        - #%d-%d (spell)",spellId,spellType);
}

-(void)event_test
{
	[self eventDialog:@"EGJ"];
	[self eventSpell:1:3];
}

-(void)roomCleanDialog
{
	[UIView beginAnimations: @"animate dialog" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	self.dialogCharacter.frame = portraitOrigin;
	self.dialogCharacter.alpha = 0;
	self.dialogBubble.frame = bubbleOrigin;
	self.dialogBubble.alpha = 0;
	self.dialogCharacter1.alpha = 0;
	self.dialogCharacter2.alpha = 0;
	self.dialogCharacter3.alpha = 0;
	[UIView commitAnimations];
}


-(int)notificationListen :(NSString*)eventId {
	
	NSLog(@"        - #%@ (broadcasting)",eventId);
	
	if( [eventId isEqualToString:@"AudioToggle"] ){
		if(userAudioPlaying == 1){
			return 0;
		}
	}
	return 1;
	
}


@end