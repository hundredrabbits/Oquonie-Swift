//
//  xxiivvViewController+worldSecret.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2/8/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "xxiivvEvents.h"
#import "worldSecret.h"

@implementation xxiivvViewController (worldSecret)

-(void)createWorldSecret
{
	worldNode[110] = @[
	// Tiles
	@"1|block|19",@"1",@"1|block|19",
	@"38",@"1",@"38|event|neomineNestorine1|5|l",
	@"1",@"1",@"1",
	// Walls
	@"31",@"30|warp|111|-1,0",@"31",@"33",@"31",@"33",
	// Steps
	@"0",@"0",@"3|warp|60|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Neomine Side Room",@"Black",audioNeomine];
	
	worldNode[111] = @[
	// Tiles
	@"36",@"36|event|petunia|30|l",@"36",
	@"36",@"36",@"36",
	@"36",@"36",@"36",
	// Walls
	@"31",@"31",@"31",@"31",@"31",@"31",
	// Steps
	@"0",@"0",@"0",@"0",@"3|warp|110|1,0",@"0",
	// Name,Background,Audio
	@"Petunia World(cat2)",@"Black",audioPurgatory];
	
	worldNode[112] = @[
	// Tiles
	@"32",@"0",@"5",
	@"30",@"0",@"4",
	@"4",@"6",@"5",
	// Walls
	@"3",@"0",@"13|warp|41|-1,1",@"3",@"3|event|catDoor",@"3",
	// Steps
	@"0",@"0",@"7|warp|43|-1,1",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",audioNephtaline];
	
	worldNode[113] = @[
	// Tiles
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	@"1",@"1",@"1",
	// Walls
	@"1",@"1|warp|113|-1,0",@"1",@"1|event|shuffleRoom",@"1|warp|113|0,-1",@"1",
	// Steps
	@"0",@"1|warp|112|0,1",@"0",@"0",@"1|warp|113|1,0",@"0",
	// Name,Background,Audio
	@"Necomedre Fork",@"White",audioEndless];
	
	// Glitch in nestorine
	worldNode[114] = @[
	// Tiles
	@"99",@"99",@"99",
	@"99",@"99",@"99",
	@"99",@"99",@"99",
	// Walls
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Steps
	@"0",@"0",@"0",@"0",@"0|warp|86|1,0",@"0",
	// Name,Background,Audio
	@"Glitch World(cat3)",@"White",audioGlitch];
	
	// Glitch in nemedique
	worldNode[115] = @[
	// Tiles
	@"98",@"97|event|null|33|l",@"98",
	@"98",@"98",@"97",
	@"97",@"98",@"98",
	// Walls
	@"15",@"98",@"1",@"98",@"0",@"0",
	// Steps
	@"0",@"0",@"0",@"0",@"98|warp|100|1,0",@"0",
	// Name,Background,Audio
	@"Glitch World(cat1)",@"Pest",audioPlay];
	
	
}

@end
