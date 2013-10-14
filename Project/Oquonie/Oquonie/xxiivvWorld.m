//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvWorld.h"

@implementation xxiivvViewController (world)

- (void) worldStart
{
	worldNode = [NSMutableArray arrayWithObjects:@"",nil];
	int myCount = 0;
	while ( myCount < 10 )	{ myCount++; worldNode[myCount] = [NSArray arrayWithObjects: @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", nil];	}
	
	// Entrance
	worldNode[1] = [NSArray arrayWithObjects:
		// Tiles
		@"0",@"5",@"6|block|5",
		@"6",@"8",@"5",
		@"5",@"4",@"5",
		// Walls
		@"0",@"0",@"0",@"0",@"9|warp|2|0,-1",@"0",
		// Steps
		@"0",@"0",@"0",@"0",@"0",@"0",
		// Name,Background,Audio
		@"Lobby Entrance",@"White",@"Lobby",
	nil];
	
	// First Fork
	worldNode[2] = [NSArray arrayWithObjects:
		// Tiles
		@"0",@"5",@"0",
		@"6",@"6",@"4",
		@"0",@"0",@"0",
		// Walls
		@"1",@"12|warp|3|-1,0",@"1",@"0",@"10|warp|5|0,-1",@"0",
		// Steps
		@"0",@"1|warp|1|0,1",@"0",@"0",@"0",@"0",
		// Name,Background,Audio
		@"Lobby Fork I",@"White",@"Lobby",
	nil];
	
	// Tamie Lobby
	worldNode[3] = [NSArray arrayWithObjects:
		// Tiles
		@"1|event|9|r",@"1",@"1",
		@"1",@"2",@"2",
		@"1",@"2",@"1|block|4",
		// Walls
		@"1",@"2",@"2",@"2",@"11|warp|4|0,-1",@"1",
		// Steps
		@"0",@"0",@"0",@"0",@"1|warp|2|1,0",@"0",
		// Name,Background,Audio
		@"Lobby House Options",@"White",@"Lobby",
	nil];
	
	// Tamie Room
	worldNode[4] = [NSArray arrayWithObjects:
		// Tiles
		@"1",@"1",@"1",
		@"2",@"2",@"1|event|7|l",
		@"1",@"1",@"1",
		// Walls
		@"1",@"9",@"1",@"1",@"2",@"1",
		// Steps
		@"0",@"1|warp|3|0,1",@"0",@"0",@"0",@"0",
		// Name,Background,Audio
		@"Lobby House Room",@"White",@"Lobby",
	nil];
	
	// Hall Lobby
	worldNode[5] = [NSArray arrayWithObjects:
		// Tiles
		@"9",@"10",@"9",
		@"3",@"3",@"10",
		@"9",@"3",@"9",
		// Walls
		@"0",@"4",@"0",@"0",@"5",@"0",
		// Steps
		@"0",@"1|warp|2|0,1",@"0",@"0",@"1|warp|6|1,0",@"0",
		// Name,Background,Audio
		@"Lobby Fork II",@"White",@"Lobby",
	nil];
	
	// Hall Lobby
	worldNode[6] = [NSArray arrayWithObjects:
		// Tiles
		@"9",@"3",@"9|block|5",
		@"10",@"3",@"3",
		@"9",@"10",@"9|event|8|l",
		// Walls
		@"0",@"10|warp|5|-1,0",@"0",@"0",@"10|warp|7|0,-1",@"0",
		// Steps
		@"0",@"0",@"0",@"0",@"0",@"0",
		// Name,Background,Audio
		@"Lobby Turn",@"White",@"Lobby",
	nil];
	
	// Hall Lobby
	worldNode[7] = [NSArray arrayWithObjects:
		// Tiles
		@"0",@"1",@"0",
		@"1",@"1",@"1",
		@"0",@"0",@"0",
		// Walls
		@"0",@"7|warp|8|-1,0",@"0",@"0",@"8",@"0",
		// Steps
		@"0",@"1|warp|6|0,1",@"0",@"0",@"0",@"0",
		// Name,Background,Audio
		@"Lobby Fork III",@"White",@"Lobby",
	nil];
	
	// Hall Lobby
	worldNode[8] = [NSArray arrayWithObjects:
		// Tiles
		@"1",@"1",@"1",
		@"1",@"2",@"2",
		@"1",@"2",@"1",
		// Walls
		@"1",@"1",@"1",@"1",@"7|warp|6|1,1",@"1",
		// Steps
		@"0",@"0",@"0",@"0",@"1|warp|7|1,0",@"0",
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
	[self roomClean];
	[self roomGenerateBlockers];
	[self roomGenerateEvents];
	NSLog(@">  ROOM | Load: %@ - Node.%d",worldNode[userLocation][21], userLocation);
	
	[UIView beginAnimations: @"Fade In" context:nil];
	[UIView setAnimationDuration:0.3];
	self.userPlayerChar.alpha = 1;
	[UIView commitAnimations];
	
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
	NSLog(@">  ROOM | Blockers");
	int tileId = 0;
	for (NSString *tile in worldNode[userLocation]) {
		if( [[self tileParser:tile :1] isEqualToString:@"block"] ){
			NSLog(@"+   BLOCKER #%@ x:%d y:%d", [self tileParser:tile :2], [self flattenTileId:tileId :@"x"], [self flattenTileId:tileId :@"y"] );
			UIImageView *newView = [[UIImageView alloc] initWithFrame:[self tileLocation:4 :[self flattenTileId:tileId :@"x"] :[self flattenTileId:tileId :@"y"]]];
			newView.tag = 300;
			newView.image = [UIImage imageNamed:[NSString stringWithFormat:@"blocker.%@.png",[self tileParser:tile :2]]];
			[self.view addSubview:newView];
		}
		tileId += 1;
	}
}

-(void)roomGenerateEvents {
	NSLog(@">  ROOM | Events");
	int tileId = 0;
	for (NSString *tile in worldNode[userLocation]) {
		if( [[self tileParser:tile :1] isEqualToString:@"event"] ){
			NSLog(@"+   EVENT #%@ x:%d y:%d", [self tileParser:tile :2], [self flattenTileId:tileId :@"x"], [self flattenTileId:tileId :@"y"] );
			UIImageView *newView = [[UIImageView alloc] initWithFrame:[self tileLocation:4 :[self flattenTileId:tileId :@"x"] :[self flattenTileId:tileId :@"y"]]];
			newView.tag = 300;
			newView.image = [UIImage imageNamed:[NSString stringWithFormat:@"event.%@.%@.png",[self tileParser:tile :2],[self tileParser:tile :3]]];
			[self.view addSubview:newView];
		}
		tileId += 1;
	}
}

- (void) roomClean
{
	NSLog(@">  ROOM | Clean ");
	for (UIView *subview in [self.view subviews]) {
		if(subview.tag == 300){
			[subview removeFromSuperview];
		}
	}
}

@end