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
	
	NSLog(@"> USER | Event: %@ -> %@", eventType, eventId );
	
	if ([eventType isEqualToString:@"warp"]) {
		[self eventWarp:eventId:eventData];
	}
	if ([eventType isEqualToString:@"event"]) {
		NSLog(@"> %@",eventId);
	}
	
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


@end