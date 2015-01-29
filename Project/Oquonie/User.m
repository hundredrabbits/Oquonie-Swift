//
//  User.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-29.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "User.h"

@implementation User

-(User*)init
{
    NSLog(@">  USER | Starting..");
    
    userData = [[NSMutableDictionary alloc] initWithDictionary:[self new]];
    
    // Or load
    
    return self;
}

-(NSString*)vertical
{
    return userData[@"vertical"];
}

-(void)setVertical :(NSString*)value
{
    userData[@"vertical"] = value;
}

-(NSString*)horizontal
{
    return userData[@"horizontal"];
}

-(void)setHorizontal :(NSString*)value
{
    userData[@"horizontal"] = value;
}

-(NSString*)state
{
    return userData[@"state"];
}

-(void)setState :(NSString*)value
{
    userData[@"state"] = value;
}

-(int)location
{
    return [userData[@"location"] intValue];
}

-(void)setLocation :(int)value
{
    userData[@"location"] = @(value);
}


-(NSString*)locationString
{
    return [NSString stringWithFormat:@"%@",userData[@"location"]];
}

-(int)x
{
    return [userData[@"x"] intValue];
}

-(void)setX :(int)value
{
    userData[@"x"] = @(value);
}

-(void)setY :(int)value
{
    userData[@"y"] = @(value);
}

-(int)enabled
{
    return [userData[@"enabled"] intValue];
}

-(void)setEnabled :(int)value
{
    userData[@"enabled"] = @(value);
}

-(int)character
{
    return [userData[@"character"] intValue];
}

-(void)setCharacter :(int)value
{
    userData[@"character"] = @(value);
}

-(int)y
{
    return [userData[@"y"] intValue];
}

-(void)clearSpellbook
{
    userData[@"spellbook"] = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
}

-(int)spellExists :(NSString*)spellId
{
    for (NSArray *spellbookItem in userData[@"spellbook"]) {
        if( [spellbookItem[0] isEqualToString:spellId] ){
            return TRUE;
        }
    }
    return FALSE;
}

-(NSMutableDictionary*)new
{
    userData = [[NSMutableDictionary alloc] init];
    
    userData[@"location"] = @50;
    userData[@"x"] = @0;
    userData[@"y"] = @0;
    userData[@"enabled"] = @0;
    userData[@"state"] = @"warp";
    userData[@"horizontal"] = @"l";
    userData[@"vertical"] = @"f";
    userData[@"spellbook"] = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
    
    return userData;
}

@end