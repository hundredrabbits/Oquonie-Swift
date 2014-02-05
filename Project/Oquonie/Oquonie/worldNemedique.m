//
//  xxiivvViewController+worldNemedique.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "worldNemedique.h"

@implementation xxiivvViewController (worldNemedique)

-(void)createWorldNemedique
{
	worldNode[100] = @[
	// Tiles
	@"10|event|nemediqueNestorine1|5|r",@"10",@"10",
	@"10",@"4",@"6",
	@"10",@"5",@"10",
	// Walls
	@"18",@"29|event|gateEnd",@"18",@"18",@"12|warp|101|0,-1",@"18",
	// Steps
	@"0",@"0",@"0",@"0",@"7|event|gateNemedique",@"0",
	// Name,Background,Audio
	@"Nemedique Entrance",@"White",audioNemedique];
	
	worldNode[101] = @[
	// Tiles
	@"10",@"5",@"10|event|ramen|7|l",
	@"6",@"6",@"6",
	@"10",@"10",@"10",
	// Walls
	@"18",@"13|warp|102|-1,0",@"18",@"18",@"4|event|gateNecomedre",@"18",
	// Steps
	@"0",@"7|warp|100|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Nemedique Entrance",@"White",audioNemedique];
	
	worldNode[102] = @[
	// Tiles
	@"10",@"5|event|shark|8|r",@"10",
	@"10",@"5",@"10",
	@"10",@"5",@"10",
	// Walls
	@"18",@"18",@"18",@"18",@"18",@"18",
	// Steps
	@"0",@"0",@"0",@"0",@"7|warp|101|1,0",@"0",
	// Name,Background,Audio
	@"Nemedique Entrance",@"White",audioNemedique];
	
	worldNode[103] = @[
	// Tiles
	@"4",@"4",@"4",
	@"4",@"4|event|pillar|15|l",@"4",
	@"4",@"4",@"4",
	// Walls
	@"26",@"26",@"26",@"19",@"19",@"19",
	// Steps
	@"0",@"6|event|gateNecomedre",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Nemedique Pillar Room",@"White",audioPillar];
	
	worldNode[104] = @[
	// Tiles
	@"41",@"42|event|redEnd|28|r",@"43",
	@"44",@"45",@"46",
	@"47",@"48",@"49",
	// Walls
	@"39",@"33",@"39",@"39",@"33",@"39",
	// Steps
	@"0",@"0",@"0",@"0",@"11",@"0",
	// Name,Background,Audio
	@"unused",@"Black",audioRed];
	
	worldNode[105] = @[
	// Tiles
	@"3",@"3",@"3",
	@"3",@"7|event|warpLobby",@"3",
	@"3",@"3",@"3",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"0",@"6|warp|101|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Nemedique warp",@"White",audioPillar];
}
	
@end
