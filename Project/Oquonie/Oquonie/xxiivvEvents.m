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

// =======================
// @ Hub Oquonie
// =======================

-(int)event_wizard1 :(NSString*)option
{
	int userStorageEventId = 1;
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[userStorageEventId] intValue]<1){
			return 1;
		}
		return 0;
	}
	
	// Dialog
    if([userStorageEvents[userStorageEventId] intValue]>0){
        [self eventDialog:@"AAA"];
    }
    else{
        [self eventDialog:@"EGJ"];
        [self eventSpell:userStorageEventId:3];
    }
	
	// Return storage Id
	return userStorageEventId;
}

-(int)event_wizard2 :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[2] intValue]<1){
			return 1;
		}
		return 0;
	}
	
	// Dialog
    if([userStorageEvents[2] intValue]>0){
        [self eventDialog:@"AAA"];
    }
    else{
        [self eventDialog:@"EGJ"];
        [self eventSpell:2:3];
    }
	
	// Return storage Id
	return 2;
}

-(int)event_wizard3 :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[3] intValue]<1){
			return 1;
		}
		return 0;
	}
	
	// Dialog
    if([userStorageEvents[3] intValue]>0){
        [self eventDialog:@"AAA"];
    }
    else{
        [self eventDialog:@"EGJ"];
        [self eventSpell:3:3];
    }
	
	// Return storage Id
	return 3;
}


-(void)eventRouter :(NSString*)eventType :(NSString*)eventId :(NSString*)eventData {
	
	
	if ([eventType isEqualToString:@"port"]) {
		NSLog(@"  EVENT | #%@ (%@)",eventId, eventData );
		[self eventPort:eventId:eventData];
	}
	if ([eventType isEqualToString:@"warp"]) {
		NSLog(@"  EVENT | #%@ (%@)",eventId, eventData );
		[self eventWarp:eventId:eventData];
	}
	if ([eventType isEqualToString:@"event"]) {
		NSString *eventSelector = [NSString stringWithFormat:@"event_%@:",[self eventParser:eventId:0]];
		NSLog(@"  EVENT | #%@", eventSelector );
		[self performSelector:NSSelectorFromString(eventSelector) withObject:@""];
		[self roomCleanNotifications];
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
	
	NSLog(@"  EVENT - #%@ (letters)",dialog);

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
    // spell already aquired
    if([userStorageEvents[spellId] intValue]>0){
        NSLog(@"! EVENT | Spell: Already aquired %d(%d)",spellId,spellType);
        return;
    }

    userStorageEvents[spellId] = @"1";
    NSLog(@"+ EVENT | Spell: Added %d(%d)",spellId,spellType);
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
	
	
	if( [eventId isEqualToString:@"AudioToggle"] ){
		if(userAudioPlaying == 1){
			return 0;
		}
	}
    if( [userStorageEvents[[eventId intValue]] intValue] > 0){
        return 0;
    }
	NSLog(@"  EVENT | Notification: #%@ ",eventId);
	return 1;
	
}


@end