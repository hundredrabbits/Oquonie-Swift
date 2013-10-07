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
					@"3",@"2",@"7",
					@"wall.1",@"wall.1",@"wall.1",@"1",@"none",@"gate.char3.1",@"none",
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
					@"wall.1",@"wall.1",@"wall.1",@"1",@"wall.1",@"gate.char5.1",@"wall.1",
					nil];
	worldNode[4] = [NSArray arrayWithObjects:
					@"3",@"3",@"3",
					@"3",@"2",@"3",
					@"3",@"3",@"3",
					@"wall.1",@"wall.1",@"wall.1",@"1",@"door.1",@"wall.1",@"wall.1",
					nil];
	
}


- (void) worldUpdate
{
	
}



- (void) eventStart
{
	worldEvent = @[
	   @[],
	// ======================
	// @ Room 1-1-1 #1
	// ======================
	   @[
			@[@"1",@"0",@"npc.r.f", @"1 ",@""],
			@[@"0",@"2",@"none", @"",@"2"],
			@[@"0",@"2",@"none", @"",@"2"]
		],
	// ======================
	// @ Room 1-1-2 #2
	// ======================
		@[
			@[@"1",@"1",@"wizard4.l.f", @"",@""],
			@[@"0",@"1",@"wizard5.l.f", @"",@""],
			@[@"-1",@"1",@"npc2.l.f", @"",@""],
			@[@"0",@"-2",@"step.1.l", @"",@"1"],
			@[@"2",@"-1",@"none", @"",@"3"]
		],
	// ======================
	// @ Room 1-1-3 #3
	// ======================
		@[
		   @[@"1",@"1",@"npc.l.f", @"",@""],
		   @[@"-1",@"1",@"blocker.4", @"",@"1"]
		],
	// ======================
	// @ Room 1-1-3 #3
	// ======================
			@[],
	// ======================
	// @ Room 1-1-3 #3
	// ======================
			@[],
	// ======================
	// @ Room 1-1-3 #3
	// ======================
		@[]
	];
	
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
		@[@"0", @"ABCD"] // Dialog Test
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