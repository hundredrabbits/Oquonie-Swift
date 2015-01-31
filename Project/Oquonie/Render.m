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
    newDraw = [[Draw alloc] init];
    return self;
}

-(void)router :(Event*)event
{
    if( [[event type] isEqualToString:@"move"] ){ [self renderMove:event]; }
    if( [[event type] isEqualToString:@"event"] ){ [self renderEvent:event]; }
    if( [[event type] isEqualToString:@"block"] ){ [self renderBlock:event]; }
    if( [[event type] isEqualToString:@"warp"] ){ [self renderWarp:event]; }
}

-(void)renderMove :(Event*)event
{
    NSLog(@"! EVENT | Moving       | to: %d %d",[event x],[event y]);
    
    [user setX:[event x]];
    [user setY:[event y]];
    
    [newDraw animateWalk];
}

-(void)renderWarp :(Event*)event
{
    NSLog(@"! EVENT | Warp         | To:%d (%d %d)",[event location],[event x],[event y]);
    [user setLocation:[event location]];
    [user setPosition:[event x]:[event y]];
    room = [[Room alloc] initWithArray:[world roomAtLocation:[user location]]];
    [newDraw animateRoom];
}

-(void)renderEvent :(Event*)event
{
    NSLog(@"! EVENT | Event        | %@ (%d %d)",[event name],[event x],[event y]);
    Encounter* newEncounter = [[Encounter alloc] initWithName:[event name]];
    [newEncounter touch];
}

-(void)renderBlock :(Event*)event
{
    NSLog(@"! EVENT | Block        | (%d %d)",[event x],[event y]);
}

@end
