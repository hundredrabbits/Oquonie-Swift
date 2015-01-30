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

-(Event*)initWithName :(NSString*)value
{
    eventData = [[NSMutableDictionary alloc] init];
    eventData[@"name"] = value;
    return self;
}
-(Event*)initWithType :(NSString*)value
{
    eventData = [[NSMutableDictionary alloc] init];
    eventData[@"type"] = value;
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

-(int)x
{
    return [eventData[@"x"] intValue];
}

-(int)y
{
    return [eventData[@"y"] intValue];
}

-(int)location
{
    return [eventData[@"location"] intValue];
}

-(NSString*)type
{
    return eventData[@"type"];
}

-(void)addName :(NSString*)value
{
    eventData[@"name"] = value;
}

-(void)addType :(NSString*)value
{
    eventData[@"type"] = value;
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
