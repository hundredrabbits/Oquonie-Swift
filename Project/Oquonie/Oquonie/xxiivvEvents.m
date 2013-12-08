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
	
	NSLog (@"Got the string: %@", (NSArray*)[theTimer userInfo]);
	
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
	
}

- (void)event_test
{
	
	[self eventDialog:@"abc"];
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