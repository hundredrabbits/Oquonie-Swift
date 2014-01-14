//
//  xxiivvViewController+xxiivvWorldLobby.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 12/30/2013.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "worldLobby.h"

@implementation xxiivvViewController (worldLobby)

-(void)createWorldLobby
{
	worldNode[1] = @[
	// Tiles
	@"0",@"13",@"2|block|10",
	@"2",@"8",@"4",
	@"2",@"2",@"2|event|pillarTest|14|l",
	// Walls
	@"0",@"5|event|gateNephtaline",@"2",@"2",@"12|warp|2|0,-1",@"15",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];

	worldNode[2] = @[
	// Tiles
	@"1",@"4",@"1",
	@"6",@"5",@"1|event|null|7|l",
	@"1",@"1",@"1",
	// Walls
	@"16",@"12|warp|3|-1,0",@"19",@"25",@"25",@"25",
	// Steps
	@"0",@"7|warp|1|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Deck",@"White",@"lobby"];

	worldNode[3] = @[
	// Tiles
	@"1|event|pillarNeomineSocket|14|l",@"23",@"1|event|owlSave|1|r",
	@"6",@"5",@"1",
	@"1|block|1",@"4",@"1",
	// Walls
	@"1",@"7|event|gateNeomine",@"1",@"1",@"1",@"1",
	// Steps
	@"0",@"7|warp|4|0,1",@"0",@"0",@"7|warp|2|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Neomine",@"White",@"lobby"];

	worldNode[4] = @[
	// Tiles
	@"1|event|speakerphone|9|r",@"6",@"1",
	@"5",@"5|block|9",@"6",
	@"1",@"6",@"1",
	// Walls
	@"1",@"16",@"1",@"1",@"12|warp|3|0,-1",@"1",
	// Steps
	@"0",@"0",@"0",@"0",@"7|warp|5|1,0",@"0",
	// Name,Background,Audio
	@"Lobby House Room",@"White",@"lobby"];

	worldNode[5] = @[
	// Tiles
	@"9",@"10",@"9|event|pillarTest|14|l",
	@"4",@"5",@"14",
	@"9",@"6",@"9",
	// Walls
	@"3",@"14|warp|4|-1,0",@"3",@"3",@"4|event|gateNecomedre",@"3",
	// Steps
	@"0",@"7|warp|9|0,1",@"0",@"0",@"7|warp|6|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Fork",@"White",@"lobby"];

	worldNode[6] = @[
	// Tiles
	@"9",@"4",@"9|block|5",
	@"10",@"5",@"6",
	@"9",@"10",@"9|event|null|8|l",
	// Walls
	@"3",@"13|warp|5|-1,0",@"3",@"26",@"13|warp|7|0,-1",@"26",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Turn",@"White",@"lobby"];

	worldNode[7] = @[
	// Tiles
	@"9",@"10|block|11",@"0",
	@"4",@"5",@"12",
	@"9|event|pillarTest|14|l",@"0",@"0",
	// Walls
	@"19",@"0",@"0",@"0",@"8|event|null",@"0",
	// Steps
	@"0",@"7|warp|6|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Nestorine",@"White",@"lobby"];

	worldNode[8] = @[];

	worldNode[9] = @[
	// Tiles
	@"10|event|pillarTest|14|l",@"27",@"10|event|null|10|l",
	@"9",@"4",@"5",
	@"0",@"10",@"10",
	// Walls
	@"18",@"9|event|null",@"18",@"3",@"13|warp|5|0,-1",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Nemedique",@"White",@"lobby"];

	worldNode[10] = @[
	// Tiles
	@"3",@"3",@"6",
	@"14",@"4",@"5",
	@"3",@"3",@"3",
	// Walls
	@"3",@"3",@"3",@"13|warp|12|1,-1",@"3",@"3",
	// Steps
	@"0",@"7|warp|5|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Fork III",@"White",@"lobby"];
}

@end
