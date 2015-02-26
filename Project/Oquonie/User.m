//
//  User.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-29.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "User.h"
#import "xxiivvSettings.h"

@implementation User

-(User*)init
{
    NSLog(@"+  USER | Init");
	
	userData = [[NSMutableDictionary alloc] initWithDictionary:[self new]];
	
	if( [[NSUserDefaults standardUserDefaults] objectForKey:@"savedGame"] ){
		[self load];
	}
	
	[self setHorizontal:@"l"];
	[self setVertical:@"b"];
	[self setEnabled:1];
	[self setLock:0];
	
    return self;
}

# pragma mark Location -

-(NSString*)vertical
{
    return userData[@"vertical"];
}

-(void)setVertical :(NSString*)value
{
    userData[@"vertical"] = value;
}

-(NSString*)horizontal
{
    return userData[@"horizontal"];
}

-(void)setHorizontal :(NSString*)value
{
    userData[@"horizontal"] = value;
}

-(int)location
{
	return [userData[@"location"] intValue];
}

-(void)setLocation :(int)value
{
	userData[@"location"] = @(value);
}

-(NSString*)locationString
{
	return [NSString stringWithFormat:@"%@",userData[@"location"]];
}

# pragma mark State -

-(NSString*)state
{
    return userData[@"state"];
}

-(void)setState :(NSString*)value
{
	if( [userData[@"locked"] intValue] == 1 ){ return; }
    userData[@"state"] = value;
}

-(int)enabled
{
	return [userData[@"enabled"] intValue];
}

-(void)setEnabled :(int)value
{
	NSLog(@"•  USER | Move         | Enabled: %d",value);
	userData[@"enabled"] = @(value);
}

# pragma mark Position -

-(int)x
{
    return [userData[@"x"] intValue];
}

-(void)setPosition :(int)x :(int)y
{
    userData[@"x"] = @(x);
    userData[@"y"] = @(y);
}

-(void)setX :(int)value
{
    userData[@"x"] = @(value);
}

-(void)setY :(int)value
{
    userData[@"y"] = @(value);
}

-(int)y
{
	return [userData[@"y"] intValue];
}

# pragma mark Character -

-(int)character
{
    return [userData[@"character"] intValue];
}

-(void)setCharacter :(int)value
{
	NSLog(@"•  USER | Character    | Set: %d",value);
    userData[@"character"] = @(value);
}

# pragma mark Spells -

-(void)clearSpellbook
{
	userData[@"spellbook"] = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
}

-(int)spellExists :(NSString*)spellId
{
	for (NSArray *spellbookItem in userData[@"spellbook"]) {
		if( [spellbookItem[0] isEqualToString:spellId] ){
			return TRUE;
		}
	}
	return FALSE;
}

-(int)spellCount
{
	int count = 0;
	for (NSArray *spellbookItem in userData[@"spellbook"]) {
		if([spellbookItem[1] intValue] != 0){
			count += 1;
		}
	}
	return count;
}

-(int)spell :(int)value
{
	return [userData[@"spellbook"][value][1] intValue];
}

# pragma mark Events -

-(void)eventCollect :(int)eventId
{
	userData[@"events"][eventId] = @1;
}

-(void)eventRemove :(int)eventId
{
	userData[@"events"][eventId] = @0;
}

-(int)eventExists :(int)eventId
{
	if( [userData[@"events"][eventId] intValue] == 1 ){
		return TRUE;
	}
	return FALSE;
}

# pragma mark Misc -

-(void)setLock :(int)value
{
	NSLog(@"•  USER | Override     | Set: %d",value);
	userData[@"locked"] = @(value);
}

-(void)save
{
	NSLog(@"•  USER | Save         | ");
	[[NSUserDefaults standardUserDefaults] setObject:userData forKey:@"savedGame"];
}

-(int)isListening
{
    if( [userData[@"isListening"] intValue] == 1 ){
        return TRUE;
    }
    return FALSE;
}

-(void)listening :(int)value
{
    userData[@"isListening"] = @(value);
}

-(int)isTalking
{
    if( [userData[@"isTalking"] intValue] == 1 ){
        return TRUE;
    }
    return FALSE;
}

-(void)talking :(int)value
{
    userData[@"isTalking"] = @(value);
}

-(int)isFinished
{
    if( [userData[@"isFinished"] intValue] == 1 ){
        return TRUE;
    }
    return FALSE;
}
-(void)finishing :(int)value
{
    userData[@"isFinished"] = @(value);
}

-(NSMutableDictionary*)new
{
	NSLog(@"+  USER | New Game!");
    userData = [[NSMutableDictionary alloc] init];
    
    userData[@"character"] = @1;
    userData[@"location"] = @(spawnLocation);
    userData[@"x"] = @0;
    userData[@"y"] = @0;
    userData[@"enabled"] = @0;
    userData[@"state"] = @"warp";
    userData[@"horizontal"] = @"l";
    userData[@"vertical"] = @"f";
    userData[@"spellbook"] = [[NSMutableArray alloc] initWithArray:[NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil]];
    userData[@"events"] = [[NSMutableArray alloc] initWithArray:@[@""]];
    
    userData[@"isListening"] = @1;
    userData[@"isTalking"] = @0;
    userData[@"isFinished"] = @0;
    
    int myCount = 0;
    while ( myCount < 40 )	{ myCount++; userData[@"events"][myCount] = @"";	}
    
    return userData;
}

-(void)load
{
	NSLog(@"+  USER | Loading");
	NSMutableDictionary * test = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedGame"];
	
	userData[@"character"] = test[@"character"];
	userData[@"location"] = test[@"location"];
	userData[@"x"] = test[@"x"];
	userData[@"y"] = test[@"y"];
	
	userData[@"spellbook"] = [test[@"spellbook"] mutableCopy];
	userData[@"events"] = [test[@"events"] mutableCopy];
	
	userData[@"isListening"] = test[@"isListening"];
	userData[@"isTalking"] = @0;
	userData[@"isFinished"] = userData[@"isFinished"];
}

@end