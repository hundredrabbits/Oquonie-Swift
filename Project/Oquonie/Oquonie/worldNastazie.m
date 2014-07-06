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
	@"36",@"39|event|nastazieNastazie1|35|r",@"36",
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
	@"39",@"0",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"29|warp|142|-1,0",@"100",@"99",@"29|warp|133|0,-1",@"100",
	// Steps
	@"0",@"0",@"0",@"3|warp|130|1,-1",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];
	
	worldNode[132] = @[
	// Tiles
	@"36",@"39",@"9",
	@"39",@"28",@"10|event|nastazieNemedique1|6|l",
	@"36",@"39",@"10",
	// Walls
	@"99",@"99",@"29|warp|143|-1,1",@"99",@"99",@"99",
	// Steps
	@"3|warp|140|1,1",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[133] = @[
	// Tiles
	@"36",@"39",@"10",
	@"39",@"28",@"9|event|nastazieNeomine1|4|l",
	@"36",@"39",@"10",
	// Walls
	@"99",@"29|warp|142|-1,0",@"99",@"99",@"99",@"99",
	// Steps
	@"0",@"3|warp|139|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[134] = @[
	// Tiles
	@"36",@"39",@"10",
	@"39",@"28",@"10|event|nastazieNephtaline2|3|l",
	@"36",@"39",@"9",
	// Walls
	@"29|warp|141|-1,-1",@"99",@"99",@"99",@"99",@"99",
	// Steps
	@"0",@"0",@"3|warp|138|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[135] = @[
	// Tiles
	@"36",@"39|event|nastazieNemedique2|6|r",@"36",
	@"39",@"28",@"39",
	@"10",@"10",@"9",
	// Walls
	@"99",@"99",@"29|warp|143|-1,1",@"99",@"99",@"29|warp|134|-1,-1",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[136] = @[
	// Tiles
	@"36",@"39",@"36|event|nastazieNastazie3|35|r",
	@"39",@"19",@"39",
	@"10",@"9",@"10",
	// Walls
	@"99",@"29|warp|142|-1,0",@"99",@"99",@"29|warp|133|0,-1",@"99",
	// Steps
	@"0",@"0",@"0",@"0",@"3|warp|131|1,0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[137] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"9",@"10",@"10",
	// Walls
	@"29|warp|141|-1,-1",@"99",@"99",@"29|warp|132|1,-1",@"99",@"99",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[138] = @[
	// Tiles
	@"10",@"39",@"36|event|nastazieNemedique3|6|r",
	@"10",@"28",@"39",
	@"9",@"39",@"36",
	// Walls
	@"99",@"29|warp|142|-1,0",@"99",@"99",@"99",@"29|warp|134|-1,-1",
	// Steps
	@"0",@"0",@"0",@"3|warp|137|1,-1",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[139] = @[
	// Tiles
	@"10",@"39",@"36|event|nastazieNeomine2|4|l",
	@"9",@"17",@"39",
	@"10",@"39",@"36",
	// Walls
	@"29|warp|141|-1,-1",@"99",@"99",@"99",@"29|warp|133|0,-1",@"99",
	// Steps
	@"0",@"3|warp|131|0,1",@"0",@"0",@"3|warp|136|1,0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[140] = @[
	// Tiles
	@"9",@"39",@"36",
	@"10",@"28",@"39|event|nastazieNephtaline1|3|l",
	@"10",@"39",@"36",
	// Walls
	@"29|warp|141|-1,-1",@"99",@"99",@"29|warp|132|1,-1",@"99",@"99",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"3|warp|135|1,1",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[141] = @[
	// Tiles
	@"9",@"10",@"10",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"5|event|gateNastazie",@"99",@"99",@"99",@"99",
	// Steps
	@"3|warp|140|1,1",@"0",@"0",@"3|warp|137|1,-1",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[142] = @[
	// Tiles
	@"10",@"9",@"10",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"5|event|gateNeomine",@"99",@"99",@"99",@"99",
	// Steps
	@"0",@"3|warp|139|0,1",@"0",@"0",@"3|warp|136|1,0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[143] = @[
	// Tiles
	@"10",@"10",@"9",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"5|event|gateNemedique",@"99",@"99",@"99",@"99",
	// Steps
	@"0",@"0",@"3|warp|138|-1,1",@"0",@"0",@"3|warp|135|1,1",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];
	
	worldNode[144] = @[
	// Tiles
	@"36",@"39",@"3|event|nastazieNastazie2|35|r",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"99",@"99",@"99",@"99",@"99",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"3|warp|141|1,1",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[145] = @[
	// Tiles
	@"36",@"39",@"36|event|nastazieNephtaline3|3|r",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"99",@"99",@"99",@"99",@"99",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"3|warp|142|1,1",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	worldNode[146] = @[
	// Tiles
	@"36",@"39",@"36|event|nastazieNeomine3|4|l",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"99",@"99",@"99",@"99",@"99",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"3|warp|143|1,1",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];

	
	
}

@end
