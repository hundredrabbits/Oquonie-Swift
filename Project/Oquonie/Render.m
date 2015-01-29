//
//  Draw.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-29.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "Render.h"
#import "Event.h"

@implementation Render

-(Render*)init
{
    return self;
}

-(void)add :(Event*)event
{
    NSLog(@"> RENDR | Added: %@",[event name]);
    [queue addObject:event];
}

@end
