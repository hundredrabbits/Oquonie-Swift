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
	while ( myCount < 150 )	{ myCount++; worldNode[myCount] = [NSArray arrayWithObjects: @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", nil];	}
	
	worldNode[1] = [NSArray arrayWithObjects:
					@"3",@"2",@"3",
					@"3",@"2",@"3",
					@"3",@"2",@"3",
					@"wall.1",@"wall.1",@"wall.1",@"1",@"wall.1",@"door.1",@"wall.1",
					nil];
	worldNode[2] = [NSArray arrayWithObjects:
					@"1",@"2",@"4",
					@"1",@"4",@"4",
					@"1",@"2",@"4",
					@"door.1",@"wall.1",@"wall.1",@"1",@"wall.1",@"wall.1",@"wall.1",
					nil];
	
	worldNode[3] = [NSArray arrayWithObjects:
					@"2",@"3",@"2",
					@"3",@"2",@"3",
					@"2",@"3",@"2",
					@"wall.1",@"wall.1",@"wall.1",@"1",@"wall.1",@"gate.char2.1",@"wall.1",
					nil];
	worldNode[4] = [NSArray arrayWithObjects:
					@"3",@"3",@"3",
					@"3",@"2",@"3",
					@"3",@"3",@"3",
					@"wall.1",@"wall.1",@"wall.1",@"1",@"door.1",@"wall.1",@"wall.1",
					nil];
	worldNode[5] = [NSArray arrayWithObjects:
					@"",@"4",@"",
					@"2",@"2",@"5",
					@"2",@"2",@"6",
					@"wall.2",@"gate.char2.1",@"wall.2",@"1",@"",@"door.1",@"",
					nil];
	worldNode[6] = [NSArray arrayWithObjects:
					@"4",@"4",@"4",
					@"4",@"4",@"",
					@"4",@"4",@"",
					@"",@"gate.char2.1",@"",@"1",@"",@"",@"",
					nil];
	worldNode[7] = [NSArray arrayWithObjects:
					@"4",@"4",@"4",
					@"4",@" ",@"5",
					@"4",@"5",@"6",
					@"",@"door.1",@"",@"1",@"",@"",@"",
					nil];
	worldNode[8] = [NSArray arrayWithObjects:
					@"5",@" ",@"4",
					@"4",@" ",@"5",
					@"4",@" ",@"6",
					@"",@"",@"",@"1",@"",@"door.1",@"",
					nil];
	worldNode[9] = [NSArray arrayWithObjects:
					@"3",@"3",@"3",
					@"3",@"3",@"3",
					@"3",@"3",@"3",
					@"wall.2",@"wall.2",@"wall.2",@"1",@"wall.2",@"wall.2",@"wall.2",
					nil];
	worldNode[10] = [NSArray arrayWithObjects:
					@"3",@"3",@"3",
					@"3",@"3",@"3",
					@"3",@"3",@"3",
					@"wall.2",@"wall.2",@"wall.2",@"1",@"wall.2",@"wall.2",@"wall.2",
					nil];
	worldNode[11] = [NSArray arrayWithObjects:
					@"3",@"3",@"3",
					@"3",@"3",@"3",
					@"3",@"3",@"3",
					@"wall.2",@"wall.2",@"wall.2",@"1",@"wall.2",@"wall.2",@"wall.2",
					nil];
	worldNode[12] = [NSArray arrayWithObjects:
					 @" ",@"4",@" ",
					 @"6",@"5",@"5",
					 @" ",@"4",@" ",
					 @"",@"",@"",@"1",@"",@"gate.char2.1",@"",
					 nil];
	worldNode[13] = [NSArray arrayWithObjects:
					 @" ",@"4",@" ",
					 @"6",@"5",@"5",
					 @" ",@"4",@" ",
					 @"",@"",@"",@"1",@"",@"gate.char2.1",@"",
					 nil];
	worldNode[14] = [NSArray arrayWithObjects:
					 @" ",@"4",@" ",
					 @"6",@"5",@"5",
					 @" ",@"4",@" ",
					 @"",@"",@"",@"1",@"",@"gate.char2.1",@"",
					 nil];
	worldNode[15] = [NSArray arrayWithObjects:
					 @" ",@" ",@" ",
					 @"6",@"5",@"5",
					 @" ",@" ",@" ",
					 @"",@"",@"",@"1",@"",@"door.1",@"",
					 nil];
	
}


- (void) worldUpdate
{
	
}



- (void) eventStart
{
	worldEvent = [NSMutableArray arrayWithObjects:@"",nil];
	int myCount = 0;
	while ( myCount < 150 )	{ myCount++; worldEvent[myCount] = [NSMutableArray arrayWithObjects: @"", nil];	}
	
	// 0 posX
	// 1 posY
	// 2 tile image
	// 3 dialog
	// 4 warp
	
	// ======================
	// @ Room 1-1-1 #1
	// ======================
	// Init
	worldEvent[1][0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	// Events
	[worldEvent[1] addObject:[NSArray arrayWithObjects: @"1",@"0",@"wizard3.r.f", @"1 ",@"", nil]];
	// Doors
	[worldEvent[1] addObject:[NSArray arrayWithObjects: @"0",@"2",@"none", @"",@"2", nil]]; 
	
	// ======================
	// @ Room 1-1-2 #2
	// ======================
	// Init
	worldEvent[2][0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	// Events
	[worldEvent[2] addObject:[NSArray arrayWithObjects: @"1",@"1",@"music.0.l", @"",@"", nil]];
	[worldEvent[2] addObject:[NSArray arrayWithObjects: @"0",@"1",@"blocker.0", @"",@"", nil]];
	// Doors
	[worldEvent[2] addObject:[NSArray arrayWithObjects: @"0",@"-2",@"step.1.l", @"",@"1", nil]];
	[worldEvent[2] addObject:[NSArray arrayWithObjects: @"2",@"-1",@"none", @"",@"3", nil]];
	
	// ======================
	// @ Room 1-1-3 #3
	// ======================
	// Init
	worldEvent[3][0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	// Blocker
	[worldEvent[3] addObject:[NSArray arrayWithObjects: @"1",@"1",@"tutorial.1", @"",@"", nil]];
	[worldEvent[3] addObject:[NSArray arrayWithObjects: @"-1",@"1",@"tutorial.1", @"",@"", nil]];
	// Events
	[worldEvent[3] addObject:[NSArray arrayWithObjects: @"1",@"0",@"blocker.0", @"",@"0", nil]];
	// Doors
	[worldEvent[3] addObject:[NSArray arrayWithObjects: @"-2",@"-1",@"step.1.r", @"",@"2", nil]];
	[worldEvent[3] addObject:[NSArray arrayWithObjects: @"1",@"-2",@"step.1.l", @"",@"4", nil]];
	[worldEvent[3] addObject:[NSArray arrayWithObjects: @"0",@"2",@"none", @"",@"5", nil]];
	
	// ======================
	// @ Room 1-1-4 #4
	// ======================
	// Init
	worldEvent[4][0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	// Blocker
	[worldEvent[4] addObject:[NSArray arrayWithObjects: @"0",@"0",@"blocker.1", @"",@"0", nil]];
	// Events
	[worldEvent[4] addObject:[NSArray arrayWithObjects: @"0",@"1",@"blocker.0", @"",@"0", nil]];
	// Doors
	[worldEvent[4] addObject:[NSArray arrayWithObjects: @"1",@"2",@"none", @"",@"3", nil]];
	
	// ======================
	// @ Room 1-2-1 #5
	// ======================
	// Init
	worldEvent[5][0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	// Blocker
	// Events
	[worldEvent[5] addObject:[NSArray arrayWithObjects: @"-1",@"1",@"blocker.0", @"",@"0", nil]];
	// Doors
	[worldEvent[5] addObject:[NSArray arrayWithObjects: @"0",@"-2",@"step.1.l", @"",@"3", nil]];
	[worldEvent[5] addObject:[NSArray arrayWithObjects: @"0",@"2",@"none", @"",@"6", nil]];
	[worldEvent[5] addObject:[NSArray arrayWithObjects: @"2",@"0",@"none", @"",@"12", nil]];
	
	// ======================
	// @ Room 1-2-2 #6
	// ======================
	// Init
	worldEvent[6][0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	// Blocker
	// Events
	[worldEvent[6] addObject:[NSArray arrayWithObjects: @"1",@"1",@"blocker.0", @"",@"0", nil]];
	// Doors
	[worldEvent[6] addObject:[NSArray arrayWithObjects: @"0",@"-2",@"step.1.l", @"",@"5", nil]];
	[worldEvent[6] addObject:[NSArray arrayWithObjects: @"0",@"2",@"none", @"",@"6", nil]];
	[worldEvent[6] addObject:[NSArray arrayWithObjects: @"2",@"0",@"none", @"",@"9", nil]];
	[worldEvent[6] addObject:[NSArray arrayWithObjects: @"-2",@"0",@"step.1.r", @"",@"7", nil]];
	
	// ======================
	// @ Room 1-2-3 #7
	// ======================
	// Init
	worldEvent[7][0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	// Blocker
	// Events
	[worldEvent[7] addObject:[NSArray arrayWithObjects: @"-1",@"1",@"blocker.0", @"",@"0", nil]];
	// Doors
	[worldEvent[7] addObject:[NSArray arrayWithObjects: @"0",@"-2",@"step.1.l", @"",@"8", nil]];
	[worldEvent[7] addObject:[NSArray arrayWithObjects: @"2",@"0",@"none", @"",@"6", nil]];
	
	// ======================
	// @ Room 1-2-4 #8
	// ======================
	// Init
	worldEvent[8][0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	// Blocker
	// Events
	[worldEvent[8] addObject:[NSArray arrayWithObjects: @"1",@"1",@"blocker.0", @"",@"8", nil]];
	[worldEvent[8] addObject:[NSArray arrayWithObjects: @"-1",@"-1",@"teleport.0", @"",@"8", nil]];
	[worldEvent[8] addObject:[NSArray arrayWithObjects: @"1",@"-1",@"blocker.0", @"",@"8", nil]];
	[worldEvent[8] addObject:[NSArray arrayWithObjects: @"-1",@"1",@"teleport.0", @"",@"8", nil]];
	// Doors
	[worldEvent[8] addObject:[NSArray arrayWithObjects: @"0",@"2",@"none", @"",@"7", nil]];
	
	// ======================
	// @ Room 1-3-1 #9
	// ======================
	// Init
	worldEvent[9][0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	// Blocker
	// Events
	// Doors
	[worldEvent[9] addObject:[NSArray arrayWithObjects: @"-2",@"0",@"step.1.r", @"",@"8", nil]];
	[worldEvent[9] addObject:[NSArray arrayWithObjects: @"0",@"-2",@"step.1.l", @"",@"12", nil]];
	
	// ======================
	// @ Room 1-3-2 #10
	// ======================
	// Init
	worldEvent[10][0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	// Blocker
	// Events
	// Doors
	
	// ======================
	// @ Room 1-3-3 #11
	// ======================
	// Init
	worldEvent[11][0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	// Blocker
	// Events
	// Doors
	
	// ======================
	// @ Room 1-3-4 #12
	// ======================
	// Init
	worldEvent[12][0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	// Blocker
	// Events
	// Doors
	[worldEvent[12] addObject:[NSArray arrayWithObjects: @"-2",@"0",@"step.1.r", @"",@"5", nil]];
	[worldEvent[12] addObject:[NSArray arrayWithObjects: @"0",@"-2",@"step.1.l", @"",@"13", nil]];
	[worldEvent[12] addObject:[NSArray arrayWithObjects: @"0",@"2",@"none", @"",@"9", nil]];
	
	// ======================
	// @ Room 1-4-1 #12
	// ======================
	// Init
	worldEvent[12][0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	// Blocker
	// Events
	// Doors
	
	[self eventDialogStart];
}



- (void) eventDialogStart
{
	worldEventDialog = [NSMutableArray arrayWithObjects:@"",nil];
	int myCount = 0;
	while ( myCount < 150 )	{ myCount++; worldEventDialog[myCount] = [NSMutableArray arrayWithObjects: @"", nil];	}
	
	worldEventDialog[0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	
	// if Necomedre
	// if Nephtaline
	// if Neomine
	// if Nestorine
	// if Nemedique
	
	worldEventDialog[1] = @[
		@[@"1", @"Debug"],
	    @[@"0", @"Yes",],
		@[@"0", @"Maybe",],
		@[@"1", @"Sister!"],
		@[@"0", @"No"],
		@[@"0", @"Absolutely not"]
	];
	
}

- (void) eventUpdate
{

}

- (void) roomStart
{
	[self roomClean];
	NSLog(@"> ROOM | Load %d",userLocation);
	
	self.floor00.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][4]] ];
	self.floor1e.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][8]] ];
	self.floore1.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][0]] ];
	self.floor10.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][1]] ];
	self.floor01.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][5]] ];
	self.floor0e.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][3]] ];
	self.floore0.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][7]] ];
	self.floor11.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][2]] ];
	self.flooree.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[userLocation][6]] ];
	self.wall1l.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.r.png",worldNode[userLocation][9]] ];
	self.wall2l.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.r.png",worldNode[userLocation][10]] ];
	self.wall3l.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.r.png",worldNode[userLocation][11]] ];
	self.beam.image   = [UIImage imageNamed:[NSString stringWithFormat:@"beam.%@.png",worldNode[userLocation][12]] ];
	self.wall1r.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.l.png",worldNode[userLocation][15]] ];
	self.wall2r.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.l.png",worldNode[userLocation][14]] ];
	self.wall3r.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.l.png",worldNode[userLocation][13]] ];
	
	// create events
	
	self.blocker1.hidden = YES;
	self.step1.hidden = YES;
	self.step2.hidden = YES;
	
	for (NSArray *test in worldEvent[userLocation]) {
		
		// Exceptions
		if( [test[2] isEqual:@""] || [[test[2] substringToIndex:4] isEqual:@"none"] ){
			continue;
		}
		
		// Steps
		else if( [[test[2] substringToIndex:4] isEqual:@"step"] ){
			
			if( [test[0] intValue] == -2 ){
				self.step2.hidden = NO;
				self.step2.frame = [self tileLocation:0 :[test[0] intValue] :[test[1] intValue]];
				self.step2.image  = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",test[2]] ];
			}
			if( [test[1] intValue] == -2 ){
				self.step1.hidden = NO;
				self.step1.frame = [self tileLocation:0 :[test[0] intValue] :[test[1] intValue]];
				self.step1.image  = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",test[2]] ];
			}
			
		}
		
		// Create Events
		
		else{
			int posX = [test[0] intValue];
			int posY = [test[1] intValue];

			UIScrollView *event = [[UIScrollView alloc] initWithFrame:[self tileLocation:4 :posX :posY]];
			[event setTag:300];

			UIImageView *sprite = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, event.frame.size.width, event.frame.size.height)];
			[sprite setContentMode:UIViewContentModeScaleAspectFill];
			[sprite setImage:[UIImage imageNamed: [NSString stringWithFormat:@"%@.png",test[2] ] ]];
			[sprite setTag:300];
			
			[event addSubview:sprite];

			[self.view addSubview:event];
		}
		
	}
	
	
}


- (void) roomClean
{
	NSLog(@"> ROOM | Clean ");
	for (UIView *subview in [self.view subviews]) {
		if(subview.tag == 300){
			[subview removeFromSuperview];
		}
	}
}

- (void) roomUpdate
{

	
}


@end