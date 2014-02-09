//
//  xxiivvViewController+xxiivvWorldLobby.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 12/30/2013.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//
#import "xxiivvSettings.h"
#import "worldLobby.h"

@implementation xxiivvViewController (worldLobby)

-(void)createWorldLobby
{
	worldNode[1] = @[
	// Tiles
	@"0",@"25",@"2|block|10",
	@"2",@"8",@"4",
	@"2",@"2",@"2|event|socket|14|l",
	// Walls
	@"0",@"5|event|gateNephtaline",@"2",@"2",@"12|warp|2|0,-1",@"15",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",audioLobby];

	worldNode[2] = @[
	// Tiles
	@"1",@"4",@"1|block|24",
	@"6",@"5",@"1|event|ramenLobby|7|l",
	@"1",@"1",@"1",
	// Walls
	@"16|event|map",@"12|warp|3|-1,0",@"19",@"25",@"25",@"25",
	// Steps
	@"0",@"7|warp|1|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Deck",@"White",audioLobby];

	worldNode[3] = @[
	// Tiles
	@"1|event|socket|14|l",@"23",@"1|event|owlSave|1|r",
	@"6",@"5",@"1",
	@"1|block|1",@"4",@"1",
	// Walls
	@"1",@"7|event|gateNeomine",@"1",@"1",@"1",@"1",
	// Steps
	@"0",@"7|warp|4|0,1",@"0",@"0",@"7|warp|2|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Neomine",@"White",audioLobby];

	worldNode[4] = @[
	// Tiles
	@"1|event|speakerphone|9|r",@"1",@"1|block|9",
	@"1",@"5",@"6",
	@"1",@"6",@"1",
	// Walls
	@"26",@"14|warp|14|-1,0",@"26",@"1",@"12|warp|3|0,-1",@"1",
	// Steps
	@"0",@"0",@"0",@"0",@"7|warp|5|1,0",@"0",
	// Name,Background,Audio
	@"Lobby House Room",@"White",audioLobby];

	worldNode[5] = @[
	// Tiles
	@"9",@"10",@"9|event|socket|14|l",
	@"4",@"5",@"14",
	@"9",@"6",@"9",
	// Walls
	@"3",@"14|warp|4|-1,0",@"3",@"3",@"4|event|gateNecomedre",@"3",
	// Steps
	@"0",@"7|warp|9|0,1",@"0",@"0",@"7|warp|6|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Fork",@"White",audioLobby];

	worldNode[6] = @[
	// Tiles
	@"9",@"4",@"9|block|5",
	@"10",@"5",@"6",
	@"9",@"10",@"9|event|shark|8|l",
	// Walls
	@"3",@"13|warp|5|-1,0",@"3",@"26",@"13|warp|7|0,-1",@"26",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Turn",@"White",audioLobby];

	worldNode[7] = @[
	// Tiles
	@"9",@"10|block|11",@"0",
	@"4",@"5",@"12",
	@"9|event|socket|14|l",@"0",@"0",
	// Walls
	@"19",@"0",@"0",@"0",@"8|event|gateNestorine",@"0",
	// Steps
	@"0",@"7|warp|6|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Nestorine",@"White",audioLobby];

	worldNode[8] = @[];

	worldNode[9] = @[
	// Tiles
	@"10|event|socket|14|l",@"27",@"10",
	@"9",@"4",@"5",
	@"0",@"6",@"10",
	// Walls
	@"18",@"9|event|gateNemedique",@"18",@"3",@"13|warp|5|0,-1",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"7|event|courtyard",@"0",
	// Name,Background,Audio
	@"Lobby Nemedique",@"White",audioLobby];

	worldNode[10] = @[
	// Tiles
	@"3",@"3",@"3",
	@"3",@"3",@"3",
	@"3",@"3",@"3",
	// Walls
	@"3",@"3",@"3",@"3",@"3",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Test Level",@"White",audioLobby];
	
	worldNode[11] = @[
	// Tiles
	@"4",@"5",@"6",
	@"5",@"33|event|tree|23|l",@"4",
	@"4",@"6",@"5",
	// Walls
	@"36",@"13|warp|9|-1,0",@"36",@"3",@"37",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Test Level",@"White",audioPillar];
	
	worldNode[13] = @[
	// Tiles
	@"4",@"5",@"6",
	@"5",@"33|event|tree|23|l",@"4",
	@"4",@"6",@"5",
	// Walls
	@"36",@"13|warp|9|-1,0",@"36",@"3",@"37",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Test Level",@"White",audioPillar];

	worldNode[14] = @[
	// Tiles
	@"0",@"0|event|noface|29|r",@"0",
	@"0",@"5",@"0",
	@"0",@"5",@"0",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"0",@"0",@"0",@"0",@"7|warp|4|1,0",@"0",
	// Name,Background,Audio
	@"Test Level",@"White",audioLobby];

}

@end
