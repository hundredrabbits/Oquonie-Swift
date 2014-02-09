//
//  xxiivvViewController+eventsSecret.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2/8/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "xxiivvEvents.h"
#import "eventsSecret.h"

@implementation xxiivvViewController (eventsSecret)


-(NSString*)event_specialCat1 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"secretCat1";
	NSString*	eventDialogSpell	= dialogGainSpell(letterCat);
	NSString*	eventLetter			= letterCat;
	NSString*	eventSpriteId		= eventCat;
	int			eventSpell			= spellCat;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		// If doesn't have spell already
		if([self eventSpellCheck:eventSpellId]){ return @""; }
		// Else
		return eventLetter;
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	[self audioDialogPlayer:@"cat"];
	
	[self eventSpellAdd:eventSpellId:eventSpell];
	[self eventDialog:eventDialogSpell:eventSpriteId];
	
	return @"";
}


-(NSString*)event_specialCat2 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"secretCat2";
	NSString*	eventDialogSpell	= dialogGainSpell(letterCat);
	NSString*	eventLetter			= letterCat;
	NSString*	eventSpriteId		= eventCat;
	int			eventSpell			= spellCat;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		// If doesn't have spell already
		if([self eventSpellCheck:eventSpellId]){ return @""; }
		// Else
		return eventLetter;
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	[self audioDialogPlayer:@"cat"];
	
	[self eventSpellAdd:eventSpellId:eventSpell];
	[self eventDialog:eventDialogSpell:eventSpriteId];
	
	return @"";
}

-(NSString*)event_specialCat3 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"secretCat3";
	NSString*	eventDialogSpell	= dialogGainSpell(letterCat);
	NSString*	eventLetter			= letterCat;
	NSString*	eventSpriteId		= eventCat;
	int			eventSpell			= spellCat;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		// If doesn't have spell already
		if([self eventSpellCheck:eventSpellId]){ return @""; }
		// Else
		return eventLetter;
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){	return @""; }
	
	[self audioDialogPlayer:@"cat"];
	
	[self eventSpellAdd:eventSpellId:eventSpell];
	[self eventDialog:eventDialogSpell:eventSpriteId];
	
	return @"";
}






-(NSString*)event_petunia:(NSString*)option
{
	if([option isEqualToString:@"postNotification"]){ return @""; }
	if([option isEqualToString:@"postUpdate"]){	return @""; }

	NSMutableArray* tiles = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"9",@"10",@"16",@"17",@"18",@"19",@"38",@"32",@"33",@"34",@"35",@"36",@"37",@"28",@"29",@"30",@"31",@"39",@"40",nil];
	
	self.floor11.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	self.floor01.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	self.floore1.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	
	self.floor10.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	self.floor00.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	self.floore0.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	
	self.floor1e.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	self.floor0e.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	self.flooree.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	
	NSMutableArray* walls = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",nil];
	
	self.wall1l.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",[self randomObject:walls]]];
	self.wall2l.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",[self randomObject:walls]]];
	self.wall3l.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",[self randomObject:walls]]];
	self.wall1r.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",[self randomObject:walls]]];
	self.wall2r.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",[self randomObject:walls]]];
	self.wall3r.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",[self randomObject:walls]]];
	
	[self audioDialogPlayer:@"petunia"];
	
	return @"";
}

- (NSString*)randomObject:(NSArray*)array
{
	if ([array count] == 0) {
		return nil;
	}
	return [array objectAtIndex: arc4random() % [array count]];
}

-(NSString*)event_cat:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	[self eventDialog:@"UUU":eventCat];
	[self audioDialogPlayer:@"cat"];
	
	return @"";
}

-(NSString*)event_catDoorFork:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	if(userGameCompleted ==1){
		[self eventWarpDramatic:@"112":@"1,1"];
	}
	else{
		[self eventWarp:@"42":@"1,1"];
	}
	
	return @"";
}

-(NSString*)event_catDoor:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	[self eventWarp:@"113":@"0,-1"];
	
	return @"";
}

-(NSString*)event_noface:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	[self eventDialog:dialogNoFace:eventNoFace];
	[self audioDialogPlayer:@"noface"];
	
	return @"";
}

-(NSString*)event_shuffleRoom:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	return @"";
}

-(void)shuffler
{
	NSMutableArray* tiles = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"9",@"10",@"38",@"32",@"33",@"34",@"35",@"36",@"37",@"28",@"29",@"30",@"31",@"39",@"40",nil];
	
	NSString* tileType1 = [self randomObject:tiles];
	NSString* tileType2 = [self randomObject:tiles];
	
	self.floor11.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType1]];
	self.floor01.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType2]];
	self.floore1.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType1]];
	
	self.floor10.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType2]];
	self.floor00.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	self.floore0.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType2]];
	
	self.floor1e.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType1]];
	self.floor0e.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType2]];
	self.flooree.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType1]];
	
	NSMutableArray* walls = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"25",@"26",@"28",@"31",@"34",@"35",@"36",@"37",nil];
	
	NSString* wallType1 = [self randomObject:walls];
	NSString* wallType2 = [self randomObject:walls];
	
	NSMutableArray* door = [NSMutableArray arrayWithObjects:@"30",@"10",@"11",@"12",@"13",@"14",nil];
	
	NSString* doorType = [self randomObject:door];
	
	self.wall1l.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",wallType2]];
	self.wall2l.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",doorType]];
	self.wall3l.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",wallType2]];
	self.wall1r.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",wallType1]];
	self.wall2r.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",doorType]];
	self.wall3r.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",wallType1]];
	
	NSMutableArray* step = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",nil];
	
	NSString* steptype = [self randomObject:step];
	
	self.step2l.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.l.png",steptype]];
	self.step2r.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.r.png",steptype]];
	
}

@end
