//
//  UIViewController+worldNastazie.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2014-06-15.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "xxiivvEvents.h"
#import "eventsNastazie.h"

@implementation xxiivvViewController (worldNastazie)

-(void)createWorldNastazie
{ // |event|baba|35|r
	worldNode[130] = @[
	// Tiles
	@"36",@"39|event|shark|8|r",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"29|warp|131|-1,-1",@"99",@"100",@"99",@"29|warp|14|0,0",@"99",
	// Steps
	@"0",@"0",@"0",@"0",@"3|warp|14|0,0",@"0",
	// Name,Background,Audio
	@"Baba Castle",@"Black",audioNeomine];
	
	worldNode[131] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"29|warp|142|-1,0",@"100",@"99",@"29|warp|133|0,-1",@"100",
	// Steps
	@"0",@"0",@"0",@"3|warp|130|1,-1",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];
	
	worldNode[132] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"99",@"29|warp|143|-1,1",@"99",@"99",@"99",
	// Steps
	@"3|warp|140|1,1",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[133] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"29|warp|142|-1,0",@"99",@"99",@"99",@"99",
	// Steps
	@"0",@"3|warp|139|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[134] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"29|warp|141|0,-1",@"99",@"99",@"99",@"99",@"99",
	// Steps
	@"0",@"0",@"3|warp|138|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[135] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"99",@"29|warp|143|-1,1",@"99",@"99",@"29|warp|134|-1,-1",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[136] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"29|warp|142|-1,0",@"99",@"99",@"29|warp|133|0,-1",@"99",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[137] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"29|warp|141|-1,-1",@"99",@"99",@"29|warp|132|1,-1",@"99",@"99",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[138] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"29|warp|142|-1,0",@"99",@"99",@"99",@"29|warp|134|-1,-1",
	// Steps
	@"0",@"0",@"0",@"3|warp|137|1,-1",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[139] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"29|warp|141|-1,-1",@"99",@"99",@"99",@"29|warp|133|0,-1",@"99",
	// Steps
	@"0",@"0",@"0",@"0",@"3|warp|136|1,0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[140] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"29|warp|141|-1,-1",@"99",@"99",@"29|warp|132|1,-1",@"99",@"99",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"3|warp|135|1,1",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[141] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"99",@"99",@"99",@"99",@"99",
	// Steps
	@"3|warp|140|1,1",@"0",@"0",@"3|warp|137|1,-1",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[142] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"99",@"99",@"99",@"99",@"99",
	// Steps
	@"0",@"3|warp|139|0,1",@"0",@"0",@"3|warp|136|1,0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[143] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"99",@"99",@"99",@"99",@"99",
	// Steps
	@"0",@"0",@"3|warp|138|-1,1",@"0",@"0",@"3|warp|135|1,1",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	
	
}

@end
