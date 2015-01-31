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
    return self;
}

-(void)map :(NSString*)name
{
    NSLog(@"~  DRAW | Map %@",name);
    [storyboard test];
    storyboard.roomContainer.frame = CGRectMake(0, 0, storyboard.view.frame.size.width, storyboard.view.frame.size.height);
}

-(void)dialog  :(NSString*)dialog :(NSString*)characterId
{
    
}

-(void)animateRoom
{
    NSLog(@"~  DRAW | animateRoom");
    storyboard.floorTile.frame = CGRectMake(100, 100, 100, 100);
    storyboard.floorTile.image = [NSImage imageNamed:@"tile.3"];
}

-(void)animateWalk
{
    NSLog(@"~  DRAW | animateWalk");
}

@end

#if TARGET_OS_IPHONE
// iOS code
#else
// OSX code
#endif