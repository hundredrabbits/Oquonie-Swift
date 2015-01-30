//
//  Input.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-30.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//
#import "xxiivvVariables.h"
#import "Input.h"

@implementation Input

-(Input*)init
{
    NSLog(@"======= + ============ + ===================");
    return self;
}

- (void)router:(int)posX :(int)posY
{
    Tile* destination = [[Tile alloc] initWithString:[room tileAtLocation:[user x]+posX :[user y]+posY]];
    
    // Event
    
    if( [destination isEmpty] || [destination isBlocker] ){
        Event * newEvent = [[Event alloc] initWithTile:destination];
        [newEvent addType:@"block"];
        [newEvent addCoordinates:[user x]+posX:[user y]+posY];
        [render router:newEvent];
        return;
    }
    else if( [destination isWarp] ){
        Event * newEvent = [[Event alloc] initWithTile:destination];
        NSArray* coordinates = [[destination data] componentsSeparatedByString: @","];
        [newEvent addType:@"warp"];
        [newEvent addCoordinates:[coordinates[0] intValue]:[coordinates[1] intValue]];
        [newEvent addLocation:[[destination name] intValue]];
        [render router:newEvent];
        return;
    }
    else if( [destination isEvent] ){
        Event * newEvent = [[Event alloc] initWithTile:destination];
        [newEvent addType:@"event"];
        [newEvent addCoordinates:[user x]+posX:[user y]+posY];
        [render router:newEvent];
        return;
    }
    else if( ([user x]+posX) > 1 || ([user x]+posX) < -1 || ([user y]+posY) > 1 || ([user y]+posY) < -1 ){
        Event * newEvent = [[Event alloc] initWithTile:destination];
        [newEvent addType:@"block"];
        [newEvent addCoordinates:[user x]+posX:[user y]+posY];
        [render router:newEvent];
        return;
    }
    
    // Move
    Event * newEvent = [[Event alloc] initWithTile:destination];
    [newEvent addType:@"move"];
    [newEvent addCoordinates:[user x]+posX:[user y]+posY];
    [render router:newEvent];
}


@end
