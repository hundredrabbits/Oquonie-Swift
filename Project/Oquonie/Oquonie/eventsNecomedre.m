//
//  xxiivvViewController+eventsNecomedre.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/7/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvEvents.h"

#import "eventsNecomedre.h"

@implementation xxiivvViewController (eventsNecomedre)

-(NSString*)event_photocopier1 :(NSString*)option
{
	NSString *eventSpellId = @"photocopier1";
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userSpriteCharId == 1 ){ return @"X"; }
		return @"";
	}
	// Dialog
    if( [self eventSpellCheck:eventSpellId] ){
        [self eventDialog:@"AAA":@"11"];
    }
    else{
        [self eventDialog:@"RIX":@"11"]; // Key Yes Document
    }
	[self eventSpellAdd:eventSpellId:6];
	
	return @"HEY";
}

-(NSString*)event_photocopier2 :(NSString*)option
{
	NSString *eventSpellId = @"photocopier2";
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userSpriteCharId == 1 ){
			return @"X";
		}
		return @"";
	}
	// Dialog
    if( [self eventSpellCheck:eventSpellId] ){
        [self eventDialog:@"AAA":@"11"];
    }
    else{
        [self eventDialog:@"UVW":@"11"];
    }
	[self eventSpellAdd:eventSpellId:6];
	
	return @"HEY";
}

-(NSString*)event_photocopier3 :(NSString*)option
{
	NSString *eventSpellId = @"photocopier3";
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if( ![self eventSpellCheck:eventSpellId] && userSpriteCharId == 1 ){
			return @"X";
		}
		return @"";
	}
	// Dialog
    if( [self eventSpellCheck:eventSpellId] ){
        [self eventDialog:@"AAA":@"11"];
    }
    else{
        [self eventDialog:@"UVW":@"11"];
    }
	[self eventSpellAdd:eventSpellId:6];
	
	return @"HEY";
}

-(NSString*)event_speakerphone :(NSString*)option
{
	int userStorageEventId = 1;
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if([userStorageEvents[userStorageEventId] intValue]<1){
			return @"N";
		}
		return @"";
	}
	return @"HEY";
}


-(NSString*)event_tutorialRedDoor :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	[self eventTransitionPan:@"1":@"0,0"];
	[self eventDialog:@"UVW":@"10"];		
	
	return @"";
}

-(NSString*)event_tutorialCharacter :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		if(userSpriteCharId == 1){
			return 0;
		}
		return 0;
	}
	if(userSpriteCharId == 1){
		[self eventWarp:@"31" :@"0,0"];
		[self eventDialog:@"UVW":@"10"];
		[self eventVignette:@"12"];
	}
	if(userSpriteCharId == 6){
		[self eventTranform:1];
		[self eventDialog:@"UVW":@"12"];
	}
	
	return 0;
}

-(NSString*)event_tutorialCharacterTransformed :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		return 0;
	}
	[self eventWarp:@"31" :@"0,0"];
	[self eventTranform:1];
	
	return 0;
}

-(NSString*)event_photocopierDoor :(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){
		if(userSpriteCharId == 6 && userLocation == 29){
			return @"K";
		}
		else if(userSpriteCharId == 6){
			return @"";
		}
		return @"L";
	}
	if(userSpriteCharId == 6){
		// Door from side A
		if( userLocation == 29 ){
			[self eventWarp:@"30":@"0,-1"];
			[self eventDialog:@"PIS":@"12"]; // Inside correct friend
		}
		// Door from side B
		else if ( userLocation == 30 ){
			[self eventWarp:@"29":@"0,1"];
		}
	}
	else{
		[self eventDialog:@"FLX":@"12"];
	}
	return false;
}

@end
