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
	
	[self templateStart];
	
	
}

- (void) templateStart
{
	screen = [[UIScreen mainScreen] bounds];
	screenMargin = screen.size.width/10;
	int viewWidth = screen.size.width - (2*screenMargin);
	int tileW = viewWidth/3;
	int tileH = tileW * 0.5;
	int centerW = (screen.size.width/2)-(tileW/2);
	int centerH = (screen.size.height/2)-(tileH/2);
	
	self.floor00.frame = CGRectMake(centerW, centerH, tileW, tileH);
	self.floor1e.frame = CGRectMake(centerW-tileW, centerH, tileW, tileH);
	self.floore1.frame = CGRectMake(centerW+tileW, centerH, tileW, tileH);
	
	self.floor10.frame = CGRectMake(centerW-(tileW/2), centerH-(tileH/2), tileW, tileH);
	self.floor01.frame = CGRectMake(centerW+(tileW/2), centerH-(tileH/2), tileW, tileH);
	
	self.floor0e.frame = CGRectMake(centerW-(tileW/2), centerH+(tileH/2), tileW, tileH);
	self.floore0.frame = CGRectMake(centerW+(tileW/2), centerH+(tileH/2), tileW, tileH);
	
	self.floor11.frame = CGRectMake(centerW, centerH+tileH, tileW, tileH);
	self.flooree.frame = CGRectMake(centerW, centerH-tileH, tileW, tileH);
}



- (void) moveRouter :(int)posX :(int)posY
{
	if( (userPositionX+posX) >= -1 && (userPositionX+posX) <= 1 ){ userPositionX += posX; }
	if( (userPositionY+posY) >= -1 && (userPositionY+posY) <= 1 ){ userPositionY += posY; }
	
	NSLog(@"Moved: %d %d",userPositionX, userPositionY);	
}


- (IBAction)moveTL:(id)sender {
	[self moveRouter:1 :0];
}

- (IBAction)moveTR:(id)sender {
	[self moveRouter:0 :1];
}

- (IBAction)moveBL:(id)sender {
	[self moveRouter:0 :-1];
}

- (IBAction)moveBR:(id)sender {
	[self moveRouter:-1 :0];
}





@end
