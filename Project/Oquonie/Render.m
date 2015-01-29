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
    queue = [[NSMutableArray alloc] init];
    return self;
}

-(void)add :(Event*)event
{
    NSLog(@"> RENDR | Added: %@ Size: %lu",[event name], (unsigned long)[queue count] );
    [queue addObject:event];
    
    [self compile];
}

-(void)compile
{
    for (Event *event in queue) {
        NSLog(@"%@",[event name] );
    }
    [self emptyQueue];
}

-(void)emptyQueue
{
    queue = [[NSMutableArray alloc] init];
}

@end
