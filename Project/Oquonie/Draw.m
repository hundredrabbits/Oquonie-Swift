//
//  Draw.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-30.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "Draw.h"
#import "ViewController.h"

@implementation Draw

-(Draw*)init
{
    NSLog(@"WAT");
    return self;
}

-(void)map :(NSString*)name
{
    NSLog(@"~  DRAW | Map %@",name);
    [storyboard test];
}

-(void)dialog  :(NSString*)dialog :(NSString*)characterId
{
    
}

@end

#if TARGET_OS_IPHONE
// iOS code
#else
// OSX code
#endif