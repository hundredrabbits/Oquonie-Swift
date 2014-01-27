//
//  xxiivvViewController+worldNephtaline.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
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
	@"18",@"6",@"4",
	@"5",@"0",@"30",
	@"25",@"0",@"32|block|4",
	// Walls
	@"0",@"0",@"0",@"12|warp|41|1,-1",@"0",@"3",
	// Steps
	@"0",@"0",@"0",@"6|event|gateNephtaline",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",audioNephtaline];

	worldNode[41] = @[
	// Tiles
	@"4",@"5",@"19",
	@"0",@"0",@"6",
	@"32",@"30",@"5",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"7|warp|40|1,1",@"0",@"0",@"0",@"0",@"7|warp|42|1,1",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",audioNephtaline];

	worldNode[42] = @[
	// Tiles
	@"32|event|nephtalineNemedique1|6|r",@"0",@"5",
	@"30",@"0",@"4",
	@"4",@"6",@"17",
	// Walls
	@"3",@"0",@"13|warp|41|-1,1",@"0",@"0",@"0",
	// Steps
	@"0",@"0",@"7|warp|43|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",audioNephtaline];
	
	worldNode[43] = @[
	// Tiles
	@"4",@"30",@"32|block|10",
	@"4",@"0",@"0",
	@"16",@"4",@"4",
	// Walls
	@"13|warp|44|-1,-1",@"0",@"3",@"3",@"0",@"13|warp|42|-1,-1",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",audioNephtaline];
	
	worldNode[44] = @[
	// Tiles
	@"18",@"4",@"4",
	@"4",@"0",@"30",
	@"4",@"0",@"32|event|nephtalineNeomine2|4|l",
	// Walls
	@"0",@"0",@"0",@"12|warp|45|1,-1",@"0",@"0",
	// Steps
	@"0",@"0",@"0",@"7|warp|43|1,-1",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",audioNephtaline];
	
	worldNode[45] = @[
	// Tiles
	@"4",@"4",@"17",
	@"30",@"0",@"4",
	@"32|block|7",@"0",@"4",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"7|warp|46|1,1",@"0",@"0",@"0",@"0",@"7|warp|42|1,0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",audioNephtaline];
	
	worldNode[46] = @[
	// Tiles
	@"3|block|13",@"5",@"6",
	@"17",@"4",@"3",
	@"3",@"3",@"3|event|nephtalineNeomine1|4|l",
	// Walls
	@"18",@"18",@"18",@"13|warp|41|1,-1",@"18",@"18",
	// Steps
	@"0",@"7|warp|47|0,1",@"0",@"0",@"7|warp|51|1,0",@"0",
	// Name,Background,Audio
	@"Nephtaline Lobby 1",@"White",audioNephtaline];

	// =======================
	// @ Events: Segment 2
	// =======================

	# pragma mark Segment 2 -

	worldNode[47] = @[
	// Tiles
	@"0",@"0",@"4|event|nephtalineNecomedre1|2|r",
	@"0",@"10",@"5",
	@"0",@"5",@"0",
	// Walls
	@"0",@"0",@"0",@"3",@"13|warp|46|0,-1",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"7|warp|48|1,0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",audioNephtaline];
	
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
	@"Necomedre Fork",@"White",audioNephtaline];
	
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
	@"Necomedre Fork",@"White",audioNephtaline];
	
	worldNode[50] = @[
	// Tiles
	@"3",@"32",@"3|event|owlSave|1|r",
	@"32",@"31",@"32",
	@"3",@"32",@"3|block|21",
	// Walls
	@"3",@"9|event|gateNemedique",@"3",@"2",@"16|event|map",@"2",
	// Steps
	@"0",@"7|warp|47|0,1",@"0",@"0",@"7|warp|55|1,0",@"0",
	// Name,Background,Audio
	@"Nephtaline Lobby 2",@"White",audioNephtaline];

	// =======================
	// @ Events: Segment 3
	// =======================

	# pragma mark Segment 3 -

	worldNode[51] = @[
	// Tiles
	@"0",@"5",@"5|event|speakerphone|9|l",
	@"5",@"10",@"5",
	@"0",@"0",@"0",
	// Walls
	@"3",@"13|warp|50|-1,0",@"3",@"0",@"0",@"0",
	// Steps
	@"0",@"7|warp|48|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",audioNephtaline];
	
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
	@"Necomedre Fork",@"White",audioNephtaline];
	
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
	@"Necomedre Fork",@"White",audioNephtaline];
	
	worldNode[54] = @[
	// Tiles
	@"3",@"4",@"3|event|null|1|r",
	@"4",@"10",@"3",
	@"3",@"5",@"3",
	// Walls
	@"3",@"8|gateNestorine",@"3",@"3",@"3",@"3",
	// Steps
	@"0",@"7|warp|47|0,1",@"0",@"0",@"7|warp|51|1,0",@"0",
	// Name,Background,Audio
	@"Nephtaline Lobby 3",@"White",audioNephtaline];

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
	@"Necomedre Fork",@"White",audioNephtaline];

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
	@"Necomedre Fork",@"White",audioNephtaline];

	worldNode[57] = @[
	// Tiles
	@"0",@"5",@"5|event|ramen|7|r",
	@"0",@"10",@"5",
	@"0",@"5",@"0",
	// Walls
	@"0",@"0",@"0",@"3",@"13|warp|58|0,-1",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"7|warp|56|1,0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",audioNephtaline];

	worldNode[58] = @[
	// Tiles
	@"31",@"4",@"31",
	@"4",@"5",@"31|event|nephtalineNeomine3|4|l",
	@"31",@"31",@"31",
	// Walls
	@"18",@"7|event|gateNeomine",@"18",@"18",@"18",@"18",
	// Steps
	@"0",@"7|warp|47|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Nephtaline Lobby 2",@"White",audioNephtaline];
	
	worldNode[59] = @[
	// Tiles
	@"2",@"2",@"2",
	@"2",@"7|event|warpLobby",@"2",
	@"2",@"2",@"2",
	// Walls
	@"3",@"3",@"3",@"3",@"3",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"4|event|gateNeomine",@"0",
	// Name,Background,Audio
	@"Nephtaline Lobby 2",@"White",audioNephtaline];
	
	worldNode[121] = @[
	// Tiles
	@"1",@"29",@"1",
	@"29",@"4|event|pillar|15|l",@"29",
	@"1",@"29",@"1",
	// Walls
	@"1",@"1",@"1",@"1",@"1",@"1",
	// Steps
	@"0",@"0",@"0",@"0",@"3|event|gateNemedique",@"0",
	// Name,Background,Audio
	@"Necomedre Pillar Room",@"White",audioNephtaline];
	
}
@end
