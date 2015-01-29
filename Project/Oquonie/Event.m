//
//  Event.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-29.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "Event.h"
#import "Tile.h"

@implementation Event

-(Event*)initWithName :(NSString*)name
{
    eventData = [[NSMutableDictionary alloc] init];
    eventData[@"name"] = name;
    return self;
}

-(Event*)initWithTile :(Tile*)tile
{
    eventData = [[NSMutableDictionary alloc] init];
    eventData[@"name"] = [tile name];
    return self;
}

-(NSString*)name
{
    return eventData[@"name"];
}

-(void)addName :(NSString*)name
{
    eventData[@"name"] = name;
}

-(void)addCoordinates :(int)x :(int)y
{
    eventData[@"x"] = @(x);
    eventData[@"y"] = @(y);
}

-(void)addAudio :(NSString*)soundName
{
    eventData[@"audio"] = soundName;
}

-(void)addLocation :(int)value
{
    eventData[@"location"] = @(value);
}

@end
