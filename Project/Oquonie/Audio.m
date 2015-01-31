//
//  audio.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-30.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "Audio.h"

@implementation Audio

-(Audio*)init
{
    return self;
}

-(void)play :(NSString*)name
{
    NSLog(@"~ AUDIO | File: %@",name);
}

@end
