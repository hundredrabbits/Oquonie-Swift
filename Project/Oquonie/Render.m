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
    return self;
}

-(void)router :(Event*)event
{
    if( [[event name] isEqualToString:@"move"] ){ [self renderMove:event]; }
    if( [[event name] isEqualToString:@"event"] ){ [self renderEvent:event]; }
    if( [[event name] isEqualToString:@"block"] ){ [self renderBlock:event]; }
    if( [[event name] isEqualToString:@"warp"] ){ [self renderWarp:event]; }
}

-(void)renderMove :(Event*)event
{
    NSLog(@"! EVENT | Moving to: %d %d",[event x],[event y]);
    
    [user setX:[event x]];
    [user setY:[event y]];
}

-(void)renderWarp :(Event*)event
{
    NSLog(@"! EVENT | Warping to: %d %d %d",[event location],[event x],[event y]);
    [user setLocation:[event location]];
    [user setPosition:[event x]:[event y]];
    room = [[Room alloc] initWithArray:[world roomAtLocation:[user location]]];
}

-(void)renderEvent :(Event*)event
{
    NSLog(@"! EVENT | Event at: %d %d",[event x],[event y]);
}

-(void)renderBlock :(Event*)event
{
    NSLog(@"! EVENT | Blocked on: %d %d",[event x],[event y]);
    
}

@end
