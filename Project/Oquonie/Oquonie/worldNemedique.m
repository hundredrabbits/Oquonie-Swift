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
	@"5|event|nemediqueNeomine1|4|r",@"5",@"4",
	@"6",@"8",@"6",
	@"4",@"5",@"5",
	// Walls
	@"18",@"29",@"18",@"18",@"12|warp|101|0,-1",@"18",
	// Steps
	@"0",@"0",@"0",@"0",@"7|warp|9|1,0",@"0",
	// Name,Background,Audio
	@"Nemedique Entrance",@"White",audioNemedique];
	
	worldNode[101] = @[
	// Tiles
	@"5",@"5",@"4|event|ramen|7|l",
	@"6",@"6",@"6",
	@"4",@"5",@"5",
	// Walls
	@"18",@"13|warp|102|-1,0",@"18",@"18",@"4|event|gateNecomedre",@"18",
	// Steps
	@"0",@"7|warp|100|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Nemedique Entrance",@"White",audioNemedique];
	
	worldNode[102] = @[
	// Tiles
	@"5",@"5|event|shark|8|r",@"4",
	@"6",@"5",@"6",
	@"4",@"5",@"5",
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
}
	
@end
