//
//  xxiivvViewController+worldNecomedre.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 12/30/2013.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "worldNecomedre.h"

@implementation xxiivvViewController (worldNecomedre)

-(void)createWorldNecomedre
{
	// =======================
	// @ Events: Segment 1
	// =======================
	
	# pragma mark Segment 1 -
	
	worldNode[21] = @[
	// Tiles
	@"21",@"21",@"21",
	@"21",@"21|block|14",@"21",
	@"21",@"21",@"21",
	// Walls
	@"20",@"20",@"20",@"24|warp|24|1,-1",@"21",@"20",
	// Steps
	@"0",@"0",@"0",@"10|warp|22|1,-1",@"0",@"0",
	// Name,Background,Audio
	@"Cubicle",@"White",audioQuiet];
	
	worldNode[22] = @[
	// Tiles
	@"21",@"21|event|intercom|20|r",@"21|block|15",
	@"21",@"21",@"21",
	@"21",@"21",@"21|block|16",
	// Walls
	@"24|warp|21|-1,-1",@"20",@"20",@"20",@"21",@"20",
	// Steps
	@"0",@"0",@"0",@"0",@"10|warp|23|1,0",@"0",
	// Name,Background,Audio
	@"Cubicle Audio Room",@"White",audioQuiet];
	
	worldNode[23] = @[
	// Tiles
	@"21|event|photocopier2|11|l",@"21",@"21|block|15",
	@"21",@"21",@"21",
	@"21|block|15",@"21",@"21|block|15",
	// Walls
	@"19",@"24|warp|22|-1,0",@"19",@"19",@"24|warp|26|0,-1",@"19",
	// Steps
	@"0",@"10|warp|28|0,1",@"0",@"0",@"10|warp|24|1,0",@"0",
	// Name,Background,Audio
	@"Cubicle 2",@"White",audioQuiet];
	
	worldNode[24] = @[
	// Tiles
	@"21",@"21",@"21|block|14",
	@"21",@"21",@"21",
	@"21|block|16",@"21",@"21",
	// Walls
	@"20",@"24|warp|23|-1,0",@"20",@"20",@"24|warp|27|0,-1",@"21",
	// Steps
	@"10|warp|21|1,1",@"0",@"0",@"0",@"10|warp|25|1,0",@"0",
	// Name,Background,Audio
	@"Cubicle",@"White",audioQuiet];
	
	worldNode[25] = @[
	// Tiles
	@"21|block|15",@"21",@"21|block|16",
	@"21",@"21",@"21",
	@"21|event|photocopier3|11|l",@"21",@"21",
	// Walls
	@"21",@"24|warp|24|-1,0",@"20",@"20",@"24|warp|28|0,-1",@"20",
	// Steps
	@"0",@"0",@"0",@"0",@"10|warp|26|1,0",@"0",
	// Name,Background,Audio
	@"Cubicle 3",@"White",audioQuiet];
	
	worldNode[26] = @[
	// Tiles
	@"21|block|14",@"21",@"21",
	@"21",@"21",@"21",
	@"21",@"21",@"21|block|16",
	// Walls
	@"20",@"24|warp|25|-1,0",@"20",@"20",@"20",@"21",
	// Steps
	@"0",@"10|warp|23|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Cubicle",@"White",audioQuiet];

	worldNode[27] = @[
	// Tiles
	@"21|block|15",@"21|block|15",@"21|block|15",
	@"21",@"21",@"21",
	@"21",@"21",@"21|block|16",
	// Walls
	@"19",@"19",@"19",@"19",@"21",@"20",
	// Steps
	@"0",@"10|warp|24|0,1",@"0",@"0",@"10|warp|28|1,0",@"0",
	// Name,Background,Audio
	@"Cubicle Storage Room",@"Black",audioQuiet];

	worldNode[28] = @[
	// Tiles
	@"21|block|14",@"21",@"21|event|photocopier1|11|l",
	@"21",@"21",@"21",
	@"21|block|16",@"21",@"21",
	// Walls
	@"20",@"24|warp|27|-1,0",@"20",@"20",@"24|warp|23|0,-1",@"21",
	// Steps
	@"0",@"10|warp|25|0,1",@"0",@"0",@"10|warp|29|1,0",@"0",
	// Name,Background,Audio
	@"Cubicle 1",@"White",audioQuiet];

	worldNode[29] = @[
	// Tiles
	@"21|block|15",@"21",@"21",
	@"21",@"8",@"21",
	@"21",@"21|block|16",@"21",
	// Walls
	@"20",@"24|warp|28|-1,0",@"20",@"20",@"28|event|gateDocument",@"21",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Office Landing",@"White",audioQuiet];
	
	worldNode[30] = @[
	// Tiles
	@"21|block|16",@"21|event|tutorialCharacter|12|r",@"21",
	@"1",@"1",@"1",
	@"21",@"21",@"21|block|1",
	// Walls
	@"20",@"20|warp|31|-1,0",@"20",@"20",@"21",@"20",
	// Steps
	@"0",@"3|event|gateDocument",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Office",@"White",audioQuiet];

	worldNode[31] = @[
	// Tiles
	@"21|block|16",@"2|event|tutorialCharacter|12|r",@"2",
	@"21",@"2",@"2",
	@"21",@"21",@"2|block|4",
	// Walls
	@"20",@"19|warp|31|-1,0",@"19",@"17",@"40|event|tutorialRedDoor",@"17",
	// Steps
	@"0",@"3",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Office Red",@"White",audioQuiet];
	
	// =======================
	// @ Events: Segment 2
	// =======================
	
	# pragma mark Segment 2 -
	
	worldNode[32] = @[
	// Tiles
	@"33|block|23",@"33",@"33",
	@"14",@"4",@"5",
	@"33",@"6",@"33",
	// Walls
	@"36",@"16|event|map",@"36",@"19",@"12|warp|33|0,-1",@"19",
	// Steps
	@"0",@"5|event|gateNecomedre",@"0",@"0",@"6|warp|35|1,0",@"0",
	// Name,Background,Audio
	@"Street Entrance",@"White",audioNecomedre];

	worldNode[33] = @[
	// Tiles
	@"33",@"33|event|necomedreNephtaline1|3|r",@"33",
	@"5",@"4",@"6",
	@"33",@"33",@"4",
	// Walls
	@"36",@"36",@"26",@"19",@"12|warp|34|0,-1",@"15",
	// Steps
	@"0",@"7|warp|32|0,1",@"0",@"0",@"0",@"6|warp|36|1,1",
	// Name,Background,Audio
	@"Street 1",@"White",audioNecomedre];

	worldNode[34] = @[
	// Tiles
	@"33|event|necomedreNestorine1|5|r",@"35",@"35",
	@"4",@"6",@"5",
	@"33",@"35",@"35|block|11",
	// Walls
	@"36",@"25",@"8|event|gateNestorine",@"36",@"12|warp|35|0,-1",@"26",
	// Steps
	@"0",@"6|warp|33|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Street Nestorine Gate",@"White",audioNecomedre];

	worldNode[35] = @[
	// Tiles
	@"33",@"33",@"33|event|ramen|7|r",
	@"33",@"33",@"33",
	@"33",@"33",@"33|event|speakerphone|9|l",
	// Walls
	@"26",@"12|warp|32|-1,0",@"26",@"19",@"12|warp|36|0,-1",@"19",
	// Steps
	@"0",@"6|warp|34|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Street Fork",@"White",audioNecomedre];

	worldNode[36] = @[
	// Tiles
	@"33|event|necomedreNephtaline2|3|r",@"0",@"4",
	@"33",@"0",@"4",
	@"33",@"0",@"4",
	// Walls
	@"26",@"0",@"12|warp|33|-1,1",@"19",@"12|warp|37|0,-1",@"19",
	// Steps
	@"0",@"6|warp|35|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Street 2",@"White",audioNecomedre];

	worldNode[37] = @[
	// Tiles
	@"33",@"4|event|necomedreNemedique1|6|r",@"4",
	@"33",@"33",@"4",
	@"33",@"4",@"4|block|23",
	// Walls
	@"26",@"26",@"26",@"26",@"12|warp|38|0,-1",@"26",
	// Steps
	@"0",@"6|warp|36|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Street Owl",@"White",audioNecomedre];

	worldNode[38] = @[
	// Tiles
	@"9",@"33|event|necomedreNephtaline3|3|r",@"33",
	@"4",@"33",@"13",
	@"9|block|5",@"33",@"33",
	// Walls
	@"26",@"26",@"26",@"18",@"5|event|gateNephtaline",@"18",
	// Steps
	@"0",@"6|warp|37|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Street 3",@"White",audioNecomedre];

	worldNode[39] = @[
	// Tiles
	@"33",@"33",@"4",
	@"18",@"7|event|warpLobby",@"33",
	@"5",@"33",@"33",
	// Walls
	@"26",@"19",@"36",@"36",@"19",@"19",
	// Steps
	@"0",@"7|warp|38|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Warp Zone I",@"White",audioWarp];
	
	worldNode[120] = @[
	// Tiles
	@"4",@"4",@"4",
	@"4",@"4|event|pillar|15|l",@"4",
	@"4",@"26",@"4",
	// Walls
	@"26",@"26",@"26",@"19",@"19",@"19",
	// Steps
	@"0",@"0",@"0",@"0",@"6|warp|34|0,1",@"0",
	// Name,Background,Audio
	@"Necomedre Pillar Room",@"White",audioNecomedre];

}

@end
