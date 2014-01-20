//
//  xxiivvViewController+worldNestorine.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/9/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "worldNestorine.h"

@implementation xxiivvViewController (worldNestorine)

-(void)createWorldNestorine
{
	worldNode[80] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|81|0,1",@"0",@"0",@"1|warp|82|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[81] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|83|0,1",@"0",@"0",@"1|warp|84|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[82] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|84|0,1",@"0",@"0",@"1|warp|85|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[83] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|86|0,1",@"0",@"0",@"1|warp|87|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[84] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|87|0,1",@"0",@"0",@"1|warp|88|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[85] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|88|0,1",@"0",@"0",@"1|warp|89|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[86] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|80|0,1",@"0",@"0",@"1|warp|90|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[87] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|90|0,1",@"0",@"0",@"1|warp|91|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[88] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|91|0,1",@"0",@"0",@"1|warp|92|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[89] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|92|0,1",@"0",@"0",@"1|warp|80|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[90] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|80|0,1",@"0",@"0",@"1|warp|93|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[91] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|93|0,1",@"0",@"0",@"1|warp|94|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[92] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|94|0,1",@"0",@"0",@"1|warp|80|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];

	worldNode[93] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|80|0,1",@"0",@"0",@"1|warp|80|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];
	
	worldNode[94] = @[
	// Tiles
	@"0",@"21",@"0",
	@"21",@"21",@"21",
	@"0",@"21",@"0",
	// Walls
	@"0",@"30|warp|80|-1,0",@"0",@"0",@"30|warp|80|0,-1",@"0",
	// Steps
	@"0",@"1|warp|80|0,1",@"0",@"0",@"1|warp|80|1,0",@"0",
	// Name,Background,Audio
	@"Fork Start",@"White",audioNestorine];
	
}

@end
