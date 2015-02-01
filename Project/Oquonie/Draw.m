//
//  Draw.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-30.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "Draw.h"
#import "xxiivvVariables.h"
#import "xxiivvSettings.h"

#import "ViewController.h"

@implementation Draw

-(Draw*)init
{
    room = [[Room alloc] initWithArray:[world roomAtLocation:[user location]]];
    position = [[Position alloc] initWithView:storyboard.view.frame];
    return self;
}

-(void)map :(NSString*)name
{
    NSLog(@"~  DRAW | Map %@",name);
}

-(void)dialog  :(NSString*)dialog :(NSString*)characterId
{
    
}

-(void)animateRoom
{
    NSLog(@"~  DRAW | animateRoom");
    storyboard.roomContainer.frame = storyboard.view.frame;
    
    storyboard.floor00.frame = [position tile:0 :0 :0];
    storyboard.floor1e.frame = [position tile:0 :1 :-1];
    storyboard.floore1.frame = [position tile:0 :-1 :1];
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
    
    storyboard.wall1l.frame = [position tile:5 :2 :-1];
    storyboard.wall2l.frame = [position tile:5 :2 : 0];
    storyboard.wall3l.frame = [position tile:5 :2 : 1];
    
    storyboard.wall1r.frame = [position tile:5 : -1 : 2];
    storyboard.wall2r.frame = [position tile:5 : 0 : 2];
    storyboard.wall3r.frame = [position tile:5 : 1 : 2];
    
    storyboard.step1l.frame = [position tile:0 :1 :-2];
    storyboard.step2l.frame = [position tile:0 :0 :-2];
    storyboard.step3l.frame = [position tile:0 :-1 :-2];
    
    storyboard.step1r.frame = [position tile:0 :-2 : -1];
    storyboard.step2r.frame = [position tile:0 :-2 : 0];
    storyboard.step3r.frame = [position tile:0 :-2 : 1];
    
    storyboard.wall1l.image = [self tileImageAtId:2:-1];
    storyboard.wall2l.image = [self tileImageAtId:2:0];
    storyboard.wall3l.image = [self tileImageAtId:2:1];
    storyboard.wall1r.image = [self tileImageAtId:1:2];
    storyboard.wall2r.image = [self tileImageAtId:0:2];
    storyboard.wall3r.image = [self tileImageAtId:-1:2];

    storyboard.step1l.image = [self tileImageAtId:1:-2];
    storyboard.step2l.image = [self tileImageAtId:0:-2];
    storyboard.step3l.image = [self tileImageAtId:-1:-2];
    storyboard.step1r.image = [self tileImageAtId:-2:-1];
    storyboard.step2r.image = [self tileImageAtId:-2:0];
    storyboard.step3r.image = [self tileImageAtId:-2:1];
    
}

-(void)animateWalk
{
    NSLog(@"~  DRAW | animateWalk");
}

-(NSImage*)tileImageAtId :(int)x :(int)y
{
    Tile* tile = [[Tile alloc] initWithString:[room tileAtLocation:x :y]];
    
    if( x == 2 ){ return [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.r", [tile value] ]]; }
    if( y == 2 ){ return [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.l", [tile value] ]]; }
    if( y == -2 ){ return [NSImage imageNamed:[NSString stringWithFormat:@"step.1.l", [tile value] ]]; }
    if( x == -2 ){ return [NSImage imageNamed:[NSString stringWithFormat:@"step.1.r", [tile value] ]]; }
    
    return [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@", [tile value] ]];
}

@end

#if TARGET_OS_IPHONE
// iOS code
#else
// OSX code
#endif