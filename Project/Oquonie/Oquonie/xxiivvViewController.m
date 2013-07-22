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
	userSpriteChar = @"char1";
	
	[self templateStart];
	
}

- (void) templateStart
{

	screen = [[UIScreen mainScreen] bounds];
	screenMargin = screen.size.width/10;
	
	self.moveTL.frame = CGRectMake(0, 0, screen.size.width/2, screen.size.height/2);
	self.moveTR.frame = CGRectMake(screen.size.width/2, 0, screen.size.width/2, screen.size.height/2);
	self.moveBL.frame = CGRectMake(0, screen.size.height/2, screen.size.width/2, screen.size.height/2);
	self.moveBR.frame = CGRectMake(screen.size.width/2, screen.size.height/2, screen.size.width/2, screen.size.height/2);
	
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



- (void) moveRouter :(int)posX :(int)posY :(UIButton *)sender
{
	if( (userPositionX+posX) >= -1 && (userPositionX+posX) <= 1 ){ userPositionX += posX; }
	if( (userPositionY+posY) >= -1 && (userPositionY+posY) <= 1 ){ userPositionY += posY; }
	
	if( (long)sender.tag == 0 ){ userSpriteOrientationHorizontal = @"l"; userSpriteOrientationVertical = @"b"; }
	if( (long)sender.tag == 1 ){ userSpriteOrientationHorizontal = @"r"; userSpriteOrientationVertical = @"b"; }
	if( (long)sender.tag == 2 ){ userSpriteOrientationHorizontal = @"l"; userSpriteOrientationVertical = @"f"; }
	if( (long)sender.tag == 3 ){ userSpriteOrientationHorizontal = @"r"; userSpriteOrientationVertical = @"f"; }
	
	[UIView beginAnimations: @"Fade In" context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDelay:0];
	self.userPlayer.frame = [self tileLocation:1:userPositionX:userPositionY];
	[UIView commitAnimations];
	
	[self moveAnimation];
}

- (void) moveAnimation
{
	userSpriteState = @"walk";
	self.userPlayerChar.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", [self userSpriteName:@"1"] ] ];
	[NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(animator1) userInfo:nil repeats:NO];
	[NSTimer scheduledTimerWithTimeInterval:0.30 target:self selector:@selector(animator2) userInfo:nil repeats:NO];
}


- (void) animator1
{
	userSpriteState = @"walk";
	self.userPlayerChar.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", [self userSpriteName:@"2"] ] ];
}

- (void) animator2
{
	userSpriteState = @"stand";
	self.userPlayerChar.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", [self userSpriteName:@"1"] ] ];
}





- (NSString *) userSpriteName :(NSString*) mod
{
	NSString *spriteName = @"";
	
	if( [userSpriteState isEqual:@"walk"] ){
		spriteName = [NSString stringWithFormat:@"%@.%@.%@.%@.%@.png", userSpriteChar, userSpriteState, userSpriteOrientationHorizontal, userSpriteOrientationVertical,mod];
	}
	else{
		spriteName = [NSString stringWithFormat:@"%@.%@.%@.%@.png", userSpriteChar, userSpriteState, userSpriteOrientationHorizontal, userSpriteOrientationVertical];
	}
	
	NSLog(@"%@",spriteName);

	return spriteName;
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
		tileH = tileH * 2;
		if( (posX + posY) == 1 ){ centerH -= tileH*0.25; }
		else if( (posX + posY) == 2 ){  }
		else if( (posX + posY) == -1 ){ centerH -= tileH*0.75; }
		else if( (posX + posY) == -2 ){ centerH -= tileH; }
		else{ centerH -= tileH*0.5; }
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
	[self moveRouter:1 :0 :sender];
}

- (IBAction)moveTR:(id)sender {
	[self moveRouter:0 :1 :sender];
}

- (IBAction)moveBL:(id)sender {
	[self moveRouter:0 :-1 :sender];
}

- (IBAction)moveBR:(id)sender {
	[self moveRouter:-1 :0 :sender];
}





@end
