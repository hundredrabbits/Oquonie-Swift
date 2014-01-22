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
	@"0",@"5",@"0|block|8",
	@"6",@"8",@"4",
	@"0",@"5",@"0",
	// Walls
	@"2",@"15",@"2",@"2",@"15",@"2",
	// Steps
	@"0",@"7|warp|81|0,1",@"0",@"0",@"7|warp|82|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[81] = @[
	// Tiles
	@"0",@"0",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"2",@"2",@"2",@"0",@"15",@"0",
	// Steps
	@"0",@"1|warp|83|0,1",@"0",@"0",@"1|warp|84|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[82] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"0",
	@"0",@"21",@"0",
	// Walls
	@"0",@"15|warp|80|-1,0",@"0",@"2",@"2",@"2",
	// Steps
	@"0",@"1|warp|84|0,1",@"0",@"0",@"1|warp|85|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[83] = @[
	// Tiles
	@"0",@"0",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"2",@"2",@"2",@"0",@"15",@"0",
	// Steps
	@"0",@"1|warp|86|0,1",@"0",@"0",@"1|warp|87|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[84] = @[
	// Tiles
	@"0",@"21",@"21|event|owlSave|1|r",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"15|warp|80|-1,0",@"0",@"0",@"15",@"0",
	// Steps
	@"0",@"1|warp|87|0,1",@"0",@"0",@"1|warp|88|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[85] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"0",
	@"0",@"21",@"0",
	// Walls
	@"0",@"15|warp|80|-1,0",@"0",@"2",@"2",@"2",
	// Steps
	@"0",@"1|warp|88|0,1",@"0",@"0",@"1|warp|89|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[86] = @[
	// Tiles
	@"0",@"0",@"0",
	@"21",@"21",@"21",
	@"0",@"0",@"0",
	// Walls
	@"2",@"2",@"2",@"0",@"15",@"0",
	// Steps
	@"0",@"1|warp|80|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[87] = @[
	// Tiles
	@"0",@"21",@"21|event|speakerphone|9|r",
	@"0",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"15|warp|80|-1,0",@"0",@"0",@"15",@"0",
	// Steps
	@"0",@"0",@"0",@"0",@"1|warp|91|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[88] = @[
	// Tiles
	@"0",@"21",@"21|event|ramen|7|l",
	@"21",@"21",@"21",
	@"0",@"0",@"0",
	// Walls
	@"0",@"15|warp|80|-1,0",@"0",@"0",@"15",@"0",
	// Steps
	@"0",@"1|warp|91|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Fork Ramen",@"White",audioNestorine];

	worldNode[89] = @[
	// Tiles
	@"0",@"21",@"0",
	@"0",@"21",@"0",
	@"0",@"21",@"0",
	// Walls
	@"0",@"15|warp|80|-1,0",@"0",@"2",@"2",@"2",
	// Steps
	@"0",@"0",@"0",@"0",@"1|warp|80|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[90] = @[
	// Tiles
	@"4",@"4",@"4",
	@"4",@"4|event|pillar|15|l",@"4",
	@"4",@"4",@"4",
	// Walls
	@"26",@"26",@"26",@"19",@"19",@"19",
	// Steps
	@"0",@"0",@"0",@"0",@"6|event|gateNephtaline",@"0",
	// Name,Background,Audio
	@"Necomedre Pillar Room",@"White",audioPillar];

	worldNode[91] = @[
	// Tiles
	@"0",@"21",@"21|event|nestorineNephtaline1|3|r",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"15|warp|80|-1,0",@"0",@"0",@"15",@"0",
	// Steps
	@"0",@"1|warp|93|0,1",@"0",@"0",@"1|warp|94|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[92] = @[
	// Tiles
	@"3",@"3",@"3",
	@"3",@"7|event|warpLobby",@"3",
	@"3",@"3",@"3",
	// Walls
	@"1",@"1",@"1",@"1",@"1",@"1",
	// Steps
	@"0",@"1|warp|94|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Warp Room",@"White",audioNestorine];

	worldNode[93] = @[
	// Tiles
	@"21",@"25",@"21|event|nestorineNemedique2|6|r",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"1",@"5|event|gateNephtaline",@"1",@"0",@"15",@"0",
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
	@"25",@"15|warp|80|-1,0",@"25",@"3",@"9|event|gateNemedique",@"3",
	// Steps
	@"0",@"3|warp|95|0,1",@"0",@"0",@"8|warp|80|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];
	
	worldNode[95] = @[
	// Tiles
	@"0",@"21",@"21|event|nestorineNemedique1|6|r",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"15|warp|80|-1,0",@"0",@"0",@"15",@"0",
	// Steps
	@"0",@"1|warp|80|0,1",@"0",@"0",@"1|warp|80|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];
	
	worldNode[96] = @[
	// Tiles
	@"21",@"21",@"21",
	@"21",@"7|event|warpNestorine",@"21",
	@"21",@"21",@"21",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"0",@"1|event|gateNestorine",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Entrance Warp",@"White",audioNestorine];

}

@end
