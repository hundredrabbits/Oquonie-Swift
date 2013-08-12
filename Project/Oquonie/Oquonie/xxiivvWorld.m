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
//	[worldEvent[1] addObject:[NSArray arrayWithObjects: @"1",@"-1",@"blocker.1", @"Cond ",@"", nil]];
	[worldEvent[1] addObject:[NSArray arrayWithObjects: @"1",@"0",@"blocker.0", @"Cond ",@"", nil]];
//	[worldEvent[1] addObject:[NSArray arrayWithObjects: @"-1",@"1",@"tutorial.1", @"Cond ",@"", nil]];
	// Doors
	[worldEvent[1] addObject:[NSArray arrayWithObjects: @"0",@"2",@"none", @"",@"2", nil]]; 
	
	// ======================
	// @ Room 1-1-2 #2
	// ======================
	// Init
	worldEvent[2][0] = [NSArray arrayWithObjects: @"",@"",@"", @" ",@"", nil];
	// Events
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
	[worldEvent[5] addObject:[NSArray arrayWithObjects: @"0",@"-2",@"step.1.l", @"",@"4", nil]];
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
	[worldEvent[8] addObject:[NSArray arrayWithObjects: @"-1",@"-1",@"blocker.0", @"",@"8", nil]];
	[worldEvent[8] addObject:[NSArray arrayWithObjects: @"1",@"-1",@"blocker.0", @"",@"8", nil]];
	[worldEvent[8] addObject:[NSArray arrayWithObjects: @"-1",@"1",@"blocker.0", @"",@"8", nil]];
	// Doors
	[worldEvent[8] addObject:[NSArray arrayWithObjects: @"0",@"2",@"none", @"",@"7", nil]];
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

			UIImageView *sprite = [[UIImageView alloc] initWithFrame:CGRectMake(0, event.frame.size.height-self.userPlayer.frame.size.height, self.userPlayer.frame.size.width, self.userPlayer.frame.size.height)];
			[sprite setContentMode:UIViewContentModeScaleAspectFill];
			[sprite setImage:[UIImage imageNamed: [NSString stringWithFormat:@"%@.png",test[2] ] ]];
			[sprite setTag:300];
			[event addSubview:sprite];
			
			if( [test[3] intValue] > 0 ){
				
				UIImageView *spell = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.userPlayer.frame.size.width, self.userPlayer.frame.size.width)];
				[spell setContentMode:UIViewContentModeScaleAspectFill];
				[spell setImage:[UIImage imageNamed: @"event.chat.png" ]];
				[spell setTag:310];
				[event addSubview:spell];
				
				CGRect origin = spell.frame;
				spell.frame = CGRectOffset(spell.frame, 0, 20);
				spell.alpha = 0;
				[UIView beginAnimations: @"Fade In" context:nil];
				[UIView setAnimationDuration:0.5];
				[UIView setAnimationDelay:1];
				spell.frame = origin;
				spell.alpha = 1;
				[UIView commitAnimations];
			}
			
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