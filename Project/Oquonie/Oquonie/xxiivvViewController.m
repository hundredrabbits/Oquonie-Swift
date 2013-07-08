//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvViewController.h"

@interface xxiivvViewController ()

@end

@implementation xxiivvViewController

- (void)viewDidLoad { [super viewDidLoad]; [self start]; }

- (void)didReceiveMemoryWarning { [super didReceiveMemoryWarning]; }

- (void) start
{
	userPositionX = 0;
	userPositionY = 0;
}



- (void) moveRouter :(int)posX :(int)posY
{
	if( (userPositionX+posX) >= -1 && (userPositionX+posX) <= 1 ){ userPositionX += posX; }
	if( (userPositionY+posY) >= -1 && (userPositionY+posY) <= 1 ){ userPositionY += posY; }
	
	NSLog(@"Moved: %d %d",userPositionX, userPositionY);	
}




- (IBAction)moveTL:(id)sender {
	[self moveRouter:-1 :1];
}

- (IBAction)moveTR:(id)sender {
	[self moveRouter:1 :1];
}

- (IBAction)moveBL:(id)sender {
	[self moveRouter:-1 :-1];
}

- (IBAction)moveBR:(id)sender {
	[self moveRouter:1 :-1];
}





@end
