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
					@"wall.1",@"wall.2",@"wall.3",@"1",@"wall.2",@"door.1",@"wall.1",
					nil];
	worldNode[2] = [NSArray arrayWithObjects:
					@"1",@"2",@"4",
					@"1",@"4",@"4",
					@"1",@"2",@"4",
					@"door.1",@"wall.1",@"wall.3",@"1",@"wall.3",@"door.1",@"wall.3",
					nil];
	worldNode[3] = [NSArray arrayWithObjects:
					@"6",@"9",@"9",
					@"6",@"5",@"5",
					@"6",@"9",@"9",
					@"",@"",@"",@"1",@"",@"gate.char2.1",@"",
					nil];
	worldNode[4] = [NSArray arrayWithObjects:
					@"4",@"6",@"4",
					@"5",@"4",@"4",
					@"5",@"9",@"9",
					@"wall.1",@"wall.1",@"wall.1",@"1",@"door.1",@"wall.1",@"wall.1",
					nil];
	worldNode[5] = [NSArray arrayWithObjects:
					@"1",@"1",@"1",
					@"1",@"4",@"1",
					@"1",@"1",@"1",
					@"wall.1",@"wall.1",@"wall.1",@"1",@"wall.1",@"wall.1",@"wall.1",
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
	
	worldEvent[1][0] = [NSArray arrayWithObjects: @"1",@"-1",@"blocker.1", @"Cond ",@"", nil]; // table
	worldEvent[1][1] = [NSArray arrayWithObjects: @"0",@"2",@"none", @"",@"2", nil]; // Door to 2
	
	worldEvent[2][0] = [NSArray arrayWithObjects: @"1",	@"1",	@"blocker.2",	@"1",		@"", nil];
	worldEvent[2][1] = [NSArray arrayWithObjects: @"0",	@"-2",	@"step.1.l",	@"",		@"1", nil]; // Door to 1
	worldEvent[2][2] = [NSArray arrayWithObjects: @"2",	@"-1",	@"none",		@"",		@"3", nil]; // Door to 3
	worldEvent[2][3] = [NSArray arrayWithObjects: @"-1",@"1",	@"blocker.2",	@"1",		@"", nil];
	worldEvent[2][4] = [NSArray arrayWithObjects: @"0",	@"2",	@"none",		@"char1",	@"5", nil]; // Door to 5, must be 1
	worldEvent[2][5] = [NSArray arrayWithObjects: @"-1",@"-1",	@"blocker.1",	@"",		@"", nil];
	
	worldEvent[3][0] = [NSArray arrayWithObjects: @"-2",@"-1",@"none", @"",@"2", nil];
	worldEvent[3][1] = [NSArray arrayWithObjects: @"-2",@"-1",@"step.1.r", @"",@"1", nil]; // Door to 2
	worldEvent[3][2] = [NSArray arrayWithObjects: @"1",@"-2",@"step.1.l", @"",@"4", nil]; // Door to 4
//	worldEvent[3][3] = [NSArray arrayWithObjects: @"0",@"0",@"blocker.1", @"",@"", nil];
	
	worldEvent[4][0] = [NSArray arrayWithObjects: @"-2",@"-1",@"none", @"",@"", nil];
	worldEvent[4][1] = [NSArray arrayWithObjects: @"1",@"2",@"none", @"",@"3", nil]; // init
	worldEvent[4][2] = [NSArray arrayWithObjects: @"0",@"1",@"blocker.2", @"",@"", nil]; // init
	
	worldEvent[5][0] = [NSArray arrayWithObjects: @"0",	@"-2",	@"step.1.l",	@"",@"2", nil]; // Door to 1
	worldEvent[5][1] = [NSArray arrayWithObjects: @"0",	@"0",	@"none",	@"",@"4", nil]; // Teleport to 1
	
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
	
	if( ![worldEvent[userLocation][0][2] isEqual:@""] ){
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