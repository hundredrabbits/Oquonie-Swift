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

#import "eventsLobby.h"
#import "eventsNecomedre.h"

@implementation xxiivvViewController (Events)

// =======================
// @ Events: Wizards
// =======================

# pragma mark Wizards -

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
        [self eventDialog:@"AAA":@"1"];
    }
    else{
        [self eventDialog:@"UVW":@"2"];
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
        [self eventDialog:@"AAA":@"1"];
    }
    else{
        [self eventDialog:@"EGJ":@"1"];
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
        [self eventDialog:@"AAA":@"1"];
    }
    else{
        [self eventDialog:@"EGJ":@"1"];
        [self eventSpell:3:3];
    }
	
	// Return storage Id
	return 3;
}


// =======================
// @ Events: Tips
// =======================

# pragma mark Tips -

-(int)event_tip1 :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return 0;
	}
	// Dialog
    [self eventDialog:@"UVW":@"7"];
	// Return storage Id
	return 2;
}

-(int)event_tip2 :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return 0;
	}
	// Dialog
    [self eventDialog:@"UVW":@"1"];
	// Return storage Id
	return 2;
}

-(int)event_tip3 :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return 0;
	}
	// Dialog
    [self eventDialog:@"UVW":@"8"];
	// Return storage Id
	return 2;
}


// =======================
// @ Events: Misc
// =======================

# pragma mark Misc -

-(int)event_colours1 :(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return 0;
	}
	// Dialog
    [self eventDialog:@"UVW":@"10"];
	// Return storage Id
	return 2;
}








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
		[self performSelector:NSSelectorFromString(eventSelector) withObject:@""];
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
    NSLog(@"> EVENT | Spell        | Added    -> id:%d type:%d",spellId,spellType);
	
    userStorageEvents[spellId] = [NSString stringWithFormat:@"%d",spellType];
	
	[self eventSpellRefresh];
}

-(void)eventSpellRefresh
{
	NSLog(@"> EVENT | Spell        | Refresh");
	
	// Create merge array
	int index = 0;
	NSMutableArray *spellTest = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
	
	// Merge events counts
	for (NSString *tile in userStorageEvents) {
		int spellId = [tile intValue];
		spellTest[spellId] = [NSString stringWithFormat:@"%d",[spellTest[spellId] intValue]+1];
		index += 1;
	}
	
	// Transform in the right character
	index = 0;
	for (NSString *spellCountForId in spellTest) {
		if(index>0){
			if([spellCountForId intValue] > 2){
				[self eventTranform:index];
			}
		}
		index += 1;
	}
	

	// TODO: Display the spell icons
	self.spellCharacter1.backgroundColor = [UIColor redColor];
	self.spellCharacter2.backgroundColor = [UIColor redColor];
	self.spellCharacter3.backgroundColor = [UIColor redColor];
	

}

-(void)eventTranform :(int)charId
{
	NSLog(@"+ EVENT | Spell        | Transform intro char%d",charId);
	
	userSpriteChar = [NSString stringWithFormat:@"char%d",charId];
	userSpriteCharId = charId;
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
	} completion:^(BOOL finished){}];
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
	NSLog(@"  EVENT | Notification | #%@ ",eventId);
	return 1;
	
}


@end