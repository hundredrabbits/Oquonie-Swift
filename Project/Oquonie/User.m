//
//  User.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-29.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "User.h"

@implementation User

-(User*)init
{
    NSLog(@">  USER | Starting..");
    
    userData = [[NSMutableDictionary alloc] initWithDictionary:[self new]];
    
    // Or load
    
    return self;
}

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

-(NSString*)state
{
    return userData[@"state"];
}

-(void)setState :(NSString*)value
{
    userData[@"state"] = value;
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

-(int)x
{
    return [userData[@"x"] intValue];
}

-(void)setX :(int)value
{
    userData[@"x"] = @(value);
}

-(void)setY :(int)value
{
    userData[@"y"] = @(value);
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

-(int)character
{
    return [userData[@"character"] intValue];
}

-(void)setCharacter :(int)value
{
    userData[@"character"] = @(value);
}

-(int)y
{
    return [userData[@"y"] intValue];
}

-(void)clearSpellbook
{
    userData[@"spellbook"] = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
}

-(void)eventCollect :(int)eventId
{
    userData[@"events"][eventId] = @1;
}

-(void)eventRemove :(int)eventId
{
    userData[@"events"][eventId] = @0;
}

-(void)save
{
    NSLog(@"TODO");
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

-(void)spellCollect :(NSString*)spellId :(int)spellType
{
    if(spellType == [self character]){
        NSLog(@"  EVENT | Spell        | Already type:%d",spellType);
        return;
    }
    
    int index = 0;
    for (NSArray *spellbookItem in userData[@"spellbook"]) {
        if( [spellbookItem[0] isEqualToString:spellId] && [spellbookItem[1] intValue] == spellType){
            NSLog(@"- EVENT | Spell        | Removed  -> id:%@ type:%d",spellId,spellType);
            userData[@"spellbook"][index] = @[@"",@""];
            return;
        }
        index += 1;
    }
    
    int spellSlot = -1;
    if( [userData[@"spellbook"][0][0] isEqualToString:@""] ){ spellSlot = 0; }
    else if( [userData[@"spellbook"][1][0] isEqualToString:@""] ){ spellSlot = 1; }
    else if( [userData[@"spellbook"][2][0] isEqualToString:@""] ){ spellSlot = 2; }
    
    if(spellSlot > -1){
        NSLog(@"> EVENT | Spell        | Added    -> id:%@ type:%d slot:%d",spellId,spellType,spellSlot);
        userData[@"spellbook"][spellSlot] = @[[NSString stringWithFormat:@"%@",spellId],[NSString stringWithFormat:@"%d",spellType]];
    }
    else{
        NSLog(@"> EVENT | Spell        | No available slot");
    }
}

-(int)eventExists :(int)eventId
{
    if( userData[@"events"] ){
        return TRUE;
    }
    return FALSE;
}

-(int)isListening
{
    if( userData[@"isListening"] ){
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
    if( userData[@"isTalking"] ){
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
    if( userData[@"isFinished"] ){
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
    userData = [[NSMutableDictionary alloc] init];
    
    userData[@"character"] = @1;
    userData[@"location"] = @50;
    userData[@"x"] = @0;
    userData[@"y"] = @0;
    userData[@"enabled"] = @0;
    userData[@"state"] = @"warp";
    userData[@"horizontal"] = @"l";
    userData[@"vertical"] = @"f";
    userData[@"spellbook"] = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
    userData[@"events"] = [NSMutableArray arrayWithObjects:@"",nil];
    
    userData[@"isListening"] = @1;
    userData[@"isTalking"] = @0;
    userData[@"isFinished"] = @0;
    
    int myCount = 0;
    while ( myCount < 40 )	{ myCount++; userData[@"events"][myCount] = @"";	}
    
    return userData;
}

@end