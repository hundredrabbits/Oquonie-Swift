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
}

-(void)renderMove :(Event*)event
{
    NSLog(@"! EVENT | Moving to: %d %d",[event x],[event y]);
    
    [user setX:[event x]];
    [user setY:[event y]];
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
