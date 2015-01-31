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
}

-(void)dialog  :(NSString*)dialog :(NSString*)characterId
{
    
}

-(void)animateRoom
{
    NSLog(@"~  DRAW | animateRoom");
    storyboard.roomContainer.frame = storyboard.view.frame;
    storyboard.floor11.frame = CGRectMake(100, 100, 100, 100);
    storyboard.floor11.image = [NSImage imageNamed:@"tile.3"];
    
    storyboard.floor00.frame = [position tile:0 :0 :0];
    storyboard.floor1e.frame = [position tile:0 :-1 :1];
    storyboard.floore1.frame = [position tile:0 :1 :-1];
    storyboard.floor10.frame = [position tile:0 :1 :0];
    storyboard.floor01.frame = [position tile:0 :0 :1];
    storyboard.floor0e.frame = [position tile:0 :0 :-1];
    storyboard.floore0.frame = [position tile:0 :-1 :0];
    storyboard.floor11.frame = [position tile:0 :1 :1];
    storyboard.flooree.frame = [position tile:0 :-1 :-1];
    
    storyboard.floor00.image = [self tileImageAtId:0:0];
    storyboard.floor1e.image = [self tileImageAtId:1:-1];
    storyboard.floore1.image = [self tileImageAtId:-1:1];
    storyboard.floor10.image = [self tileImageAtId:1:0];
    storyboard.floor01.image = [self tileImageAtId:0:1];
    storyboard.floor0e.image = [self tileImageAtId:0:-1];
    storyboard.floore0.image = [self tileImageAtId:-1:0];
    storyboard.floor11.image = [self tileImageAtId:1:1];
    storyboard.flooree.image = [self tileImageAtId:-1:-1];
    
}

-(void)animateWalk
{
    NSLog(@"~  DRAW | animateWalk");
}

-(NSImage*)tileImageAtId :(int)x :(int)y
{
    Tile* tile = [[Tile alloc] initWithString:[room tileAtLocation:x :y]];
    
    if( x == 2 ){ return [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png", [tile value] ]]; }
    if( y == 2 ){ return [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png", [tile value] ]]; }
    if( y == -2 ){ return [NSImage imageNamed:[NSString stringWithFormat:@"step.%@.l.png", [tile value] ]]; }
    if( x == -2 ){ return [NSImage imageNamed:[NSString stringWithFormat:@"step.%@.r.png", [tile value] ]]; }
    
    return [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png", [tile value] ]];
}

@end

#if TARGET_OS_IPHONE
// iOS code
#else
// OSX code
#endif