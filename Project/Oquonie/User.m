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

-(NSMutableDictionary*)new
{
    userData = [[NSMutableDictionary alloc] init];
    
    userData[@"location"] = @50;
    userData[@"x"] = @0;
    userData[@"y"] = @0;
    
    return userData;
}

@end