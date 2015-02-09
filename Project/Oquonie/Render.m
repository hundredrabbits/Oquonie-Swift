//
//  Draw.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-29.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "Render.h"
#import "Event.h"
#import "xxiivvSettings.h"
#import "xxiivvVariables.h"

@implementation Render

-(Render*)init
{
    NSLog(@"+ RENDR | Init");
    newDraw = [[Draw alloc] init];
    return self;
}

-(void)router :(Event*)event
{
    if( [[event type] isEqualToString:@"move"] ){ [self renderMove:event]; }
    else if( [[event type] isEqualToString:@"event"] ){ [self renderEvent:event]; }
    else if( [[event type] isEqualToString:@"block"] ){ [self renderBlock:event]; }
    else if( [[event type] isEqualToString:@"warp"] ){ [self renderWarp:event]; }
}

-(void)renderMove :(Event*)event
{
    NSLog(@"  RENDR | Moving       | to: %d %d",[event x],[event y]);
    
    [user setX:[event x]];
    [user setY:[event y]];
    
    newDraw = [[Draw alloc] init];
    [newDraw animateWalk];
}

-(void)renderWarp :(Event*)event
{
    NSLog(@"  RENDR | Warp         | To:%d (%d %d)",[event location],[event x],[event y]);
    [user setLocation:[event location]];
    [user setPosition:[event x]:[event y]];
    room = [[Room alloc] initWithArray:[world roomAtLocation:[user location]]];
	[newDraw room];
	[newDraw spellbookHide];
}

-(void)renderEvent :(Event*)event
{
    NSLog(@"  RENDR | Event        | %@ (%d %d)",[event name],[event x],[event y]);
    Encounter* newEncounter = [[Encounter alloc] initWithName:[event name]];
    [newEncounter touch];
}

-(void)renderBlock :(Event*)event
{
    NSLog(@"  RENDR | Block        | (%d %d)",[event x],[event y]);
	[newDraw animateBlock];
}

-(void)spellCollect :(NSString*)spellId :(int)spellType
{
    if(spellType == [user character]){
		NSLog(@"  RENDR | Spell        | Already type:%d",spellType);
		[newDraw notifications];
		[newDraw spellbookDisplay];
        return;
    }
    
    int index = 0;
    for (NSArray *spellbookItem in userData[@"spellbook"]) {
        if( [spellbookItem[0] isEqualToString:spellId] && [spellbookItem[1] intValue] == spellType){
            NSLog(@"  RENDR | Spell        | Removed  -> id:%@ type:%d",spellId,spellType);
			userData[@"spellbook"][index] = @[@"",@""];
			[newDraw notifications];
			[newDraw spellbookDisplay];
            return;
        }
        index += 1;
    }
    
    int spellSlot = -1;
    if( [userData[@"spellbook"][0][0] isEqualToString:@""] ){ spellSlot = 0; }
    else if( [userData[@"spellbook"][1][0] isEqualToString:@""] ){ spellSlot = 1; }
    else if( [userData[@"spellbook"][2][0] isEqualToString:@""] ){ spellSlot = 2; }
    
    if(spellSlot > -1){
        NSLog(@"  RENDR | Spell        | Added    -> id:%@ type:%d slot:%d",spellId,spellType,spellSlot);
        userData[@"spellbook"][spellSlot] = @[[NSString stringWithFormat:@"%@",spellId],[NSString stringWithFormat:@"%d",spellType]];
    }
    else{
        NSLog(@"  RENDR | Spell        | No available slot");
    }
    
    if( userData[@"spellbook"][0][1] == userData[@"spellbook"][1][1] && userData[@"spellbook"][1][1] == userData[@"spellbook"][2][1] ){
        NSLog(@"  RENDR | Transform    | %d",[userData[@"spellbook"][1][1] intValue]);
        [user setCharacter:[userData[@"spellbook"][1][1] intValue]];
        [user clearSpellbook];
        [newDraw animateTransform];
	}
	[newDraw spellbookDisplay];
	[newDraw notifications];
}

@end
