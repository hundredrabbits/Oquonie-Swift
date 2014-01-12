//
//  xxiivvViewController+worldNeophine.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "worldNeomine.h"

@implementation xxiivvViewController (worldNeomine)

-(void)createWorldNeomine
{
	worldNode[60] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1",@"0",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"14|warp|62|1,-1",@"16",@"14|warp|61|-1,-1",
	// Steps
	@"0",@"0",@"0",@"0",@"3|event|gateNeomine",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",@"lobby"];
	
	worldNode[61] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1",@"1",@"1|event|neomineNepomucene1|5|l",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"25",@"25",@"25",
	// Steps
	@"0",@"0",@"3|warp|60|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Side Room",@"Black",@"lobby"];
	
	worldNode[62] = @[
	// Tiles
	@"1",@"1",@"1|event|neomineNecomedre1|2|l",
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"0",@"4|event|gateNecomedre",@"0",
	// Steps
	@"3|warp|60|1,1",@"0",@"3|warp|63|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",@"lobby"];
	
	worldNode[63] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1",@"0",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"14|warp|66|1,-1",@"14|warp|64|0,-1",@"14|warp|62|-1,-1",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",@"lobby"];


	worldNode[64] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1",@"1|event|pillarNeomine|15|l",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"3|warp|68|1,1",@"3|warp|63|0,1",@"3|warp|65|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",@"lobby"];

	worldNode[65] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1|event|neomineNepomucene3|5|r",@"0",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"14|warp|64|-1,-1",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",@"lobby"];

	worldNode[66] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1",@"1",@"1|event|owlSave|1|l",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"3|warp|63|1,1",@"3|warp|67|0,1",@"3|warp|68|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",@"lobby"];

	worldNode[67] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1|event|neomineNepomucene2|5|r",@"0",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"0",@"14|warp|66|0,-1",@"0",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",@"lobby"];

	worldNode[68] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1",@"0",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"1",@"0",@"14|warp|66|1,-1",@"14|warp|69|0,-1",@"14|warp|66|-1,-1",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",@"lobby"];

	worldNode[69] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"0",@"8|event|gateNepomucene",@"0",
	// Steps
	@"0",@"3|warp|68|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Nestorine Exit",@"White",@"lobby"];
	
	worldNode[70] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"0",@"3|event|gateNepomucene",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Nestorine Warp",@"White",@"lobby"];
	
	worldNode[71] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"0",@"3|event|gateNecomedre",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Warp",@"White",@"lobby"];
	
}
@end
