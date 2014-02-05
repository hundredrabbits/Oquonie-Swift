//
//  xxiivvViewController+worldNeophine.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "worldNeomine.h"

@implementation xxiivvViewController (worldNeomine)

-(void)createWorldNeomine
{
	worldNode[60] = @[
	// Tiles
	@"1",@"4|block|13",@"18",
	@"1",@"4",@"1",
	@"1",@"23",@"1",
	// Walls
	@"33",@"31",@"33",@"30|warp|62|1,-1",@"16|event|map",@"14|warp|61|-1,-1",
	// Steps
	@"0",@"0",@"0",@"0",@"4|event|gateNeomine",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",audioNeomine];
	
	worldNode[61] = @[
	// Tiles
	@"1|block|19",@"1|event|neomineNestorine1|5|r",@"1|block|19",
	@"38",@"1",@"38",
	@"1",@"1",@"1",
	// Walls
	@"31",@"30",@"31",@"33",@"31",@"33",
	// Steps
	@"0",@"0",@"3|warp|60|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Side Room",@"Black",audioNeomine];
	
	worldNode[62] = @[
	// Tiles
	@"4",@"5",@"6|event|neomineNecomedre1|2|l",
	@"5",@"6",@"33",
	@"6",@"4|block|23",@"5",
	// Walls
	@"32",@"31",@"32",@"36",@"4|event|gateNecomedre",@"36",
	// Steps
	@"3|warp|60|1,1",@"0",@"3|warp|63|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",audioNeomine];
	
	worldNode[63] = @[
	// Tiles
	@"10|event|ramen|7|r",@"10",@"10",
	@"10",@"0|block|9",@"10",
	@"10",@"10",@"9",
	// Walls
	@"32",@"33",@"32",@"14|warp|66|1,-1",@"30|warp|64|0,-1",@"14|warp|62|-1,-1",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",audioNeomine];

	worldNode[64] = @[
	// Tiles
	@"39",@"1",@"39|block|21",
	@"36",@"32",@"36|event|neomineNephtaline1|3|l",
	@"39",@"36",@"1",
	// Walls
	@"33",@"33",@"33",@"31",@"31",@"15",
	// Steps
	@"3|warp|68|1,1",@"3|warp|63|0,1",@"3|warp|65|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",audioNeomine];

	worldNode[65] = @[
	// Tiles
	@"0",@"33|event|neomineNestorine3|5|r",@"1",
	@"1",@"33",@"1|block|1",
	@"1",@"33",@"33",
	// Walls
	@"0",@"3",@"3",@"3",@"15",@"14|warp|64|-1,-1",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",audioNeomine];

	worldNode[66] = @[
	// Tiles
	@"39",@"36",@"39|block|13",
	@"36",@"28",@"29|event|owlSave|1|l",
	@"39",@"36",@"39",
	// Walls
	@"31",@"31",@"31",@"33",@"32",@"33",
	// Steps
	@"3|warp|63|1,1",@"3|warp|67|0,1",@"3|warp|68|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",audioNeomine];

	worldNode[67] = @[
	// Tiles
	@"1",@"36|event|neomineNestorine2|5|r",@"1",
	@"1",@"39",@"36",
	@"1",@"1",@"1",
	// Walls
	@"25",@"25",@"25",@"31",@"30|warp|66|0,-1",@"31",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",audioNeomine];

	worldNode[68] = @[
	// Tiles
	@"38",@"10",@"38",
	@"4",@"9",@"10",
	@"5",@"6",@"10",
	// Walls
	@"35",@"38|event|gateHiversaires",@"20",@"30|warp|64|1,-1",@"30|warp|69|0,-1",@"30|warp|66|-1,-1",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Entrance",@"Black",audioNeomine];

	worldNode[69] = @[
	// Tiles
	@"35",@"35",@"34|event|speakerphone|9|l",
	@"35",@"35",@"12",
	@"35",@"35",@"34",
	// Walls
	@"35",@"34",@"35",@"34",@"8|event|gateNestorine",@"34",
	// Steps
	@"0",@"3|warp|68|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Nestorine Exit",@"Black",audioNeomine];
	
	worldNode[70] = @[
	// Tiles
	@"39",@"40",@"39",
	@"40",@"7|event|warpLobby",@"40",
	@"39",@"40",@"39",
	// Walls
	@"29|warp|70|1,0",@"29|warp|70|1,1",@"29|warp|70|1,-1",@"29|warp|70|0,1",@"29|warp|70|-1,1",@"29|warp|70|1,1",
	// Steps
	@"0",@"7|event|gateNestorine",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Warp Zone III",@"Black",audioWarp];
	
	worldNode[71] = @[
	// Tiles
	@"1",@"29",@"1",
	@"29",@"4|event|pillar|15|l",@"29",
	@"1",@"29",@"1",
	// Walls
	@"1",@"1",@"1",@"1",@"1",@"1",
	// Steps
	@"0",@"3|event|gateNecomedre",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Pillar Room",@"White",audioPillar];
	
}
@end
