//
//  UIViewController+worldNastazie.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2014-06-15.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "xxiivvEvents.h"
#import "eventsNastazie.h"

@implementation xxiivvViewController (worldNastazie)

-(void)createWorldNastazie
{
	worldNode[130] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39|event|baba|35|l",
	@"36",@"39",@"36",
	// Walls
	@"99",@"29|event|gateNastazie",@"100",@"99",@"100",@"101|event|gateCatfish",
	// Steps
	@"0",@"0",@"3",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle",@"Black",audioNeomine];
	
	worldNode[131] = @[
	// Tiles
	@"36",@"39",@"36",
	@"39",@"28",@"39",
	@"36",@"39",@"36",
	// Walls
	@"99",@"31",@"100",@"99",@"100",@"31",
	// Steps
	@"0",@"0",@"3|event|gateCatfish",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Baba Castle Lobby",@"Black",audioNeomine];
	
	worldNode[132] = @[
	// Tiles
	@"101",@"100|event|baba|35|r",@"101",
	@"101",@"100",@"39",
	@"101",@"100",@"36",
	// Walls
	@"29|event|gateNastazie",@"99",@"100",@"99",@"100",@"101|event|gateCatfish",
	// Steps
	@"0",@"0",@"0",@"0",@"3",@"0",
	// Name,Background,Audio
	@"Baba Castle",@"Black",audioNeomine];

	
	
}

@end
