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
	
	if( [user enabled] == 0 ){
		return;
	}
	else if( [user isTalking] ){
		[newDraw closeDialog];
		[newDraw mapHide];
		return;
	}
    else if( [destination isEmpty] || [destination isBlocker] ){
        Event * newEvent = [[Event alloc] initWithTile:destination];
        [newEvent setType:@"block"];
        [newEvent setCoordinates:[user x]+posX:[user y]+posY];
        [render router:newEvent];
        return;
    }
    else if( [destination isWarp] ){
        Event * newEvent = [[Event alloc] initWithTile:destination];
        NSArray* coordinates = [[destination data] componentsSeparatedByString: @","];
        [newEvent setType:@"warp"];
        [newEvent setCoordinates:[coordinates[0] intValue]:[coordinates[1] intValue]];
        [newEvent setLocation:[[destination name] intValue]];
        [render router:newEvent];
        return;
    }
	else if( [destination isEvent] ){
        Event * newEvent = [[Event alloc] initWithTile:destination];
        [newEvent setType:@"event"];
        [newEvent setCoordinates:[user x]+posX:[user y]+posY];
        [render router:newEvent];
        return;
    }
    else if( ([user x]+posX) > 1 || ([user x]+posX) < -1 || ([user y]+posY) > 1 || ([user y]+posY) < -1 ){
        Event * newEvent = [[Event alloc] initWithTile:destination];
        [newEvent setType:@"block"];
        [newEvent setCoordinates:[user x]+posX:[user y]+posY];
        [render router:newEvent];
        return;
    }
	else{
		// Move
		Event * newEvent = [[Event alloc] initWithTile:destination];
		[newEvent setType:@"move"];
		[newEvent setCoordinates:[user x]+posX:[user y]+posY];
		[render router:newEvent];
	
	}
	
}


@end
