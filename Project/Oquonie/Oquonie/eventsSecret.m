//
//  xxiivvViewController+eventsSecret.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2/8/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvVariables.h"
#import "xxiivvSettings.h"
#import "xxiivvEvents.h"
#import "eventsSecret.h"
#import <Social/Social.h>

@implementation xxiivvViewController (eventsSecret)


-(NSString*)event_secretCat1 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"secretCat1";
	NSString*	eventDialogSpell	= dialogGainSpell(letterCat);
	NSString*	eventLetter			= letterCat;
	NSString*	eventSpriteId		= eventCat;
	int			eventSpell			= spellCat;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if(userCharacter == characterCat){ return @""; }
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


-(NSString*)event_secretCat2 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"secretCat2";
	NSString*	eventDialogSpell	= dialogGainSpell(letterCat);
	NSString*	eventLetter			= letterCat;
	NSString*	eventSpriteId		= eventCat;
	int			eventSpell			= spellCat;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if(userCharacter == characterCat){ return @""; }
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

-(NSString*)event_secretCat3 :(NSString*)option
{
	// Special Event Identifier
	NSString*	eventSpellId		= @"secretCat3";
	NSString*	eventDialogSpell	= dialogGainSpell(letterCat);
	NSString*	eventLetter			= letterCat;
	NSString*	eventSpriteId		= eventCat;
	int			eventSpell			= spellCat;
	
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		if(userCharacter == characterCat){ return @""; }
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

-(NSString*)event_noface:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return eventNoFace;
	}
	
	if( userCharacter == 7 ){
		
		[self moveDisable:4];
		[NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(roomClearDialog) userInfo:nil repeats:NO];
		[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(event_sharkTransform) userInfo:nil repeats:NO];
		[NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(event_nofaceWarp) userInfo:nil repeats:NO];
		
		[self audioDialogPlayer:@"noface"];
		[self eventDialog:dialogIntroduction:eventNoFace];
		
		// Clear Spellbook
		userSpellbook = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
	}
	else{
		[self audioDialogPlayer:@"noface"];
		[self eventDialog:dialogNoFace:eventNoFace];
	}
	return @"";
}

-(void)event_nofaceWarp
{
	[self eventTransitionPan:@"130":roomCenter];
}

-(NSString*)event_daniel:(NSString*)option
{
	// Broadcast Notification
	if([option isEqualToString:@"postNotification"]){
		return @"";
	}
	
	// Broadcast Event Sprite Change
	if([option isEqualToString:@"postUpdate"]){
		return @"";
	}
	
	[self eventDialog:@"UVW":@"34"];
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
		[self shuffler];
		return @"";
	}
	
	return @"";
}

-(NSString*)event_kamera:(NSString*)option
{
    if(![SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        return @"";
    }
    
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        return @"";
    }
    
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        return @"";
    }
    
    NSString* twitterText = @"";
    
    // Booth #1
    if(userLocation == 149){ twitterText = @"I have found the first of seven hidden photobooths in #oquonie.\n"; }
    // Booth #2
    if(userLocation == 150){ twitterText = @"I have found the second of seven hidden photobooths in #oquonie.\n"; }
    // Booth #3
    if(userLocation == 151){ twitterText = @"I have found the third of seven hidden photobooths in #oquonie.\n"; }
    // Booth #4
    if(userLocation == 152){ twitterText = @"I have found the fourth of seven hidden photobooths in #oquonie.\n"; }
    // Booth #5
    if(userLocation == 153){ twitterText = @"I have found the fifth of seven hidden photobooths in #oquonie.\n"; }
    // Booth #6
    if(userLocation == 154){ twitterText = @"I have found the sixth of seven hidden photobooths in #oquonie.\n"; }
    // Booth #7
    if(userLocation == 155){ twitterText = @"I have found the last of seven hidden photobooths in #oquonie!\n"; }
    
    // Take Screenshot
    CGRect rect = [self.view bounds];
    UIGraphicsBeginImageContextWithOptions(rect.size,YES,0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:context];
    UIImage *capturedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSString  *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/capturedImage.jpg"]];
    [UIImageJPEGRepresentation(capturedImage, 0.95) writeToFile:imagePath atomically:YES];
    
    SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [tweetSheet setInitialText:twitterText];
    [tweetSheet addImage:capturedImage];
    [self presentViewController:tweetSheet animated:YES completion:nil];
    
    return @"";
}

-(NSString*)event_gatePhotoBooth :(NSString*)option
{
    // Broadcast Notification
    if([option isEqualToString:@"postNotification"]){
        return @"";
    }
    // Broadcast Event Sprite Change
    if([option isEqualToString:@"postUpdate"]){
        // Booth #1
        if(userLocation == 3){ return @"104"; }
        // Booth #2
        if(userLocation == 37){ return @"105"; }
        // Booth #3
        if(userLocation == 46){ return @"106"; }
        // Booth #4
        if(userLocation == 66){ return @"107"; }
        // Booth #5
        if(userLocation == 89){ return @"110"; }
        // Booth #6
        if(userLocation == 102){ return @"108"; }
        // Booth #7
        if(userLocation == 142){ return @"109"; }
    }
    
    if(![SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        return @"";
    }
    
    // Booth #1
    if(userLocation == 3){ [self eventWarp:@"149" :@"0,-1"]; }
    // Booth #2
    if(userLocation == 37){ [self eventWarp:@"150" :@"-1,-1"]; }
    // Booth #3
    if(userLocation == 46){ [self eventWarp:@"151" :@"-1,0"]; }
    // Booth #4
    if(userLocation == 66){ [self eventWarp:@"152" :@"-1,0"]; }
    // Booth #5
    if(userLocation == 89){ [self eventWarp:@"153" :@"0,-1"]; }
    // Booth #6
    if(userLocation == 102){ [self eventWarp:@"154" :@"0,-1"]; }
    // Booth #7
    if(userLocation == 142){ [self eventWarp:@"155" :@"0,-1"]; }
    
    return @"";
}

-(void)shuffler
{
	NSLog(@"!!!!!!!!!!");
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
