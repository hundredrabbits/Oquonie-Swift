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
	NSLog(@"move: %d %d",posX,posY);
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
