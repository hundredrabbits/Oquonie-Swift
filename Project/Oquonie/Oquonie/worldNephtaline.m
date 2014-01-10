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
	
	worldNode[40] = @[
	// Tiles
	@"21",@"21",@"21",
	@"21",@"21|block|12",@"21",
	@"21",@"21",@"21",
	// Walls
	@"20",@"20",@"20",@"20",@"20",@"20",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Lobby Entrance",@"White",@"lobby"];
}
@end
