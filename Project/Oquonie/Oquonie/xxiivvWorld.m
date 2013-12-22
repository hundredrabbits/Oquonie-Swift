//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvWorld.h"
#import "xxiivvEvents.h"

@implementation xxiivvViewController (world)

- (void) worldStart
{
	worldNode = [NSMutableArray arrayWithObjects:@"",nil];
	int myCount = 0;
	while ( myCount < 10 )	{ myCount++; worldNode[myCount] = [NSArray arrayWithObjects: @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", nil];	}
	
	// Event : @"1|event|test|7|l"
	// Block : @"6|block|5"
	// Warp  : @"11|warp|2|0,-1"
	
	// =======================
	// @ Hub Oquonie
	// =======================
	worldNode[1] = [NSArray arrayWithObjects:
		// Tiles
		@"0",@"2",@"2|block|10",
		@"2",@"8",@"4",
		@"2",@"2",@"2",
		// Walls
		@"0",@"15|warp|5|0,0",@"2",@"2",@"12|warp|2|0,-1",@"2",
		// Steps
		@"0",@"0",@"0",@"0",@"0",@"0",
		// Name,Background,Audio
		@"Lobby Entrance",@"White",@"lobby",
	nil];

	worldNode[2] = [NSArray arrayWithObjects:
		// Tiles
		@"1",@"4",@"1",
		@"6",@"5",@"1|event|tip1|7|l",
		@"1",@"1",@"1",
		// Walls
		@"16",@"12|warp|3|-1,0",@"19",@"25",@"25",@"25",
		// Steps
		@"0",@"7|warp|1|0,1",@"0",@"0",@"0",@"0",
		// Name,Background,Audio
		@"Lobby Fork I",@"White",@"lobby",
	nil];

	worldNode[3] = [NSArray arrayWithObjects:
		// Tiles
		@"1",@"11",@"1|event|tip2|1|r",
		@"6",@"5",@"1",
		@"1|block|1",@"4",@"1",
		// Walls
		@"1",@"9|port|10|-1,0,5",@"1",@"1",@"1",@"1",
		// Steps
		@"0",@"7|warp|4|0,1",@"0",@"0",@"7|warp|2|1,0",@"0",
		// Name,Background,Audio
		@"Lobby House Room",@"White",@"lobby",
	nil];

	worldNode[4] = [NSArray arrayWithObjects:
		// Tiles
		@"1|event|wizard1|9|r",@"6",@"1",
		@"5",@"5|block|9",@"6",
		@"1",@"6",@"1",
		// Walls
		@"1",@"16",@"1",@"1",@"12|warp|3|0,-1",@"1",
		// Steps
		@"0",@"0",@"0",@"0",@"7|warp|5|1,0",@"0",
		// Name,Background,Audio
		@"Lobby House Room",@"White",@"lobby",
	nil];

	worldNode[5] = [NSArray arrayWithObjects:
		// Tiles
		@"9",@"10",@"9",
		@"4",@"5",@"14",
		@"9",@"6",@"9",
		// Walls
		@"3",@"14|warp|4|-1,0",@"3",@"3",@"4|port|10|0,-1,1",@"3",
		// Steps
		@"0",@"7|warp|9|0,1",@"0",@"0",@"7|warp|6|1,0",@"0",
		// Name,Background,Audio
		@"Lobby Fork II",@"White",@"lobby",
	nil];

	worldNode[6] = [NSArray arrayWithObjects:
		// Tiles
		@"9",@"4",@"9|block|5",
		@"10",@"5",@"6",
		@"9",@"10",@"9|event|tip3|8|l",
		// Walls
		@"3",@"13|warp|5|-1,0",@"3",@"26",@"13|warp|7|0,-1",@"26",
		// Steps
		@"0",@"0",@"0",@"0",@"0",@"0",
		// Name,Background,Audio
		@"Lobby Turn",@"White",@"lobby",
	nil];

	worldNode[7] = [NSArray arrayWithObjects:
		// Tiles
		@"9",@"10|block|11",@"0",
		@"4",@"5",@"12",
		@"9",@"0",@"0",
		// Walls
		@"19",@"0",@"0",@"0",@"8|port|9|0,-1,3",@"0",
		// Steps
		@"0",@"7|warp|6|0,1",@"0",@"0",@"0",@"0",
		// Name,Background,Audio
		@"Lobby Fork III",@"White",@"lobby",
	nil];
	
	worldNode[8] = [NSArray arrayWithObjects:
		// Tiles
		@"9",@"10",@"0",
		@"4",@"5",@"12",
		@"9",@"0",@"0",
		// Walls
		@"0",@"0",@"0",@"0",@"8|warp|9|0,-1",@"0",
		// Steps
		@"0",@"7|warp|6|0,1",@"0",@"0",@"0",@"0",
		// Name,Background,Audio
		@"Lobby Fork III",@"White",@"lobby",
	nil];
	
	worldNode[9] = [NSArray arrayWithObjects:
		// Tiles
		@"10",@"15",@"10|event|colours1|10|l",
		@"9",@"4",@"5",
		@"0",@"10",@"10",
		// Walls
		@"18",@"5|port|9|0,-1,4",@"18",@"3",@"13|warp|5|0,-1",@"3",
		// Steps
		@"0",@"0",@"0",@"0",@"0",@"0",
		// Name,Background,Audio
		@"Lobby Fork III",@"White",@"lobby",
	nil];
	
	// =======================
	// @ Hub Oquonie
	// =======================
	
	worldNode[10] = [NSArray arrayWithObjects:
		// Tiles
		@"3",@"3",@"6",
		@"14",@"4",@"5",
		@"3",@"3",@"3",
		// Walls
		@"3",@"3",@"3",@"13|warp|12|1,-1",@"3",@"3",
		// Steps
		@"0",@"7|warp|5|0,1",@"0",@"0",@"0",@"0",
		// Name,Background,Audio
		@"Lobby Fork III",@"White",@"lobby",
	nil];

	worldNode[11] = [NSArray arrayWithObjects:
					
					 nil];
	
	worldNode[12] = [NSArray arrayWithObjects:
					 // Tiles
					 @"4",@"5",@"6",
					 @"6",@"3|event|wizard1|2|l",@"3",
					 @"5",@"4",@"6",
					 // Walls
					 @"3",@"3",@"13|warp|13|-1,1",@"2",@"5|port|13|-1,1,2",@"2",
					 // Steps
					 @"7|warp|10|1,1",@"0",@"0",@"0",@"0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	
	worldNode[13] = [NSArray arrayWithObjects:
					 // Tiles
					 @"4",@"5",@"5",
					 @"6",@"0|block|9",@"4",
					 @"5",@"4",@"6",
					 // Walls
					 @"3",@"16",@"3",@"3",@"15",@"3",
					 // Steps
					 @"0",@"7|warp|14|0,1",@"0",@"0",@"0",@"7|warp|12|1,1",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	
	worldNode[14] = [NSArray arrayWithObjects:
					 // Tiles
					 @"0",@"5",@"5|event|wizard2|2|l",
					 @"0",@"16",@"4",
					 @"0",@"0",@"0",
					 // Walls
					 @"0",@"13|warp|15|-1,0",@"3",@"3",@"11|warp|13|0,-1",@"0",
					 // Steps
					 @"0",@"0",@"0",@"0",@"0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	
	worldNode[15] = [NSArray arrayWithObjects:
					 // Tiles
					 @"0",@"0",@"0",
					 @"0",@"18",@"4",
					 @"0",@"5",@"5|block|4",
					 // Walls
					 @"0",@"0",@"0",@"0",@"12|warp|16|0,-1",@"3",
					 // Steps
					 @"0",@"0",@"0",@"0",@"7|warp|14|1,0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	
	worldNode[16] = [NSArray arrayWithObjects:
					 // Tiles
					 @"0",@"0",@"0",
					 @"4",@"19",@"0",
					 @"5",@"5",@"0",
					 // Walls
					 @"0",@"0",@"0",@"0",@"0",@"0",
					 // Steps
					 @"0",@"7|warp|15|0,1",@"0",@"0",@"7|warp|17|1,0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	worldNode[17] = [NSArray arrayWithObjects:
					 // Tiles
					 @"5",@"5",@"0",
					 @"4",@"17",@"0",
					 @"0",@"0",@"0",
					 // Walls
					 @"3",@"13|warp|16|-1,0",@"0",@"0",@"0",@"0",
					 // Steps
					 @"0",@"7|warp|18|0,1",@"0",@"0",@"0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	worldNode[18] = [NSArray arrayWithObjects:
					 // Tiles
					 @"0",@"5",@"5",
					 @"0",@"16",@"4",
					 @"0",@"0",@"0",
					 // Walls
					 @"0",@"13|warp|19|-1,0",@"3",@"3",@"13|warp|15|-1,0",@"0",
					 // Steps
					 @"0",@"0",@"0",@"0",@"0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	worldNode[19] = [NSArray arrayWithObjects:
					 // Tiles
					 @"0",@"0",@"0",
					 @"0",@"18",@"4",
					 @"0",@"5",@"5",
					 // Walls
					 @"0",@"0",@"0",@"0",@"12|warp|20|0,-1",@"3",
					 // Steps
					 @"0",@"0",@"0",@"0",@"7|warp|14|1,0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	worldNode[20] = [NSArray arrayWithObjects:
					 // Tiles
					 @"0",@"0",@"0",
					 @"4",@"17",@"0",
					 @"5",@"5",@"0",
					 // Walls
					 @"0",@"0",@"0",@"0",@"0",@"0",
					 // Steps
					 @"0",@"7|warp|21|0,1",@"0",@"0",@"7|warp|17|1,0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	worldNode[21] = [NSArray arrayWithObjects:
					 // Tiles
					 @"3|event|wizard3|4|r",@"4|block|13",@"3",
					 @"4",@"10",@"5",
					 @"3",@"5",@"3",
					 // Walls
					 @"3",@"3",@"3",@"3",@"13|warp|16|0,-1",@"3",
					 // Steps
					 @"0",@"7|warp|22|0,1",@"0",@"0",@"7|warp|23|1,0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	worldNode[22] = [NSArray arrayWithObjects:
					 // Tiles
					 @"0",@"0",@"0",
					 @"4",@"10",@"5",
					 @"0",@"5",@"0",
					 // Walls
					 @"0",@"0",@"0",@"3",@"13|warp|21|0,-1",@"3",
					 // Steps
					 @"0",@"7|warp|25|0,1",@"0",@"0",@"7|warp|24|1,0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	worldNode[23] = [NSArray arrayWithObjects:
					 // Tiles
					 @"0",@"5",@"0",
					 @"4",@"10",@"0",
					 @"0",@"5",@"0",
					 // Walls
					 @"3",@"13|warp|21|-1,0",@"3",@"0",@"0",@"0",
					 // Steps
					 @"0",@"7|warp|24|0,1",@"0",@"0",@"7|warp|26|1,0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	worldNode[24] = [NSArray arrayWithObjects:
					 // Tiles
					 @"0",@"5",@"0",
					 @"4",@"10",@"5",
					 @"0",@"5",@"0",
					 // Walls
					 @"0",@"13|warp|22|-1,0",@"0",@"0",@"13|warp|23|0,-1",@"0",
					 // Steps
					 @"0",@"7|warp|28|0,1",@"0",@"0",@"7|warp|29|1,0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	worldNode[25] = [NSArray arrayWithObjects:
					 // Tiles
					 @"0",@"0",@"0",
					 @"4",@"10",@"5",
					 @"0",@"5",@"0",
					 // Walls
					 @"0",@"0",@"0",@"0",@"13|warp|22|0,-1",@"0",
					 // Steps
					 @"0",@"7|warp|27|0,1",@"0",@"0",@"7|warp|28|1,0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	worldNode[26] = [NSArray arrayWithObjects:
					 // Tiles
					 @"0",@"5",@"0",
					 @"4",@"10",@"0",
					 @"0",@"5",@"0",
					 // Walls
					 @"0",@"13|warp|23|-1,0",@"0",@"0",@"0",@"0",
					 // Steps
					 @"0",@"7|warp|29|0,1",@"0",@"0",@"7|warp|30|1,0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	worldNode[27] = [NSArray arrayWithObjects:
					 // Tiles
					 @"0",@"0",@"0",
					 @"0",@"10",@"5",
					 @"0",@"1",@"0",
					 // Walls
					 @"0",@"0",@"0",@"0",@"13|warp|25|0,-1",@"0",
					 // Steps
					 @"0",@"0",@"0",@"0",@"3|warp|31|1,0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	worldNode[28] = [NSArray arrayWithObjects:
					 // Tiles
					 @"0",@"5",@"0",
					 @"0",@"10",@"5",
					 @"0",@"0",@"0",
					 // Walls
					 @"0",@"13|warp|25|-1,0",@"0",@"0",@"13|warp|24|0,-1",@"0",
					 // Steps
					 @"0",@"0",@"0",@"0",@"0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	worldNode[29] = [NSArray arrayWithObjects:
					 // Tiles
					 @"0",@"5",@"0",
					 @"0",@"10",@"5",
					 @"0",@"0",@"0",
					 // Walls
					 @"0",@"13|warp|24|-1,0",@"0",@"0",@"13|warp|26|0,-1",@"0",
					 // Steps
					 @"0",@"0",@"0",@"0",@"0",@"0",
					 // Name,Background,Audio
					 @"Necomedre Fork",@"White",@"lobby",
					 nil];
	worldNode[30] = [NSArray arrayWithObjects:
		 // Tiles
		 @"0",@"5",@"0",
		 @"0",@"10",@"0",
		 @"0",@"5",@"0",
		 // Walls
		 @"0",@"13|warp|26|-1,0",@"0",@"0",@"0",@"0",
		 // Steps
		 @"0",@"0",@"0",@"0",@"0",@"0",
		 // Name,Background,Audio
		 @"Necomedre Fork",@"White",@"lobby",
		 nil];
	
	worldNode[31] = [NSArray arrayWithObjects:
		// Tiles
		@"0",@"1",@"1|event|spell_test|3|l",
		@"0",@"9",@"12",
		@"0",@"1",@"1",
		// Walls
		@"0",@"14|warp|27|-1,0",@"25",@"19",@"8",@"19",
		// Steps
		@"0",@"0",@"0",@"0",@"0",@"0",
		// Name,Background,Audio
		@"Necomedre Fork",@"White",@"lobby",
		nil];
	worldNode[32] = [NSArray arrayWithObjects:
		 // Tiles
		 @"1",@"1",@"1",
		 @"1",@"9",@"1",
		 @"1",@"1",@"1",
		 // Walls
		 @"25",@"14",@"25",@"25",@"14",@"25",
		 // Steps
		 @"0",@"3",@"0",@"0",@"3",@"0",
		 // Name,Background,Audio
		 @"Necomedre Fork",@"White",@"lobby",
		 nil];
	worldNode[33] = [NSArray arrayWithObjects:
		 // Tiles
		 @"1",@"1",@"1",
		 @"1",@"9",@"1",
		 @"1",@"1",@"1",
		 // Walls
		 @"25",@"14",@"25",@"25",@"14",@"25",
		 // Steps
		 @"0",@"3",@"0",@"0",@"3",@"0",
		 // Name,Background,Audio
		 @"Necomedre Fork",@"White",@"lobby",
		 nil];
	worldNode[34] = [NSArray arrayWithObjects:
		 // Tiles
		 @"1",@"1",@"1",
		 @"1",@"9",@"1",
		 @"1",@"1",@"1",
		 // Walls
		 @"25",@"14",@"25",@"25",@"14",@"25",
		 // Steps
		 @"0",@"3",@"0",@"0",@"3",@"0",
		 // Name,Background,Audio
		 @"Necomedre Fork",@"White",@"lobby",
		 nil];
	worldNode[35] = [NSArray arrayWithObjects:
		 // Tiles
		 @"1",@"1",@"1",
		 @"1",@"9",@"1",
		 @"1",@"1",@"1",
		 // Walls
		 @"25",@"14",@"25",@"25",@"14",@"25",
		 // Steps
		 @"0",@"3",@"0",@"0",@"3",@"0",
		 // Name,Background,Audio
		 @"Necomedre Fork",@"White",@"lobby",
		 nil];
	
	
}

- (NSString*) tileParser :(NSString*)tileString :(int)index {
		
	NSArray* array = [tileString componentsSeparatedByString: @"|"];
	if( [array count] < (index+1) && index > 0 ){
		return 0;
	}
	NSString* value = [array objectAtIndex: index];
	
	return value;
}

- (void) roomStart
{
	NSLog(@">  ROOM | Load         * Node.%d - %@", userLocation, worldNode[userLocation][21]);
	
	[self roomCleanSprites];
	[self roomCleanNotifications];
	[self roomGenerateTiles];
	[self roomGenerateBlockers];
	[self roomGenerateEvents];
	[self roomGenerateNotifications];
	[self roomGenerateAudioTrack];
	
}

-(void)roomGenerateTiles {
	self.floor00.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][4]:0]] ];
	self.floor1e.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][8]:0]] ];
	self.floore1.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][0]:0]] ];
	self.floor10.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][1]:0]] ];
	self.floor01.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][5]:0]] ];
	self.floor0e.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][3]:0]] ];
	self.floore0.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][7]:0]] ];
	self.floor11.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][2]:0]] ];
	self.flooree.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][6]:0]] ];
	
	self.wall1l.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",[self tileParser:worldNode[userLocation][9]:0]] ];
	self.wall2l.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",[self tileParser:worldNode[userLocation][10]:0]] ];
	self.wall3l.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",[self tileParser:worldNode[userLocation][11]:0]] ];
	self.wall1r.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",[self tileParser:worldNode[userLocation][14]:0]] ];
	self.wall2r.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",[self tileParser:worldNode[userLocation][13]:0]] ];
	self.wall3r.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",[self tileParser:worldNode[userLocation][12]:0]] ];
	
	self.step1l.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.l.png",[self tileParser:worldNode[userLocation][15]:0]] ];
	self.step2l.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.l.png",[self tileParser:worldNode[userLocation][16]:0]] ];
	self.step3l.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.l.png",[self tileParser:worldNode[userLocation][17]:0]] ];
	self.step1r.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.r.png",[self tileParser:worldNode[userLocation][18]:0]] ];
	self.step2r.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.r.png",[self tileParser:worldNode[userLocation][19]:0]] ];
	self.step3r.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.r.png",[self tileParser:worldNode[userLocation][20]:0]] ];
}


-(void)roomGenerateBlockers {
	int tileId = 0;
	for (NSString *tile in worldNode[userLocation]) {
		if( [[self tileParser:tile :1] isEqualToString:@"block"] ){
			NSLog(@">  ROOM | Blockers     | Generate: #%@ x:%d y:%d", [self tileParser:tile :2], [self flattenTileId:tileId :@"x"], [self flattenTileId:tileId :@"y"] );
			UIImageView *newView = [[UIImageView alloc] initWithFrame:[self tileLocation:4 :[self flattenTileId:tileId :@"x"] :[self flattenTileId:tileId :@"y"]]];
			newView.tag = 300;
			newView.image = [UIImage imageNamed:[NSString stringWithFormat:@"blocker.%@.png",[self tileParser:tile :2]]];
			[self.view addSubview:newView];
		}
		tileId += 1;
	}
}

-(void)roomGenerateEvents {
	int tileId = 0;
	for (NSString *tile in worldNode[userLocation]) {
		if( [[self tileParser:tile :1] isEqualToString:@"event"] ){
			NSLog(@">  ROOM | Blockers     | Generate: #%@ x:%d y:%d", [self tileParser:tile :2], [self flattenTileId:tileId :@"x"], [self flattenTileId:tileId :@"y"] );
			UIImageView *newView = [[UIImageView alloc] initWithFrame:[self tileLocation:4 :[self flattenTileId:tileId :@"x"] :[self flattenTileId:tileId :@"y"]]];
			newView.tag = 300;
			newView.image = [UIImage imageNamed:[NSString stringWithFormat:@"event.%@.%@.png",[self tileParser:tile :3],[self tileParser:tile :4]]];
			[self.view addSubview:newView];
		}
		tileId += 1;
	}
}

-(void)roomGenerateNotifications {
	NSLog(@">  ROOM | Notification | Display");
	int tileId = -1; // ...
	for (NSString *tile in worldNode[userLocation]) {
		tileId += 1;
		// Skip if not an event
		if( ![[self tileParser:tile :1] isEqualToString:@"event"] ){ continue; }
		// Skip if has no notification
		NSString *eventSelector = [NSString stringWithFormat:@"event_%@:",[self tileParser:tile :2]];
		int hasNotification = [self performSelector:NSSelectorFromString(eventSelector) withObject:@"postNotification"];
		if(hasNotification<1){ continue; }
		// Notification
		NSLog(@"> NOTIF | Notification for event %@", [self tileParser:tile :2]); // TODOX
		UIImageView *newView = [[UIImageView alloc] initWithFrame:[self tileLocation:4 :[self flattenTileId:tileId :@"x"] :[self flattenTileId:tileId :@"y"]]];
		newView.tag = 400;
		newView.image = [UIImage imageNamed:[NSString stringWithFormat:@"notification.1.png"]];
		[self.view addSubview:newView];
		
	}
}

-(void)roomGenerateAudioTrack {
	if(![userAudioTrack isEqualToString:worldNode[userLocation][23] ]){
		NSLog(@">  ROOM | Audio:%@",worldNode[userLocation][23]);
		userAudioTrack = worldNode[userLocation][23];
	}
}

- (void) roomCleanSprites
{
	NSLog(@">  ROOM | Blockers     | Clean");
	for (UIView *subview in [self.view subviews]) {
		// Remove Sprites
		if(subview.tag == 300){
			[subview removeFromSuperview];
		}
	}
}

- (void) roomCleanNotifications
{
	NSLog(@">  ROOM | Notification | Clean ");
	for (UIView *subview in [self.view subviews]) {
		// Remove Notification
		if(subview.tag == 400){
			[subview removeFromSuperview];
		}
	}
}
@end