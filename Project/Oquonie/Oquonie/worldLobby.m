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
	@"0",@"2",@"2|block|10",
	@"2",@"8",@"4",
	@"2",@"2",@"2",
	// Walls
	@"0",@"15|warp|15|0,0",@"2",@"2",@"12|warp|2|0,-1",@"2",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];

	worldNode[2] = @[
	// Tiles
	@"1",@"4",@"1",
	@"6",@"5",@"1|event|tip1|7|l",
	@"1",@"1",@"1",
	// Walls
	@"16",@"12|warp|3|-1,0",@"19",@"25",@"25",@"25",
	// Steps
	@"0",@"7|warp|1|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Fork I",@"White",@"lobby"];

	worldNode[3] = @[
	// Tiles
	@"1",@"11",@"1|event|tip2|1|r",
	@"6",@"5",@"1",
	@"1|block|1",@"4",@"1",
	// Walls
	@"1",@"9|port|10|-1,0,5",@"1",@"1",@"1",@"1",
	// Steps
	@"0",@"7|warp|4|0,1",@"0",@"0",@"7|warp|2|1,0",@"0",
	// Name,Background,Audio
	@"Lobby House Room",@"White",@"lobby"];

	worldNode[4] = @[
	// Tiles
	@"1|event|wizard1|9|r",@"6",@"1",
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
	@"9",@"10",@"9",
	@"4",@"5",@"14",
	@"9",@"6",@"9",
	// Walls
	@"3",@"14|warp|4|-1,0",@"3",@"3",@"4|port|10|0,-1,1",@"3",
	// Steps
	@"0",@"7|warp|9|0,1",@"0",@"0",@"7|warp|6|1,0",@"0",
	// Name,Background,Audio
	@"Lobby Fork II",@"White",@"lobby"];

	worldNode[6] = @[
	// Tiles
	@"9",@"4",@"9|block|5",
	@"10",@"5",@"6",
	@"9",@"10",@"9|event|tip3|8|l",
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
	@"9",@"0",@"0",
	// Walls
	@"19",@"0",@"0",@"0",@"8|port|9|0,-1,3",@"0",
	// Steps
	@"0",@"7|warp|6|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Fork III",@"White",@"lobby"];

	worldNode[8] = [NSArray arrayWithObjects: @"9",nil];

	worldNode[9] = @[
	// Tiles
	@"10",@"15",@"10|event|colours1|10|l",
	@"9",@"4",@"5",
	@"0",@"10",@"10",
	// Walls
	@"18",@"27|port|9|0,-1,4",@"18",@"3",@"13|warp|5|0,-1",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Fork III",@"White",@"lobby"];

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
