//
//  xxiivvViewController+worldNephtaline.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "worldNephtaline.h"

@implementation xxiivvViewController (worldNephtaline)

-(void)createWorldNephtaline
{
	
	// =======================
	// @ Events: Segment 1
	// =======================

	# pragma mark Segment 1 -

	worldNode[40] = @[
	// Tiles
	@"0",@"0",@"0",
	@"0",@"18",@"4",
	@"0",@"25",@"5|block|4",
	// Walls
	@"0",@"0",@"0",@"0",@"12|warp|41|0,-1",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"6|event|gateNephtaline",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];

	worldNode[41] = @[
	// Tiles
	@"0",@"0",@"0",
	@"4",@"19",@"0",
	@"5",@"5",@"0",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"0",@"7|warp|40|0,1",@"0",@"0",@"7|warp|42|1,0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];

	worldNode[42] = @[
	// Tiles
	@"5|event|null|5|r",@"5",@"0",
	@"4",@"17",@"0",
	@"0",@"0",@"0",
	// Walls
	@"3",@"13|warp|41|-1,0",@"0",@"0",@"0",@"0",
	// Steps
	@"0",@"7|warp|43|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];
	
	worldNode[43] = @[
	// Tiles
	@"0",@"5",@"5",
	@"0",@"16",@"4",
	@"0",@"0",@"0",
	// Walls
	@"0",@"13|warp|44|-1,0",@"3",@"3",@"13|warp|40|-1,0",@"0",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];
	
	worldNode[44] = @[
	// Tiles
	@"0",@"0",@"0",
	@"0",@"18",@"4",
	@"0",@"5",@"5|event|null|4|l",
	// Walls
	@"0",@"0",@"0",@"0",@"12|warp|45|0,-1",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"7|warp|43|1,0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];
	
	worldNode[45] = @[
	// Tiles
	@"0",@"0",@"0",
	@"4",@"17",@"0",
	@"5",@"5",@"0",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"0",@"7|warp|46|0,1",@"0",@"0",@"7|warp|42|1,0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];
	
	worldNode[46] = @[
	// Tiles
	@"3|event|null|4|r",@"4|block|13",@"3",
	@"17",@"10",@"5",
	@"3",@"5",@"3",
	// Walls
	@"3",@"3",@"3",@"3",@"13|warp|41|0,-1",@"3",
	// Steps
	@"0",@"7|warp|47|0,1",@"0",@"0",@"7|warp|51|1,0",@"0",
	// Name,Background,Audio
	@"Nephtaline Lobby 1",@"White",@"lobby"];

	// =======================
	// @ Events: Segment 2
	// =======================

	# pragma mark Segment 2 -

	worldNode[47] = @[
	// Tiles
	@"0",@"0",@"0",
	@"0",@"10",@"5",
	@"0",@"5",@"0",
	// Walls
	@"0",@"0",@"0",@"3",@"13|warp|46|0,-1",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"7|warp|48|1,0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];
	
	worldNode[48] = @[
	// Tiles
	@"0",@"5",@"0",
	@"0",@"10",@"5",
	@"0",@"0",@"0",
	// Walls
	@"0",@"13|warp|47|-1,0",@"0",@"0",@"13|warp|49|0,-1",@"0",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];
	
	worldNode[49] = @[
	// Tiles
	@"0",@"5",@"0",
	@"5",@"10",@"0",
	@"0",@"0",@"0",
	// Walls
	@"0",@"13|warp|50|-1,0",@"0",@"0",@"0",@"0",
	// Steps
	@"0",@"7|warp|48|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];
	
	worldNode[50] = @[
	// Tiles
	@"3",@"4",@"3|event|null|1|r",
	@"4",@"10",@"3",
	@"3",@"19",@"3",
	// Walls
	@"3",@"8|gateNestorine",@"3",@"3",@"16",@"3",
	// Steps
	@"0",@"7|warp|47|0,1",@"0",@"0",@"7|warp|55|1,0",@"0",
	// Name,Background,Audio
	@"Nephtaline Lobby 2",@"White",@"lobby"];

	// =======================
	// @ Events: Segment 3
	// =======================

	# pragma mark Segment 3 -

	worldNode[51] = @[
	// Tiles
	@"0",@"5",@"0",
	@"5",@"10",@"0",
	@"0",@"0",@"0",
	// Walls
	@"0",@"13|warp|50|-1,0",@"0",@"0",@"0",@"0",
	// Steps
	@"0",@"7|warp|48|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];
	
	worldNode[52] = @[
	// Tiles
	@"0",@"5",@"0",
	@"0",@"10",@"5",
	@"0",@"0",@"0",
	// Walls
	@"0",@"13|warp|47|-1,0",@"0",@"0",@"13|warp|49|0,-1",@"0",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];
	
	worldNode[53] = @[
	// Tiles
	@"0",@"0",@"0",
	@"0",@"10",@"5",
	@"0",@"5",@"0",
	// Walls
	@"0",@"0",@"0",@"3",@"13|warp|41|0,-1",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"7|warp|48|1,0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];
	
	worldNode[54] = @[
	// Tiles
	@"3",@"4",@"3|event|null|1|r",
	@"4",@"10",@"3",
	@"3",@"5",@"3",
	// Walls
	@"3",@"8|gateNestorine",@"3",@"3",@"16",@"3",
	// Steps
	@"0",@"7|warp|47|0,1",@"0",@"0",@"7|warp|51|1,0",@"0",
	// Name,Background,Audio
	@"Nephtaline Lobby 3",@"White",@"lobby"];

	// =======================
	// @ Events: Segment 4
	// =======================

	# pragma mark Segment 4 -

	worldNode[55] = @[
	// Tiles
	@"0",@"5",@"0",
	@"5",@"10",@"0",
	@"0",@"0",@"0",
	// Walls
	@"0",@"13|warp|50|-1,0",@"0",@"0",@"0",@"0",
	// Steps
	@"0",@"7|warp|56|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];

	worldNode[56] = @[
	// Tiles
	@"0",@"5",@"0",
	@"0",@"10",@"5",
	@"0",@"0",@"0",
	// Walls
	@"0",@"13|warp|57|-1,0",@"0",@"0",@"13|warp|55|0,-1",@"0",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];

	worldNode[57] = @[
	// Tiles
	@"0",@"0",@"0",
	@"0",@"10",@"5",
	@"0",@"5",@"0",
	// Walls
	@"0",@"0",@"0",@"3",@"13|warp|58|0,-1",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"7|warp|56|1,0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",@"lobby"];

	worldNode[58] = @[
	// Tiles
	@"3",@"4",@"3",
	@"4",@"10",@"2|event|null|4|l",
	@"3",@"3",@"3",
	// Walls
	@"3",@"7|gateNestorine",@"3",@"3",@"3",@"3",
	// Steps
	@"0",@"7|warp|47|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Nephtaline Lobby 2",@"White",@"lobby"];
	
}
@end
