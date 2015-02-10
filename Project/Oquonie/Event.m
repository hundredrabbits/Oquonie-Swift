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
    NSLog(@"+ EVENT | Init");
    eventData = [[NSMutableDictionary alloc] init];
    eventData[@"name"] = value;
    return self;
}

-(Event*)initWarp :(int)location :(int)x :(int)y
{
    NSLog(@"+ EVENT | Init");
    eventData = [[NSMutableDictionary alloc] init];
    eventData[@"type"] = @"warp";
    eventData[@"location"] = @(location);
    eventData[@"x"] = @(x);
    eventData[@"y"] = @(y);
    return self;
}

-(Event*)initWithTile :(Tile*)tile
{
    NSLog(@"+ EVENT | Init");
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

-(void)setName :(NSString*)value
{
    eventData[@"name"] = value;
}

-(void)setType :(NSString*)value
{
    eventData[@"type"] = value;
}

-(void)setCoordinates :(int)x :(int)y
{
    eventData[@"x"] = @(x);
    eventData[@"y"] = @(y);
}

-(void)setAudio :(NSString*)soundName
{
    eventData[@"audio"] = soundName;
}

-(void)setLocation :(int)value
{
    eventData[@"location"] = @(value);
}

@end
