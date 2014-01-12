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
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"25",@"25",@"25",
	// Steps
	@"0",@"0",@"3|warp|60|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Side Room",@"Black",@"lobby"];
	
	worldNode[62] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"3|warp|60|1,1",@"0",@"3|warp|60|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",@"lobby"];
	
	worldNode[63] = @[
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


	worldNode[64] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"3|warp|60|1,1",@"0",@"3|warp|60|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",@"lobby"];

	worldNode[65] = @[
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


	worldNode[66] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"3|warp|60|1,1",@"0",@"3|warp|60|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",@"lobby"];

	worldNode[67] = @[
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

	worldNode[68] = @[
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


	worldNode[69] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"3|warp|60|1,1",@"0",@"3|warp|60|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",@"lobby"];
	
}
@end
