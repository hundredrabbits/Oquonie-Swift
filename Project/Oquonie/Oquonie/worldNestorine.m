//
//  xxiivvViewController+worldNestorine.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "worldNestorine.h"

@implementation xxiivvViewController (worldNestorine)

-(void)createWorldNestorine
{
	worldNode[80] = @[
	// Tiles
	@"21",@"21",@"21",
	@"21",@"21|block|14",@"21",
	@"21",@"21",@"21",
	// Walls
	@"20",@"20",@"20",@"24|warp|24|1,-1",@"21",@"20",
	// Steps
	@"0",@"0",@"0",@"10|warp|22|1,-1",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
}

@end
