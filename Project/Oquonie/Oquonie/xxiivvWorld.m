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
					@"1", @"1", nil];
	
}


- (void) worldUpdate
{

}


- (void) roomStart
{
	
	self.floor00.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[1][4]] ];
	self.floor1e.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[1][8]] ];
	self.floore1.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[1][0]] ];
	self.floor10.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[1][1]] ];
	self.floor01.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[1][5]] ];
	self.floor0e.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[1][3]] ];
	self.floore0.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[1][7]] ];
	self.floor11.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[1][2]] ];
	self.flooree.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",worldNode[1][6]] ];
	
	
	
}

- (void) roomUpdate
{

	
}


@end