//
//  xxiivvViewController+worldNestorine.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "worldNestorine.h"

@implementation xxiivvViewController (worldNestorine)

-(void)createWorldNestorine
{
	worldNode[80] = @[
	// Tiles
	@"35|block|23",@"35",@"7|event|warpLobby",
	@"34",@"8",@"35",
	@"35",@"34",@"35",
	// Walls
	@"35",@"15",@"35",@"34",@"15",@"34",
	// Steps
	@"0",@"7|warp|81|0,1",@"0",@"0",@"7|warp|82|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[81] = @[
	// Tiles
	@"34",@"35",@"35",
	@"35",@"35",@"35",
	@"34",@"35",@"34",
	// Walls
	@"34",@"35",@"34",@"25",@"15",@"25",
	// Steps
	@"0",@"1|warp|83|0,1",@"0",@"0",@"1|warp|84|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[82] = @[
	// Tiles
	@"34",@"35",@"34",
	@"35",@"35",@"34",
	@"34|block|11",@"35",@"34",
	// Walls
	@"25",@"15",@"25",@"35",@"34",@"35",
	// Steps
	@"0",@"1|warp|84|0,1",@"0",@"0",@"1|warp|85|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[83] = @[
	// Tiles
	@"34",@"34",@"34",
	@"35",@"35",@"35",
	@"35|block|23",@"35",@"0",
	// Walls
	@"35",@"34",@"35",@"26",@"15",@"26",
	// Steps
	@"0",@"1|warp|86|0,1",@"0",@"0",@"1|warp|87|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[84] = @[
	// Tiles
	@"34",@"35",@"35|event|owlSave|1|r",
	@"35",@"35",@"35",
	@"35|block|11",@"35",@"34",
	// Walls
	@"35",@"15",@"34",@"34",@"15",@"35",
	// Steps
	@"0",@"1|warp|87|0,1",@"0",@"0",@"1|warp|88|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[85] = @[
	// Tiles
	@"34",@"35",@"35",
	@"35",@"35",@"35|event|redGhost|12|l",
	@"0",@"35",@"34",
	// Walls
	@"26",@"15",@"26",@"34",@"16|event|map",@"34",
	// Steps
	@"0",@"1|warp|88|0,1",@"0",@"0",@"1|warp|89|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[86] = @[
	// Tiles
	@"34",@"10",@"34",
	@"35",@"35",@"35",
	@"34",@"0",@"34",
	// Walls
	@"34",@"34|warp|114|-1,0",@"34",@"25",@"15",@"25",
	// Steps
	@"0",@"1|warp|80|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[87] = @[
	// Tiles
	@"35",@"35",@"35|event|speakerphone|9|r",
	@"35",@"35",@"35",
	@"35",@"35",@"0",
	// Walls
	@"25",@"15",@"25",@"26",@"15",@"26",
	// Steps
	@"0",@"0",@"0",@"0",@"1|warp|91|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[88] = @[
	// Tiles
	@"34",@"35",@"35|event|ramen|7|l",
	@"35",@"35",@"35",
	@"34",@"34",@"0",
	// Walls
	@"36",@"15",@"36",@"36",@"15",@"0",
	// Steps
	@"0",@"1|warp|91|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Fork Ramen",@"White",audioNestorine];

	worldNode[89] = @[
	// Tiles
	@"34",@"35",@"0",
	@"34",@"35",@"34",
	@"34",@"35",@"34",
	// Walls
	@"26",@"15",@"0",@"0",@"34|event|gatePhotoBooth",@"34",
	// Steps
	@"0",@"0",@"0",@"0",@"1|warp|80|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[90] = @[
	// Tiles
	@"35",@"34",@"35",
	@"34",@"38|event|pillar|15|l",@"34",
	@"35",@"34",@"35",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"0",@"0",@"0",@"0",@"6|event|gateNephtaline",@"0",
	// Name,Background,Audio
	@"Necomedre Pillar Room",@"Red",audioPillar];

	worldNode[91] = @[
	// Tiles
	@"34",@"35",@"35|event|nestorineNephtaline1|3|r",
	@"35",@"35",@"35",
	@"34",@"35",@"35|block|23",
	// Walls
	@"25",@"15",@"25",@"25",@"15",@"25",
	// Steps
	@"0",@"1|warp|93|0,1",@"0",@"0",@"1|warp|94|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[92] = @[
	// Tiles
	@"28",@"38",@"28",
	@"36",@"7|event|warpLobby",@"36",
	@"28",@"38",@"28",
	// Walls
	@"31",@"37",@"31",@"31",@"37",@"31",
	// Steps
	@"0",@"1|warp|94|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Warp Zone IV",@"White",audioWarp];

	worldNode[93] = @[
	// Tiles
	@"35",@"34",@"35|event|nestorineNemedique2|6|r",
	@"35",@"32",@"35",
	@"35",@"35",@"35|block|11",
	// Walls
	@"1",@"5|event|gateNephtaline",@"1",@"25",@"15",@"25",
	// Steps
	@"0",@"1|warp|80|0,1",@"0",@"0",@"1|warp|95|1,0",@"0",
	// Name,Background,Audio
	@"Gate for pillar",@"White",audioNestorine];
	
	worldNode[94] = @[
	// Tiles
	@"5",@"4",@"3|event|nestorineNemedique3|6|l",
	@"10",@"9",@"11",
	@"4",@"10",@"3",
	// Walls
	@"25",@"15",@"25",@"3",@"9|event|gateNemedique",@"3",
	// Steps
	@"0",@"3|warp|95|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];
	
	worldNode[95] = @[
	// Tiles
	@"34",@"35",@"35|event|nestorineNemedique1|6|r",
	@"35",@"35",@"35",
	@"35|block|23",@"35",@"0",
	// Walls
	@"25",@"15",@"25",@"26",@"15",@"0",
	// Steps
	@"0",@"1|warp|80|0,1",@"0",@"0",@"1|warp|80|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];
	
	worldNode[96] = @[
	// Tiles
	@"35",@"35",@"35",
	@"34",@"7|event|warpNestorine",@"35",
	@"35",@"35",@"35",
	// Walls
	@"34",@"35",@"34",@"19",@"19",@"19",
	// Steps
	@"0",@"1|event|gateNestorine",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Entrance Warp",@"White",audioWarp];
	
	worldNode[97] = @[
	// Tiles
	@"35",@"35",@"35",
	@"35",@"7",@"35",
	@"35",@"35",@"35",
	// Walls
	@"25",@"15|warp|94|-1,0",@"25",@"0",@"0",@"0",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Unused",@"White",audioNestorine];

}

@end
