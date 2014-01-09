//
//  xxiivvViewController+worldNecomedre.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 12/30/2013.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "worldNecomedre.h"

@implementation xxiivvViewController (worldNecomedre)

-(void)createWorldNecomedre
{
	worldNode[21] = @[
	// Tiles
	@"21",@"21",@"21",
	@"21",@"21|block|14",@"21",
	@"21",@"21",@"21",
	// Walls
	@"20",@"20",@"20",@"24|warp|24|1,-1",@"21",@"20",
	// Steps
	@"0",@"0",@"0",@"10|warp|22|1,-1",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
	
	worldNode[22] = @[
	// Tiles
	@"21",@"21|event|speakerphone|9|r",@"21|block|15",
	@"21",@"21",@"21",
	@"21",@"21",@"21|block|16",
	// Walls
	@"24|warp|21|-1,-1",@"20",@"20",@"20",@"21",@"20",
	// Steps
	@"0",@"0",@"0",@"0",@"10|warp|23|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
	
	worldNode[23] = @[
	// Tiles
	@"21|event|photocopier2|11|l",@"21",@"21|block|15",
	@"21",@"21",@"21",
	@"21|block|15",@"21",@"21|block|15",
	// Walls
	@"19",@"24|warp|22|-1,0",@"19",@"19",@"24|warp|26|0,-1",@"19",
	// Steps
	@"0",@"10|warp|28|0,1",@"0",@"0",@"10|warp|24|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
	
	worldNode[24] = @[
	// Tiles
	@"21",@"21",@"21|block|14",
	@"21",@"21",@"21",
	@"21|block|16",@"21",@"21",
	// Walls
	@"20",@"24|warp|23|-1,0",@"20",@"20",@"24|warp|27|0,-1",@"21",
	// Steps
	@"10|warp|21|1,1",@"0",@"0",@"0",@"10|warp|25|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
	
	worldNode[25] = @[
	// Tiles
	@"21|block|15",@"21",@"21|block|16",
	@"21",@"21",@"21",
	@"21|event|photocopier3|11|l",@"21",@"21",
	// Walls
	@"21",@"24|warp|24|-1,0",@"20",@"20",@"24|warp|28|0,-1",@"20",
	// Steps
	@"0",@"0",@"0",@"0",@"10|warp|26|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
	
	worldNode[26] = @[
	// Tiles
	@"21|block|14",@"21",@"21",
	@"21",@"21",@"21",
	@"21",@"21",@"21|block|16",
	// Walls
	@"20",@"24|warp|25|-1,0",@"20",@"20",@"20",@"21",
	// Steps
	@"0",@"10|warp|23|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];

	worldNode[27] = @[
	// Tiles
	@"21|block|15",@"21|block|15",@"21|block|15",
	@"21",@"21",@"21",
	@"21",@"21",@"21|block|16",
	// Walls
	@"19",@"19",@"19",@"19",@"21",@"20",
	// Steps
	@"0",@"10|warp|24|0,1",@"0",@"0",@"10|warp|28|1,0",@"0",
	// Name,Background,Audio
	@"Necomedre Storage Room",@"Black",@"quiet"];

	worldNode[28] = @[
	// Tiles
	@"21|block|14",@"21",@"21|event|photocopier1|11|l",
	@"21",@"21",@"21",
	@"21|block|16",@"21",@"21",
	// Walls
	@"20",@"24|warp|27|-1,0",@"20",@"20",@"24|warp|23|0,-1",@"21",
	// Steps
	@"0",@"10|warp|25|0,1",@"0",@"0",@"10|warp|29|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];

	worldNode[29] = @[
	// Tiles
	@"21|block|15",@"21",@"21",
	@"21",@"8",@"21",
	@"21",@"21|block|14",@"21",
	// Walls
	@"20",@"24|warp|28|-1,0",@"20",@"20",@"28|event|photocopierDoor",@"21",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
	
	worldNode[30] = @[
	// Tiles
	@"21",@"21",@"21",
	@"21",@"21",@"21",
	@"21",@"21",@"21",
	// Walls
	@"20",@"24|warp|31|-1,0",@"20",@"20",@"21",@"20",
	// Steps
	@"0",@"10|event|photocopierDoor",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Office",@"White",@"lobby"];

	worldNode[31] = @[
	// Tiles
	@"21",@"21",@"21",
	@"14",@"21",@"13",
	@"21",@"21",@"21",
	// Walls
	@"20",@"20",@"20",@"20",@"21",@"20",
	// Steps
	@"0",@"10|warp|5|0,1",@"0",@"0",@"10|warp|30|1,0",@"0",
	// Name,Background,Audio
	@"Office Lobby",@"White",@"lobby"];

}

@end
