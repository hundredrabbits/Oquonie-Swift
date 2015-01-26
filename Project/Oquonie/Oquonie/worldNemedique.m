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
	@"18",@"18",@"18",@"18",@"18|event|gatePhotoBooth",@"18",
	// Steps
	@"0",@"0",@"0",@"0",@"7|warp|101|1,0",@"0",
	// Name,Background,Audio
	@"Nemedique Entrance",@"White",audioNemedique];
	
	worldNode[103] = @[
	// Tiles
	@"33",@"2",@"33",
	@"2",@"4|event|pillar|15|l",@"2",
	@"33",@"2",@"33",
	// Walls
	@"3",@"31",@"3",@"3",@"31",@"3",
	// Steps
	@"0",@"6|event|gateNecomedre",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Nemedique Pillar Room",@"Red",audioPillar];
	
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
	@"unused",@"Black",audioNepturne];
	
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
	@"Nemedique warp",@"White",audioWarp];
	
	worldNode[106] = @[
	// Tiles
	@"40",@"40|event|redGhost|28|r",@"40",
	@"40",@"40",@"40",
	@"40",@"8",@"40",
	// Walls
	@"29|warp|107|-1,-1",@"29|warp|107|-1,0",@"29|warp|107|-1,1",@"29|warp|107|1,-1",@"29|warp|107|0,-1",@"29|warp|107|-1,-1",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"unused",@"Black",audioNepturne];
	
	worldNode[107] = @[
	// Tiles
	@"40",@"40",@"40",
	@"40",@"40|event|credit1|31|l",@"40",
	@"40",@"40",@"40",
	// Walls
	@"29|warp|108|-1,-1",@"29|warp|108|-1,0",@"29|warp|108|-1,1",@"29|warp|108|1,-1",@"29|warp|108|0,-1",@"29|warp|108|-1,-1",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"unused",@"Black",audioNepturne];
	
	worldNode[108] = @[
	// Tiles
	@"40",@"40",@"40",
	@"40",@"40|event|credit2|32|l",@"40",
	@"40",@"40",@"40",
	// Walls
	@"29|warp|109|-1,-1",@"29|warp|109|-1,0",@"29|warp|109|-1,1",@"29|warp|109|1,-1",@"29|warp|109|0,-1",@"29|warp|109|-1,-1",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"unused",@"Black",audioNepturne];
	
	worldNode[109] = @[
	// Tiles
	@"33",@"33",@"33",
	@"33",@"33|event|endReset|27|l",@"33",
	@"33",@"33",@"33",
	// Walls
	@"36",@"37",@"36",@"36",@"37",@"36",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"unused",@"White",audioNepturne];
	
}
	
@end
