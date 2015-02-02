//
//  Tile.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "Tile.h"

@implementation Tile

-(Tile*)initWithString :(NSString*)tileString
{    
    tileNode = [tileString componentsSeparatedByString: @"|"];
    return self;
}

-(int)isEmpty
{
    if( [[self value] isEqualToString:@"0"] || [[self value] isEqualToString:@""] ){
        return YES;
    }
    return NO;
}

-(int)isWarp
{
    if( [[self type] isEqualToString:@"warp"] ){
        return YES;
    }
    return NO;
}

-(int)isBlocker
{
    if( [[self type] isEqualToString:@"block"] ){
        return YES;
    }
    return NO;
}

-(int)isEvent
{
    if( [[self type] isEqualToString:@"event"] ){
        return YES;
    }
    return NO;
}

-(NSString*)value
{
    return [tileNode objectAtIndex:0];
}

-(NSString*)type
{
    if( [tileNode count] < 2 ){ return @""; }
    return [tileNode objectAtIndex:1];
}

-(NSString*)name
{
    if( [tileNode count] < 3 ){ return @""; }
    return [tileNode objectAtIndex:2];
}

-(NSString*)data
{
    if( [tileNode count] < 4 ){ return @""; }
    return [tileNode objectAtIndex:3];
}

-(NSString*)extras
{
    if( [tileNode count] < 5 ){ return @""; }
    return [tileNode objectAtIndex:4];
}

@end
