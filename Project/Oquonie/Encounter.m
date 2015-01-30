//
//  Encounter.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-30.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "Encounter.h"

@implementation Encounter

-(Encounter*)init
{
    return self;
}

-(Encounter*)initWithName :(NSString*)name
{
    encounterName = name;
    return self;
}

-(void)touch
{
    NSLog(@"- ENCNT + Touch        + %@", encounterName);
//    [self performSelector:NSSelectorFromString(@"test") withObject:@"postNotification"];
}

-(void)see
{
    NSLog(@"- ENCNT + See          + %@", encounterName);
}

@end
