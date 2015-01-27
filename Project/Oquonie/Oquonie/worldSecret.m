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
	@"36",@"36|event|petunia|30|l",@"36|event|secretCat2|33|l",
	@"36",@"36",@"36",
	@"36",@"36",@"36",
	// Walls
	@"31",@"31",@"31",@"31",@"31|warp|118|0,-1",@"31",
	// Steps
	@"0",@"0",@"0",@"0",@"3|warp|110|1,0",@"0",
	// Name,Background,Audio
	@"Petunia World(cat2)",@"Black",audioPurgatory];
	
	worldNode[112] = @[
	// Tiles
	@"32|event|secretCat1|33|l",@"0",@"5",
	@"30",@"0",@"4",
	@"4",@"6",@"5",
	// Walls
	@"3",@"0",@"13|warp|41|-1,1",@"3",@"3|event|gateCatfish",@"3",
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
	@"98",@"97|event|null|32|l",@"98",
	@"98",@"98",@"97",
	@"97",@"98",@"98",
	// Walls
	@"15",@"98",@"1",@"98",@"0",@"0",
	// Steps
	@"0",@"0",@"0",@"0",@"98|warp|100|1,0",@"0",
	// Name,Background,Audio
	@"Glitch World(cat1)",@"Pest",audioPlay];
	
	// Courtyard
	worldNode[116] = @[
	// Tiles
	@"4",@"5",@"6",
	@"5",@"33|event|secretCat3|33|l",@"4",
	@"4",@"6",@"5",
	// Walls
	@"36",@"13|warp|9|-1,0",@"36",@"3",@"37",@"3",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Test Level",@"White",audioPillar];
	
	// Extra Warp Zone TODO
	
	worldNode[117] = @[
	// Tiles
	@"9",@"10",@"9",
	@"10",@"7|event|warpLobby",@"10",
	@"9",@"10",@"9",
	// Walls
	@"36",@"36",@"36",@"36",@"36",@"36",
	// Steps
	@"0",@"0",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Test Level",@"White",audioPillar];
	
	// Daniel Room
	
	worldNode[118] = @[
	// Tiles
	@"31",@"29",@"31",
	@"29",@"50",@"29|event|daniel|34|l",
	@"31",@"29",@"31",
	// Walls
	@"34",@"37",@"34",@"35",@"37",@"35",
	// Steps
	@"0",@"7|warp|111|0,1",@"0",@"0",@"0",@"0",
	// Name,Background,Audio
	@"Dianel's Room",@"Red",audioGlitch];
	
	// Hiversaires Room
	
	worldNode[148] = @[
	// Tiles
	@"109",@"107",@"105",
	@"111|block|999",@"0|event|sauvegarde|36|r",@"106|block|29",
	@"112|block|999",@"110",@"108|block|999",
	// Walls
	@"102",@"103",@"102",@"0",@"0",@"0",
	// Steps
	@"0",@"0",@"0",@"0",@"7|warp|68|1,0",@"0",
	// Name,Background,Audio
    @"Dianel's Room",@"Void",audioGlitch];
    
    // Photobooth #1 - Lobby

    worldNode[149] = @[
    // Tiles
    @"4|block|30",@"5",@"6",
    @"5",@"18",@"4|event|kamera|37|l",
    @"6",@"5",@"4",
    // Walls
    @"19",@"19",@"36",@"36",@"37",@"36",
    // Steps
    @"0",@"7|warp|3|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Photobooth",@"White",audioPhotoBooth];

    // Photobooth #2 - Necomedre

    worldNode[150] = @[
    // Tiles
    @"33",@"21",@"21",
    @"33",@"18",@"21|event|kamera|37|l",
    @"33",@"21",@"21",
    // Walls
    @"20",@"21",@"20",@"20",@"21",@"20",
    // Steps
    @"0",@"0",@"0",@"7|warp|37|1,-1",@"0",@"0",
    // Name,Background,Audio
    @"Photobooth",@"White",audioPhotoBooth];

    // Photobooth #3 - Nephtaline

    worldNode[151] = @[
    // Tiles
    @"1",@"1",@"1",
    @"1",@"18",@"1|event|kamera|37|l",
    @"1",@"1",@"1",
    // Walls
    @"25",@"2",@"25",@"25",@"31",@"25",
    // Steps
    @"0",@"0",@"0",@"0",@"7|warp|46|1,0",@"0",
    // Name,Background,Audio
    @"Photobooth",@"Black",audioPhotoBooth];

    // Photobooth #4 - Neomine

    worldNode[152] = @[
    // Tiles
    @"36",@"3",@"36",
    @"3",@"18",@"3|event|kamera|37|l",
    @"36",@"3",@"36",
    // Walls
    @"0",@"0",@"0",@"31",@"30",@"31",
    // Steps
    @"0",@"0",@"0",@"0",@"7|warp|66|1,0",@"0",
    // Name,Background,Audio
    @"Photobooth",@"Red",audioPhotoBooth];

    // Photobooth #5 - Nestorine

    worldNode[153] = @[
    // Tiles
    @"1",@"34",@"34",
    @"1",@"18",@"34|event|kamera|37|l",
    @"1",@"34",@"34",
    // Walls
    @"35",@"34",@"37",@"37",@"34",@"35",
    // Steps
    @"0",@"7|warp|89|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Photobooth",@"Black",audioPhotoBooth];

    // Photobooth #6

    worldNode[154] = @[
    // Tiles
    @"1",@"1",@"1",
    @"1",@"1",@"1|event|kamera|37|l",
    @"1",@"1",@"1",
    // Walls
    @"1",@"1",@"1",@"1",@"1",@"1",
    // Steps
    @"0",@"7|warp|102|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Photobooth",@"White",audioPhotoBooth];

    // Photobooth #7

    worldNode[155] = @[
    // Tiles
    @"1",@"1",@"1",
    @"1",@"1",@"1|event|kamera|37|l",
    @"1",@"1",@"1",
    // Walls
    @"1",@"1",@"1",@"1",@"1",@"1",
    // Steps
    @"0",@"7|warp|142|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Photobooth",@"White",audioPhotoBooth];
    
}

@end
