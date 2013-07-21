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
	self.floor00.frame = [self tileLocation:0 :0 :0];
	self.floor1e.frame = [self tileLocation:0 :-1 :1];
	self.floore1.frame = [self tileLocation:0 :1 :-1];
	
	self.floor10.frame = [self tileLocation:0 :1 :0];
	self.floor01.frame = [self tileLocation:0 :0 :1];
	
	self.floor0e.frame = [self tileLocation:0 :0 :-1];
	self.floore0.frame = [self tileLocation:0 :-1 :0];
	
	self.floor11.frame = [self tileLocation:0 :1 :1];
	self.flooree.frame = [self tileLocation:0 :-1 :-1];
	
	// Set player sprite size at origin
	
	self.userPlayer.frame = [self tileLocation:1 :0 :0];
}



- (void) moveRouter :(int)posX :(int)posY
{
	if( (userPositionX+posX) >= -1 && (userPositionX+posX) <= 1 ){ userPositionX += posX; }
	if( (userPositionY+posY) >= -1 && (userPositionY+posY) <= 1 ){ userPositionY += posY; }
	
	[UIView beginAnimations: @"Fade In" context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationDelay:0];
	self.userPlayer.frame = [self tileLocation:1:userPositionX:userPositionY];
	[UIView commitAnimations];
	
	NSLog(@"Moved: %d %d",userPositionX, userPositionY);	
}



- (CGRect) tileLocation :(int)type :(int)posX :(int)posY
{
	screen = [[UIScreen mainScreen] bounds];
	screenMargin = screen.size.width/10;
	int viewWidth = screen.size.width - (2*screenMargin);
	int tileW = viewWidth/3;
	int tileH = tileW * 0.5;
	int centerW = (screen.size.width/2)-(tileW/2);
	int centerH = (screen.size.height/2)-(tileH/2);
	
	if( type == 1 ){
//		tileH = tileW+;
//		centerH -= tileH;
		centerH -= tileH;
//		tileH += tileH*0.5;
	}
	
	
	if( posX == 0 && posY == 0 ){ return CGRectMake(centerW, centerH, tileW, tileH); }
	if( posX == 1 && posY ==-1 ){ return CGRectMake(centerW-tileW, centerH, tileW, tileH); }
	if( posX ==-1 && posY == 1 ){ return CGRectMake(centerW+tileW, centerH, tileW, tileH); }
	if( posX == 1 && posY == 0 ){ return CGRectMake(centerW-(tileW/2), centerH-(tileH/2), tileW, tileH); }
	if( posX == 0 && posY == 1 ){ return CGRectMake(centerW+(tileW/2), centerH-(tileH/2), tileW, tileH); }
	if( posX == 0 && posY ==-1 ){ return CGRectMake(centerW-(tileW/2), centerH+(tileH/2), tileW, tileH); }
	if( posX ==-1 && posY == 0 ){ return CGRectMake(centerW+(tileW/2), centerH+(tileH/2), tileW, tileH); }
	if( posX ==-1 && posY ==-1 ){ return CGRectMake(centerW, centerH+tileH, tileW, tileH);}
	if( posX == 1 && posY == 1 ){ return CGRectMake(centerW, centerH-tileH, tileW, tileH); }
	
	NSLog(@"error");
	
	
	return CGRectMake(0, 0, 100, 100);
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
