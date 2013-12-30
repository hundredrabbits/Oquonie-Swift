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
	worldNode[11] = @[
	// Tiles
	@"21",@"21",@"21",
	@"21",@"21|block|14",@"21",
	@"21",@"21",@"21",
	// Walls
	@"20",@"24|warp|19|-1,0",@"20",@"24|warp|14|1,-1",@"21",@"20",
	// Steps
	@"0",@"10|warp|19|0,1",@"0",@"10|warp|12|1,-1",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
	
	worldNode[12] = @[
	// Tiles
	@"21",@"21|block|15",@"21|block|15",
	@"21",@"21",@"21",
	@"21",@"21",@"21|block|16",
	// Walls
	@"24|warp|11|-1,-1",@"20",@"20",@"20",@"21",@"20",
	// Steps
	@"0",@"0",@"0",@"0",@"10|warp|13|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
	
	worldNode[13] = @[
	// Tiles
	@"21|block|15",@"21",@"21|block|15",
	@"21",@"21",@"21",
	@"21|block|15",@"21",@"21|block|15",
	// Walls
	@"19",@"24|warp|12|-1,0",@"19",@"19",@"24|warp|16|0,-1",@"19",
	// Steps
	@"0",@"10|warp|18|0,1",@"0",@"0",@"10|warp|14|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
	
	worldNode[14] = @[
	// Tiles
	@"21",@"21",@"21|block|14",
	@"21",@"21",@"21",
	@"21|block|16",@"21",@"21",
	// Walls
	@"20",@"24|warp|13|-1,0",@"20",@"20",@"24|warp|17|0,-1",@"21",
	// Steps
	@"10|warp|11|1,1",@"0",@"0",@"0",@"10|warp|15|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
	
	worldNode[15] = @[
	// Tiles
	@"21|block|14",@"21",@"21|block|15",
	@"21",@"21",@"21",
	@"21|block|16",@"21",@"21",
	// Walls
	@"20",@"24|warp|14|-1,0",@"20",@"20",@"24|warp|18|0,-1",@"21",
	// Steps
	@"0",@"0",@"0",@"0",@"10|warp|16|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
	
	
	worldNode[16] = @[
	// Tiles
	@"21|block|14",@"21",@"21|block|15",
	@"21",@"21",@"21",
	@"21|block|16",@"21",@"21",
	// Walls
	@"20",@"24|warp|15|-1,0",@"20",@"20",@"24|warp|19|0,-1",@"21",
	// Steps
	@"0",@"10|warp|13|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];

	worldNode[17] = @[
	// Tiles
	@"21|block|15",@"21|block|15",@"21|block|15",
	@"21",@"21",@"21",
	@"21",@"21",@"21|block|16",
	// Walls
	@"19",@"19",@"19",@"19",@"21",@"20",
	// Steps
	@"0",@"10|warp|14|0,1",@"0",@"0",@"10|warp|18|1,0",@"0",
	// Name,Background,Audio
	@"Necomedre Storage Room",@"Black",@"quiet"];

	worldNode[18] = @[
	// Tiles
	@"21|block|14",@"21",@"21|block|15",
	@"21",@"21",@"21",
	@"21|block|16",@"21",@"21",
	// Walls
	@"20",@"24|warp|17|-1,0",@"20",@"20",@"24|warp|13|0,-1",@"21",
	// Steps
	@"0",@"10|warp|15|0,1",@"0",@"0",@"10|warp|19|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];

	worldNode[19] = @[
	// Tiles
	@"21|block|14",@"21",@"21|block|16",
	@"21",@"21",@"21",
	@"21|block|16",@"21",@"21|block|14",
	// Walls
	@"20",@"23|warp|18|-1,0",@"20",@"20",@"23|warp|11|0,-1",@"21",
	// Steps
	@"0",@"10|warp|16|0,1",@"0",@"0",@"10|warp|11|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
}

@end
