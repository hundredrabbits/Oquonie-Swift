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
	// =======================
	// @ Events: Segment 1
	// =======================
	
	# pragma mark Segment 1 -
	
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
	@"20",@"24|warp|28|-1,0",@"20",@"20",@"28|event|gateDocument",@"21",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
	
	worldNode[30] = @[
	// Tiles
	@"21|block|16",@"21|event|tutorialCharacter|12|r",@"21",
	@"21",@"21",@"21",
	@"21",@"21",@"21",
	// Walls
	@"20",@"20|warp|31|-1,0",@"20",@"20",@"21",@"20",
	// Steps
	@"0",@"10|event|gateDocument",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Office",@"White",@"lobby"];

	worldNode[31] = @[
	// Tiles
	@"21|block|16",@"2|event|tutorialCharacterTransformed|10|r",@"2",
	@"21",@"2",@"2",
	@"21",@"21",@"2",
	// Walls
	@"20",@"19|warp|31|-1,0",@"19",@"17",@"27|event|tutorialRedDoor",@"17",
	// Steps
	@"0",@"10|event|photocopierDoor",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Office",@"White",@"lobby"];
	
	// =======================
	// @ Events: Segment 2
	// =======================
	
	# pragma mark Segment 2 -
	
	worldNode[32] = @[
	// Tiles
	@"4",@"4",@"4",
	@"14",@"4",@"2",
	@"4",@"2",@"2",
	// Walls
	@"26",@"16",@"26",@"19",@"12|warp|33|0,-1",@"19",
	// Steps
	@"0",@"5|event|gateNecomedre",@"0",@"0",@"6|warp|35|1,0",@"0",
	// Name,Background,Audio
	@"Office",@"White",@"lobby"];

	worldNode[33] = @[
	// Tiles
	@"4",@"4|event|necomedreNephtaline1|3|r",@"4",
	@"4",@"4",@"4",
	@"4",@"4",@"4",
	// Walls
	@"26",@"26",@"26",@"19",@"7|warp|34|0,-1",@"19",
	// Steps
	@"0",@"7|warp|32|0,1",@"0",@"0",@"0",@"6|warp|36|1,1",
	// Name,Background,Audio
	@"Office",@"White",@"lobby"];

	worldNode[34] = @[
	// Tiles
	@"4",@"4|event|null|4|r",@"4",
	@"14",@"4",@"4",
	@"4",@"4",@"4",
	// Walls
	@"26",@"26",@"7|event|gateNeomine",@"19",@"7|warp|35|0,-1",@"19",
	// Steps
	@"0",@"6|warp|33|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Office",@"White",@"lobby"];

	worldNode[35] = @[
	// Tiles
	@"4",@"4",@"4",
	@"14",@"4",@"4",
	@"4",@"4",@"4",
	// Walls
	@"26",@"7|warp|32|-1,0",@"26",@"19",@"7|warp|36|0,-1",@"19",
	// Steps
	@"0",@"6|warp|34|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Office",@"White",@"lobby"];

	worldNode[36] = @[
	// Tiles
	@"4|event|necomedreNephtaline2|3|r",@"0",@"4",
	@"14",@"0",@"4",
	@"4",@"0",@"4",
	// Walls
	@"26",@"0",@"7|warp|33|-1,1",@"19",@"7|warp|37|0,-1",@"19",
	// Steps
	@"0",@"6|warp|35|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Office",@"White",@"lobby"];

	worldNode[37] = @[
	// Tiles
	@"4",@"4|event|null|1|r",@"4",
	@"14",@"4",@"4",
	@"4",@"4",@"4",
	// Walls
	@"26",@"26",@"26",@"19",@"7|warp|38|0,-1",@"19",
	// Steps
	@"0",@"6|warp|36|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Office",@"White",@"lobby"];

	worldNode[38] = @[
	// Tiles
	@"4",@"4|event|necomedreNephtaline3|3|r",@"4",
	@"4",@"4",@"13",
	@"4",@"4",@"4",
	// Walls
	@"26",@"26",@"26",@"19",@"5|event|gateNephtaline",@"19",
	// Steps
	@"0",@"6|warp|37|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Office",@"White",@"lobby"];

	worldNode[39] = @[
	// Tiles
	@"4",@"4",@"4",
	@"13",@"7",@"4",
	@"4",@"4",@"4",
	// Walls
	@"26",@"26",@"26",@"19",@"19",@"19",
	// Steps
	@"0",@"6|warp|38|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Office",@"White",@"lobby"];

}

@end
