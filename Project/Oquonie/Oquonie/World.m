//
//  World.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"

#import "World.h"

@implementation World

-(World*)init
{
    NSLog(@"> WORLD | Starting..");
    
    worldNode = [NSMutableArray arrayWithObjects:@"",nil];
    int myCount = 0;
    while ( myCount < 160 )	{ myCount++; worldNode[myCount] = @[];	}
    
    NSLog(@"> WORLD | Generating Lobby..");
    [self createWorldLobby];
    NSLog(@"> WORLD | Generating Necomedre..");
    [self createWorldNecomedre];
    NSLog(@"> WORLD | Generating Nephtaline..");
    [self createWorldNephtaline];
    NSLog(@"> WORLD | Generating Neomine..");
    [self createWorldNeomine];
    NSLog(@"> WORLD | Generating Nestorine..");
    [self createWorldNestorine];
    NSLog(@"> WORLD | Generating Nemedique..");
    [self createWorldNemedique];
    NSLog(@"> WORLD | Generating Secret..");
    [self createWorldSecret];
    NSLog(@"> WORLD | Generating Nastazie..");
    [self createWorldNastazie];
    
    return self;
}

-(NSArray*)roomAtLocation :(int)location
{
    return worldNode[location];
}

-(void)createWorldLobby
{
    worldNode[1] = @[
    // Tiles
    @"0",@"25",@"2|block|10",
    @"2",@"8",@"4",
    @"2",@"2",@"2|event|socket|14|l",
    // Walls
    @"0",@"5|event|gateNephtaline",@"2",@"2",@"12|warp|2|0,-1",@"15",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Lobby Entrance",@"White",audioLobby];

    worldNode[2] = @[
    // Tiles
    @"1",@"4",@"1|block|24",
    @"6",@"5",@"1|event|ramenLobby|7|l",
    @"1",@"1",@"1",
    // Walls
    @"16|event|map",@"12|warp|3|-1,0",@"19",@"25",@"25",@"25",
    // Steps
    @"0",@"7|warp|1|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Lobby Deck",@"White",audioLobby];

    worldNode[3] = @[
    // Tiles
    @"1|event|socket|14|l",@"23",@"1|event|owlSave|1|r",
    @"6",@"5",@"1",
    @"1|block|1",@"4",@"1",
    // Walls
    @"1",@"7|event|gateNeomine",@"1",@"1",@"104|event|gatePhotoBooth",@"1",
    // Steps
    @"0",@"7|warp|4|0,1",@"0",@"0",@"7|warp|2|1,0",@"0",
    // Name,Background,Audio
    @"Lobby Neomine",@"White",audioLobby];

    worldNode[4] = @[
    // Tiles
    @"1|event|speakerphone|9|r",@"1",@"1|block|9",
    @"1",@"5",@"6",
    @"1",@"6",@"1",
    // Walls
    @"26",@"14|warp|14|-1,0",@"26",@"1",@"12|warp|3|0,-1",@"1",
    // Steps
    @"0",@"0",@"0",@"0",@"7|warp|5|1,0",@"0",
    // Name,Background,Audio
    @"Lobby House Room",@"White",audioLobby];

    worldNode[5] = @[
    // Tiles
    @"9|block|30",@"10",@"9|event|socket|14|l",
    @"4",@"5",@"14",
    @"9",@"6",@"9",
    // Walls
    @"3",@"14|warp|4|-1,0",@"3",@"3",@"4|event|gateNecomedre",@"3",
    // Steps
    @"0",@"7|warp|9|0,1",@"0",@"0",@"7|warp|6|1,0",@"0",
    // Name,Background,Audio
    @"Lobby Fork",@"White",audioLobby];

    worldNode[6] = @[
    // Tiles
    @"9",@"4",@"9|block|5",
    @"10",@"5",@"6",
    @"9",@"10",@"9|event|shark|8|l",
    // Walls
    @"3",@"13|warp|5|-1,0",@"3",@"26",@"13|warp|7|0,-1",@"26",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Lobby Turn",@"White",audioLobby];

    worldNode[7] = @[
    // Tiles
    @"9",@"10|block|11",@"0",
    @"4",@"5",@"12",
    @"9|event|socket|14|l",@"0",@"0",
    // Walls
    @"19",@"0",@"0",@"0",@"8|event|gateNestorine",@"0",
    // Steps
    @"0",@"7|warp|6|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Lobby Nestorine",@"White",audioLobby];

    worldNode[8] = @[];

    worldNode[9] = @[
    // Tiles
    @"10|event|socket|14|l",@"27",@"10",
    @"9",@"4",@"5",
    @"0",@"6",@"10",
    // Walls
    @"18",@"9|event|gateNemedique",@"18",@"3",@"13|warp|5|0,-1",@"3",
    // Steps
    @"0",@"0",@"0",@"0",@"7|event|courtyard",@"0",
    // Name,Background,Audio
    @"Lobby Nemedique",@"White",audioLobby];

    worldNode[10] = @[
    // Tiles
    @"3",@"3",@"3",
    @"3",@"3",@"3",
    @"3",@"3",@"3",
    // Walls
    @"3",@"3",@"3",@"3",@"3",@"3",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Test Level",@"White",audioLobby];

    worldNode[11] = @[
    // Tiles
    @"4",@"5",@"6",
    @"5",@"33|event|tree|23|l",@"4",
    @"4",@"6",@"5",
    // Walls
    @"36",@"13|warp|9|-1,0",@"36",@"3",@"37",@"3",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Test Level",@"White",audioPillar];

    worldNode[13] = @[
    // Tiles
    @"4",@"5",@"6",
    @"5",@"33|event|tree|23|l",@"4",
    @"4",@"6",@"5",
    // Walls
    @"36",@"13|warp|9|-1,0",@"36",@"3",@"37",@"3",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Test Level",@"White",audioPillar];

    worldNode[14] = @[
    // Tiles
    @"0",@"0|event|noface|29|r",@"0",
    @"0",@"5",@"0",
    @"0",@"5",@"0",
    // Walls
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Steps
    @"0",@"0",@"0",@"0",@"7|warp|4|1,0",@"0",
    // Name,Background,Audio
    @"Test Level",@"White",audioNastazie];
    
}

-(void)createWorldNecomedre
{
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
    @"21",@"21",@"21|block|15",
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
    @"21",@"17",@"21",
    @"21",@"21",@"21|block|15",
    // Walls
    @"19",@"1",@"19",@"19",@"1",@"19",
    // Steps
    @"0",@"10|warp|28|0,1",@"0",@"0",@"0",@"0",
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
    @"21",@"18",@"21",
    @"21|event|photocopier3|11|l",@"21",@"21",
    // Walls
    @"21",@"20",@"20",@"20",@"24|warp|28|0,-1",@"20",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
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
    @"21|block|15",@"21|event|intercom|20|r",@"21|block|15",
    @"21",@"19",@"21",
    @"21",@"21",@"21|block|16",
    // Walls
    @"19",@"19",@"19",@"19",@"21",@"20",
    // Steps
    @"0",@"0",@"0",@"0",@"10|warp|28|1,0",@"0",
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
    @"4",@"5|event|redGhost|12|r",@"6",
    @"6",@"5",@"4",
    @"5",@"4",@"5",
    // Walls
    @"26",@"26",@"26",@"26",@"40|event|tutorialRedDoor",@"15",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Office Red",@"Black",audioPillar];

    worldNode[32] = @[
    // Tiles
    @"33|block|23",@"33",@"33|event|owlSave|1|r",
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
    @"33",@"0",@"4|event|redGhost|12|l",
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
    @"105|event|gatePhotoBooth",@"26",@"26",@"26",@"12|warp|38|0,-1",@"26",
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
    @"4",@"9",@"5",
    @"9",@"32|event|pillar|15|l",@"9",
    @"5",@"9",@"6",
    // Walls
    @"36",@"37",@"36",@"36",@"37",@"36",
    // Steps
    @"0",@"0",@"0",@"0",@"6|warp|34|0,1",@"0",
    // Name,Background,Audio
    @"Necomedre Pillar Room",@"Red",audioPillar];
    
}

-(void)createWorldNephtaline
{

    worldNode[40] = @[
    // Tiles
    @"18",@"6",@"4",
    @"5",@"0",@"30",
    @"25",@"0",@"32|event|redGhost|12|l",
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
    @"7|warp|46|1,1",@"0",@"0",@"0",@"0",@"7|event|catDoorFork",
    // Name,Background,Audio
    @"Necomedre Fork",@"White",audioNephtaline];

    worldNode[46] = @[
    // Tiles
    @"3|block|13",@"5",@"6",
    @"17",@"4",@"3",
    @"3",@"3",@"3|event|nephtalineNeomine1|4|l",
    // Walls
    @"18",@"18|event|gatePhotoBooth",@"18",@"13|warp|41|1,-1",@"18",@"18",
    // Steps
    @"0",@"7|warp|47|0,1",@"0",@"0",@"7|warp|51|1,0",@"0",
    // Name,Background,Audio
    @"Nephtaline Lobby 1",@"White",audioNephtaline];

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
    @"32",@"29",@"32",
    @"29",@"7|event|warpLobby",@"29",
    @"32",@"5",@"32",
    // Walls
    @"3",@"2",@"3",@"3",@"2",@"3",
    // Steps
    @"0",@"0",@"0",@"0",@"4|event|gateNeomine",@"0",
    // Name,Background,Audio
    @"Warp Zone II",@"White",audioWarp];

    worldNode[121] = @[
    // Tiles
    @"97",@"31",@"97",
    @"31",@"4|event|pillar|15|l",@"31",
    @"98",@"31",@"98",
    // Walls
    @"25",@"18",@"25",@"25",@"18",@"25",
    // Steps
    @"0",@"0",@"0",@"0",@"3|event|gateNemedique",@"0",
    // Name,Background,Audio
    @"Necomedre Pillar Room",@"Red",audioPillar];

}

-(void)createWorldNeomine
{
    worldNode[60] = @[
    // Tiles
    @"1",@"4|block|13",@"18",
    @"1",@"4",@"1",
    @"1",@"23",@"1",
    // Walls
    @"33",@"31",@"33",@"30|warp|62|1,-1",@"16|event|map",@"14|event|petuniaFork",
    // Steps
    @"0",@"0",@"0",@"0",@"4|event|gateNeomine",@"0",
    // Name,Background,Audio
    @"Neomine Entrance",@"Black",audioNeomine];

    worldNode[61] = @[
    // Tiles
    @"1|block|19",@"1|event|neomineNestorine1|5|r",@"1|block|19",
    @"38",@"1",@"38",
    @"1",@"1",@"1",
    // Walls
    @"31",@"30",@"31",@"33",@"31",@"33",
    // Steps
    @"0",@"0",@"3|warp|60|-1,1",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Neomine Side Room",@"Black",audioNeomine];

    worldNode[62] = @[
    // Tiles
    @"4",@"5",@"6|event|neomineNecomedre1|2|l",
    @"5",@"6",@"33",
    @"6",@"4|block|23",@"5",
    // Walls
    @"32",@"31",@"32",@"36",@"4|event|gateNecomedre",@"36",
    // Steps
    @"3|warp|60|1,1",@"0",@"3|warp|63|-1,1",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Neomine Entrance",@"Black",audioNeomine];

    worldNode[63] = @[
    // Tiles
    @"10|event|ramen|7|r",@"10",@"10",
    @"10",@"0|block|9",@"10",
    @"10",@"10",@"9",
    // Walls
    @"32",@"33",@"32",@"14|warp|66|1,-1",@"30|warp|64|0,-1",@"14|warp|62|-1,-1",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Neomine Entrance",@"Black",audioNeomine];

    worldNode[64] = @[
    // Tiles
    @"39",@"1",@"39|block|21",
    @"36",@"32",@"36|event|neomineNephtaline1|3|l",
    @"39",@"36",@"1",
    // Walls
    @"33",@"33",@"33",@"31",@"31",@"15",
    // Steps
    @"3|warp|68|1,1",@"3|warp|63|0,1",@"3|warp|65|-1,1",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Neomine Entrance",@"Black",audioNeomine];

    worldNode[65] = @[
    // Tiles
    @"0",@"33|event|neomineNestorine3|5|r",@"1",
    @"1",@"33",@"1|block|1",
    @"1",@"33",@"33",
    // Walls
    @"0",@"3",@"3",@"3",@"15",@"14|warp|64|-1,-1",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Neomine Entrance",@"Black",audioNeomine];

    worldNode[66] = @[
    // Tiles
    @"39",@"36",@"39|block|13",
    @"36",@"28",@"29|event|owlSave|1|l",
    @"39",@"36",@"39",
    // Walls
    @"31",@"31|event|gatePhotoBooth",@"31",@"33",@"32",@"33",
    // Steps
    @"3|warp|63|1,1",@"3|warp|67|0,1",@"3|warp|68|-1,1",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Neomine Entrance",@"Black",audioNeomine];

    worldNode[67] = @[
    // Tiles
    @"1",@"36|event|neomineNestorine2|5|r",@"1",
    @"1",@"39",@"36",
    @"1",@"1",@"1",
    // Walls
    @"25",@"25",@"25",@"31",@"30|warp|66|0,-1",@"31",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Neomine Entrance",@"Black",audioNeomine];

    worldNode[68] = @[
    // Tiles
    @"38|event|redGhost|12|r",@"10",@"38",
    @"4",@"9",@"10",
    @"5",@"6",@"10",
    // Walls
    @"35",@"38|event|gateHiversaires",@"20",@"30|warp|64|1,-1",@"30|warp|69|0,-1",@"30|warp|66|-1,-1",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Neomine Entrance",@"Black",audioNeomine];

    worldNode[69] = @[
    // Tiles
    @"35",@"35",@"34|event|speakerphone|9|l",
    @"35",@"35",@"12",
    @"35",@"35",@"34",
    // Walls
    @"35",@"34",@"35",@"34",@"8|event|gateNestorine",@"34",
    // Steps
    @"0",@"3|warp|68|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Nestorine Exit",@"Black",audioNeomine];

    worldNode[70] = @[
    // Tiles
    @"39",@"40",@"39",
    @"40",@"7|event|warpLobby",@"40",
    @"39",@"40",@"39",
    // Walls
    @"29|warp|70|1,0",@"29|warp|70|1,1",@"29|warp|70|1,-1",@"29|warp|70|0,1",@"29|warp|70|-1,1",@"29|warp|70|1,1",
    // Steps
    @"0",@"7|event|gateNestorine",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Warp Zone III",@"Black",audioWarp];

    worldNode[71] = @[
    // Tiles
    @"1",@"29",@"1",
    @"29",@"37|event|pillar|15|l",@"29",
    @"1",@"29",@"1",
    // Walls
    @"18",@"17",@"18",@"18",@"17",@"18",
    // Steps
    @"0",@"3|event|gateNecomedre",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Necomedre Pillar Room",@"Red",audioPillar];

}

-(void)createWorldNestorine
{
    worldNode[80] = @[
    // Tiles
    @"35|block|23",@"35",@"7|event|warpLobby",
    @"34",@"8",@"35",
    @"35",@"34",@"35",
    // Walls
    @"35",@"15",@"35",@"34",@"15",@"34",
    // Steps
    @"0",@"7|warp|81|0,1",@"0",@"0",@"7|warp|82|1,0",@"0",
    // Name,Background,Audio
    @"Fork Start",@"White",audioNestorine];

    worldNode[81] = @[
    // Tiles
    @"34",@"35",@"35",
    @"35",@"35",@"35",
    @"34",@"35",@"34",
    // Walls
    @"34",@"35",@"34",@"25",@"15",@"25",
    // Steps
    @"0",@"1|warp|83|0,1",@"0",@"0",@"1|warp|84|1,0",@"0",
    // Name,Background,Audio
    @"Fork Start",@"White",audioNestorine];

    worldNode[82] = @[
    // Tiles
    @"34",@"35",@"34",
    @"35",@"35",@"34",
    @"34|block|11",@"35",@"34",
    // Walls
    @"25",@"15",@"25",@"35",@"34",@"35",
    // Steps
    @"0",@"1|warp|84|0,1",@"0",@"0",@"1|warp|85|1,0",@"0",
    // Name,Background,Audio
    @"Fork Start",@"White",audioNestorine];

    worldNode[83] = @[
    // Tiles
    @"34",@"34",@"34",
    @"35",@"35",@"35",
    @"35|block|23",@"35",@"0",
    // Walls
    @"35",@"34",@"35",@"26",@"15",@"26",
    // Steps
    @"0",@"1|warp|86|0,1",@"0",@"0",@"1|warp|87|1,0",@"0",
    // Name,Background,Audio
    @"Fork Start",@"White",audioNestorine];

    worldNode[84] = @[
    // Tiles
    @"34",@"35",@"35|event|owlSave|1|r",
    @"35",@"35",@"35",
    @"35|block|11",@"35",@"34",
    // Walls
    @"35",@"15",@"34",@"34",@"15",@"35",
    // Steps
    @"0",@"1|warp|87|0,1",@"0",@"0",@"1|warp|88|1,0",@"0",
    // Name,Background,Audio
    @"Fork Start",@"White",audioNestorine];

    worldNode[85] = @[
    // Tiles
    @"34",@"35",@"35",
    @"35",@"35",@"35|event|redGhost|12|l",
    @"0",@"35",@"34",
    // Walls
    @"26",@"15",@"26",@"34",@"16|event|map",@"34",
    // Steps
    @"0",@"1|warp|88|0,1",@"0",@"0",@"1|warp|89|1,0",@"0",
    // Name,Background,Audio
    @"Fork Start",@"White",audioNestorine];

    worldNode[86] = @[
    // Tiles
    @"34",@"10",@"34",
    @"35",@"35",@"35",
    @"34",@"0",@"34",
    // Walls
    @"34",@"34|warp|114|-1,0",@"34",@"25",@"15",@"25",
    // Steps
    @"0",@"1|warp|80|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Fork Start",@"White",audioNestorine];

    worldNode[87] = @[
    // Tiles
    @"35",@"35",@"35|event|speakerphone|9|r",
    @"35",@"35",@"35",
    @"35",@"35",@"0",
    // Walls
    @"25",@"15",@"25",@"26",@"15",@"26",
    // Steps
    @"0",@"0",@"0",@"0",@"1|warp|91|1,0",@"0",
    // Name,Background,Audio
    @"Fork Start",@"White",audioNestorine];

    worldNode[88] = @[
    // Tiles
    @"34",@"35",@"35|event|ramen|7|l",
    @"35",@"35",@"35",
    @"34",@"34",@"0",
    // Walls
    @"36",@"15",@"36",@"36",@"15",@"0",
    // Steps
    @"0",@"1|warp|91|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Fork Ramen",@"White",audioNestorine];

    worldNode[89] = @[
    // Tiles
    @"34",@"35",@"0",
    @"34",@"35",@"34",
    @"34",@"35",@"34",
    // Walls
    @"26",@"15",@"0",@"0",@"34|event|gatePhotoBooth",@"34",
    // Steps
    @"0",@"0",@"0",@"0",@"1|warp|80|1,0",@"0",
    // Name,Background,Audio
    @"Fork Start",@"White",audioNestorine];

    worldNode[90] = @[
    // Tiles
    @"35",@"34",@"35",
    @"34",@"38|event|pillar|15|l",@"34",
    @"35",@"34",@"35",
    // Walls
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Steps
    @"0",@"0",@"0",@"0",@"6|event|gateNephtaline",@"0",
    // Name,Background,Audio
    @"Necomedre Pillar Room",@"Red",audioPillar];

    worldNode[91] = @[
    // Tiles
    @"34",@"35",@"35|event|nestorineNephtaline1|3|r",
    @"35",@"35",@"35",
    @"34",@"35",@"35|block|23",
    // Walls
    @"25",@"15",@"25",@"25",@"15",@"25",
    // Steps
    @"0",@"1|warp|93|0,1",@"0",@"0",@"1|warp|94|1,0",@"0",
    // Name,Background,Audio
    @"Fork Start",@"White",audioNestorine];

    worldNode[92] = @[
    // Tiles
    @"28",@"38",@"28",
    @"36",@"7|event|warpLobby",@"36",
    @"28",@"38",@"28",
    // Walls
    @"31",@"37",@"31",@"31",@"37",@"31",
    // Steps
    @"0",@"1|warp|94|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Warp Zone IV",@"White",audioWarp];

    worldNode[93] = @[
    // Tiles
    @"35",@"34",@"35|event|nestorineNemedique2|6|r",
    @"35",@"32",@"35",
    @"35",@"35",@"35|block|11",
    // Walls
    @"1",@"5|event|gateNephtaline",@"1",@"25",@"15",@"25",
    // Steps
    @"0",@"1|warp|80|0,1",@"0",@"0",@"1|warp|95|1,0",@"0",
    // Name,Background,Audio
    @"Gate for pillar",@"White",audioNestorine];

    worldNode[94] = @[
    // Tiles
    @"5",@"4",@"3|event|nestorineNemedique3|6|l",
    @"10",@"9",@"11",
    @"4",@"10",@"3",
    // Walls
    @"25",@"15",@"25",@"3",@"9|event|gateNemedique",@"3",
    // Steps
    @"0",@"3|warp|95|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Fork Start",@"White",audioNestorine];

    worldNode[95] = @[
    // Tiles
    @"34",@"35",@"35|event|nestorineNemedique1|6|r",
    @"35",@"35",@"35",
    @"35|block|23",@"35",@"0",
    // Walls
    @"25",@"15",@"25",@"26",@"15",@"0",
    // Steps
    @"0",@"1|warp|80|0,1",@"0",@"0",@"1|warp|80|1,0",@"0",
    // Name,Background,Audio
    @"Fork Start",@"White",audioNestorine];

    worldNode[96] = @[
    // Tiles
    @"35",@"35",@"35",
    @"34",@"7|event|warpNestorine",@"35",
    @"35",@"35",@"35",
    // Walls
    @"34",@"35",@"34",@"19",@"19",@"19",
    // Steps
    @"0",@"1|event|gateNestorine",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Entrance Warp",@"White",audioWarp];

    worldNode[97] = @[
    // Tiles
    @"35",@"35",@"35",
    @"35",@"7",@"35",
    @"35",@"35",@"35",
    // Walls
    @"25",@"15|warp|94|-1,0",@"25",@"0",@"0",@"0",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Unused",@"White",audioNestorine];

}

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
    @"0",@"0",@"0",@"0",@"8|warp|46|1,0",@"0",
    // Name,Background,Audio
    @"Photobooth",@"Void",audioPhotoBooth];

    // Photobooth #4 - Neomine

    worldNode[152] = @[
    // Tiles
    @"36",@"3",@"36",
    @"3",@"18",@"3|event|kamera|37|l",
    @"36",@"3",@"36",
    // Walls
    @"0",@"0",@"0",@"31",@"30",@"31",
    // Steps
    @"0",@"0",@"0",@"0",@"8|warp|66|1,0",@"0",
    // Name,Background,Audio
    @"Photobooth",@"Red",audioPhotoBooth];

    // Photobooth #5 - Nestorine

    worldNode[153] = @[
    // Tiles
    @"1",@"35",@"34",
    @"34",@"18",@"35|event|kamera|37|l",
    @"1",@"35",@"34",
    // Walls
    @"35",@"34",@"37",@"37",@"34",@"35",
    // Steps
    @"0",@"8|warp|89|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Photobooth",@"Black",audioPhotoBooth];

    // Photobooth #6 - Nemedique

    worldNode[154] = @[
    // Tiles
    @"36",@"32",@"36",
    @"32",@"18",@"32|event|kamera|37|l",
    @"36",@"32",@"36",
    // Walls
    @"25",@"25",@"25",@"2",@"29",@"2",
    // Steps
    @"0",@"8|warp|102|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Photobooth",@"White",audioPhotoBooth];

    // Photobooth #7

    worldNode[155] = @[
    // Tiles
    @"33",@"35",@"35",
    @"33",@"101",@"35|event|kamera|37|l",
    @"33",@"33",@"35",
    // Walls
    @"101",@"101",@"101",@"101",@"100",@"101",
    // Steps
    @"0",@"8|warp|142|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Photobooth",@"Void",audioPhotoBooth];

}

-(void)createWorldNastazie
{
    worldNode[130] = @[
    // Tiles
    @"36",@"39|event|nastazieNastazie1|35|r",@"36",
    @"39",@"8",@"39",
    @"36",@"39",@"36",
    // Walls
    @"30|warp|131|-1,-1",@"99",@"100",@"99",@"30|event|gateNastazie",@"99",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Baba Castle",@"Black",audioNastazie];

    worldNode[131] = @[
    // Tiles
    @"101",@"10",@"101|block|30",
    @"10",@"9",@"10",
    @"101",@"10",@"101",
    // Walls
    @"101",@"30|warp|142|-1,0",@"101",@"101",@"30|warp|133|0,-1",@"101",
    // Steps
    @"0",@"0",@"0",@"3|warp|130|1,-1",@"0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[132] = @[
    // Tiles
    @"36",@"39",@"9",
    @"39",@"32",@"10|event|nastazieNemedique1|6|l",
    @"36",@"39",@"10",
    // Walls
    @"99",@"99",@"30|warp|143|-1,1",@"99",@"99",@"19",
    // Steps
    @"3|warp|140|1,1",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[133] = @[
    // Tiles
    @"36",@"39",@"10",
    @"39",@"32",@"9|event|nastazieNeomine1|4|l",
    @"36",@"39",@"10",
    // Walls
    @"99",@"29|warp|142|-1,0",@"99",@"99",@"19",@"101",
    // Steps
    @"0",@"3|warp|139|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[134] = @[
    // Tiles
    @"36",@"39",@"10",
    @"39",@"32",@"10|event|nastazieNephtaline2|3|l",
    @"36",@"39",@"9",
    // Walls
    @"12|warp|141|-1,-1",@"99",@"99",@"99",@"99",@"99",
    // Steps
    @"0",@"0",@"3|warp|138|-1,1",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[135] = @[
    // Tiles
    @"36",@"39|event|nastazieNemedique2|6|r",@"36",
    @"39",@"31",@"39",
    @"10",@"10",@"9",
    // Walls
    @"99",@"99",@"12|warp|143|-1,1",@"99",@"99",@"12|warp|134|-1,-1",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[136] = @[
    // Tiles
    @"36",@"39",@"36|event|nastazieNastazie3|35|r",
    @"39",@"19",@"39",
    @"10",@"9",@"10",
    // Walls
    @"99",@"29|warp|142|-1,0",@"99",@"99",@"29|warp|133|0,-1",@"99",
    // Steps
    @"0",@"0",@"0",@"0",@"8|warp|131|1,0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[137] = @[
    // Tiles
    @"36",@"39",@"36",
    @"39",@"31",@"39",
    @"9",@"10",@"10",
    // Walls
    @"30|warp|141|-1,-1",@"99",@"99",@"30|warp|132|1,-1",@"99",@"99",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[138] = @[
    // Tiles
    @"10",@"39",@"36|event|nastazieNemedique3|6|r",
    @"10",@"8",@"39",
    @"9",@"39",@"36",
    // Walls
    @"25",@"14|warp|142|-1,0",@"25",@"99",@"99",@"29|warp|134|-1,-1",
    // Steps
    @"0",@"0",@"0",@"8|warp|137|1,-1",@"0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[139] = @[
    // Tiles
    @"10",@"39",@"36|event|nastazieNeomine2|4|l",
    @"9",@"17",@"39",
    @"10",@"39",@"36",
    // Walls
    @"30|warp|141|-1,-1",@"99",@"100",@"99",@"29|warp|133|0,-1",@"99",
    // Steps
    @"0",@"8|warp|131|0,1",@"0",@"0",@"8|warp|136|1,0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[140] = @[
    // Tiles
    @"9",@"39",@"36",
    @"10",@"8",@"39|event|nastazieNephtaline1|3|l",
    @"10",@"39",@"36",
    // Walls
    @"12|warp|141|-1,-1",@"99",@"99",@"12|warp|132|1,-1",@"99",@"99",
    // Steps
    @"0",@"0",@"0",@"0",@"0",@"8|warp|135|1,1",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[141] = @[
    // Tiles
    @"9",@"10",@"10|block|30",
    @"39",@"33",@"39",
    @"36",@"39",@"36",
    // Walls
    @"99",@"5|event|gateNephtaline",@"99",@"99",@"99",@"99",
    // Steps
    @"8|warp|140|1,1",@"0",@"0",@"8|warp|137|1,-1",@"0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[142] = @[
    // Tiles
    @"10",@"9",@"10|block|30",
    @"39",@"33",@"39",
    @"36",@"39",@"36",
    // Walls
    @"19",@"5|event|gateNeomine",@"99",@"99",@"99|event|gatePhotoBooth",@"99",
    // Steps
    @"0",@"8|warp|139|0,1",@"0",@"0",@"8|warp|136|1,0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[143] = @[
    // Tiles
    @"10",@"10",@"9|block|30",
    @"39",@"33",@"39",
    @"36",@"39",@"36",
    // Walls
    @"99",@"5|event|gateNemedique",@"99",@"99",@"99",@"99",
    // Steps
    @"0",@"0",@"3|warp|138|-1,1",@"0",@"0",@"8|warp|135|1,1",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[144] = @[
    // Tiles
    @"36",@"39",@"3|event|nastazieNastazie2|35|r",
    @"39",@"28",@"39",
    @"36",@"39",@"36",
    // Walls
    @"99",@"99",@"99",@"99",@"99",@"99",
    // Steps
    @"0",@"0",@"0",@"0",@"8|warp|141|1,0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[145] = @[
    // Tiles
    @"36",@"39",@"36|event|nastazieNephtaline3|3|r",
    @"39",@"28",@"39",
    @"36",@"39",@"36",
    // Walls
    @"99",@"99",@"99",@"99",@"99",@"99",
    // Steps
    @"0",@"0",@"0",@"0",@"8|warp|142|1,0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[146] = @[
    // Tiles
    @"36",@"39",@"36|event|nastazieNeomine3|4|l",
    @"39",@"28",@"39",
    @"36",@"39",@"36",
    // Walls
    @"99",@"99",@"99",@"99",@"99",@"99",
    // Steps
    @"0",@"0",@"0",@"0",@"8|warp|143|1,0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Black",audioNastazie];

    worldNode[147] = @[
    // Tiles
    @"101",@"39",@"101",
    @"1",@"1",@"1|event|pillar|15|l",
    @"101",@"39",@"101",
    // Walls
    @"99",@"99",@"99",@"99",@"100",@"99",
    // Steps
    @"0",@"8|warp|130|0,1",@"0",@"0",@"0",@"0",
    // Name,Background,Audio
    @"Baba Castle Lobby",@"Red",audioGlitch];

}


@end
