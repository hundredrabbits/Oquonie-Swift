//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvViewController.h"
#import "xxiivvWorld.h"

@interface xxiivvViewController ()

@end

@implementation xxiivvViewController

- (void)viewDidLoad { [super viewDidLoad]; [self start]; }

- (void)didReceiveMemoryWarning { [super didReceiveMemoryWarning]; }

- (void) start
{
	[self userStart];
	
	[self templateStart];
	[self worldStart];
	[self eventStart];
	[self roomStart];
}


- (void) userStart
{
	userPositionX = 1;
	userPositionY = 0;
	userSpriteChar = @"char2";
	userLocation = 1;
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
	
	self.step1.frame = [self tileLocation:0 :0 :-2];
	self.step2.frame = [self tileLocation:0 :-2 :0];	
	
	self.wall1r.frame = [self wallLocation:@"R" :@"1"];
	self.wall2r.frame = [self wallLocation:@"R" :@"2"];
	self.wall3r.frame = [self wallLocation:@"R" :@"3"];
	
	self.wall1l.frame = [self wallLocation:@"L" :@"1"];
	self.wall2l.frame = [self wallLocation:@"L" :@"2"];
	self.wall3l.frame = [self wallLocation:@"L" :@"3"];

	self.blocker1.frame = [self tileLocation:1 :0 :0];
	
	self.beam.frame = [self wallLocation:@"C" :@"1"];
	
	self.userPlayerShadow.frame = CGRectMake(0, tileH, tileW, tileH);
	self.userPlayer.frame = [self tileLocation:1 :0 :0];
	
	self.userPlayerChat.hidden = YES;
	
	self.userPlayerChar.frame = CGRectMake(0, 0, self.userPlayer.frame.size.width, self.userPlayer.frame.size.height);
	
}



- (void) moveRouter :(int)posX :(int)posY :(UIButton *)sender
{
	int event = [self moveEvent:( userPositionX+posX ) :( userPositionY+posY )];
	
	if( (userPositionX+posX) >= -1 && (userPositionX+posX) <= 1 && event < 1){ userPositionX += posX; }
	if( (userPositionY+posY) >= -1 && (userPositionY+posY) <= 1 && event < 1 ){ userPositionY += posY; }
	
	if( (long)sender.tag == 0 ){ userSpriteOrientationHorizontal = @"l"; userSpriteOrientationVertical = @"b"; }
	if( (long)sender.tag == 1 ){ userSpriteOrientationHorizontal = @"r"; userSpriteOrientationVertical = @"b"; }
	if( (long)sender.tag == 2 ){ userSpriteOrientationHorizontal = @"l"; userSpriteOrientationVertical = @"f"; }
	if( (long)sender.tag == 3 ){ userSpriteOrientationHorizontal = @"r"; userSpriteOrientationVertical = @"f"; }
	
//	if( userPositionX ==  0 && userPositionY ==  1 && [[ worldNode[userLocation][14] substringToIndex:4] isEqual:@"door"] && sender.tag == 1 ){
//		[self moveDoor:[worldNode[userLocation][19] intValue]];
//		userPositionX = 0;
//		userPositionY = -1;
//		posX = 0;
//		posY = 0;
//		self.userPlayer.frame = [self tileLocation:1:userPositionX:userPositionY];
//	}
//	else if( userPositionX ==  1 && userPositionY ==  0 && [[ worldNode[userLocation][10] substringToIndex:4] isEqual:@"door"] && sender.tag == 0 ){
//		[self moveDoor:[worldNode[userLocation][18] intValue]];
//		userPositionX = -1;
//		userPositionY = 0;
//		posX = 0;
//		posY = 0;
//		self.userPlayer.frame = [self tileLocation:1:userPositionX:userPositionY];
//	}
//	else if( userPositionX ==  0 && userPositionY == -1 && [worldNode[userLocation][16] intValue] > 0 && sender.tag == 2 ){
//		[self moveDoor:[worldNode[userLocation][20] intValue]];
//		userPositionX = 0;
//		userPositionY = 1;
//		posX = 0;
//		posY = 0;
//		self.userPlayer.frame = [self tileLocation:1:userPositionX:userPositionY];
//	}
//	else if( userPositionX == -1 && userPositionY ==  0 && [worldNode[userLocation][17] intValue] > 0 && sender.tag == 3 ){
//		[self moveDoor:[worldNode[userLocation][21] intValue]];
//		userPositionX = 1;
//		userPositionY = 0;
//		posX = 0;
//		posY = 0;
//		self.userPlayer.frame = [self tileLocation:1:userPositionX:userPositionY];
//	}
//	else{
		[UIView beginAnimations: @"Fade In" context:nil];
		[UIView setAnimationDuration:0.3];
		[UIView setAnimationDelay:0];
		self.userPlayer.frame = [self tileLocation:1:userPositionX:userPositionY];
		[UIView commitAnimations];
		
		[UIView beginAnimations: @"Fade In" context:nil];
		[UIView setAnimationDuration:0.4];
		[UIView setAnimationDelay:0];
		self.userPlayerChat.frame = [self tileLocation:3:userPositionX:userPositionY];
		[UIView commitAnimations];
//	}
		
	[self moveDisable];
	[self moveAnimation];
	[self moveOrder];
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



- (void) moveEnable
{
	self.moveBL.hidden = NO;
	self.moveBR.hidden = NO;
	self.moveTL.hidden = NO;
	self.moveTL.hidden = NO;
}



- (void) moveDisable
{
	self.moveBL.hidden = YES;
	self.moveBR.hidden = YES;
	self.moveTL.hidden = YES;
	self.moveTL.hidden = YES;
	[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(moveEnable) userInfo:nil repeats:NO];
}




- (void) moveDoor :(int)destination
{
	userLocation = destination;
	[self roomStart];
	[self roomAnimation];
	
}


- (void) moveOrder
{
	userPositionZ = ( userPositionX + userPositionY );
	
	if( userPositionZ > 0 ){
		[self.view bringSubviewToFront:self.blocker1];
	}
	else{
		[self.view bringSubviewToFront:self.userPlayer];
	}
}



- (int) moveEvent :(int)posX :(int)posY
{
	NSLog(@"EVENT LOCATION: %d %d", posX, posY);
	
	for (NSArray *test in worldEvent[userLocation]) {
		
		if( [test[0] intValue] == posX && [test[1] intValue] == posY ){
			NSLog(@"event found");
			return 1;
		}
	}
	return 0;
}





- (void) roomAnimation
{
	for (UIView *subview in [self.view subviews]) {
		float delay = (arc4random()%30)+1;

		if (subview.tag == 100 || subview.tag == 200) {
			CGRect origin = subview.frame;
			subview.frame = CGRectOffset(subview.frame, 0, 5);
			subview.alpha = 0;
			[UIView beginAnimations: @"Fade In" context:nil];
			[UIView setAnimationDuration:(delay/50)];
			[UIView setAnimationDelay:0];
			subview.frame = origin;
			subview.alpha = 1;
			[UIView commitAnimations];
		}
	}
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
	
	return spriteName;
}













- (CGRect) tileLocation :(int)type :(int)posX :(int)posY
{
	screen = [[UIScreen mainScreen] bounds];
	screenMargin = screen.size.width/10;
	viewWidth = screen.size.width - (2*screenMargin);
	
	tileW = viewWidth/3;
	tileH = tileW * 0.5;
	
	int centerW = (screen.size.width/2)-(tileW/2);
	int centerH = (screen.size.height/2)-(tileH/2);
	
	if( type == 1 ){
		tileH = tileH * 2;
		if( (posX + posY) == 1 ){ centerH -= tileH*0.25; }
		else if( (posX + posY) == 2 ){  }
		else if( (posX + posY) == -1 ){ centerH -= tileH*0.75; }
		else if( (posX + posY) == -2 ){ centerH -= tileH; }
		else{ centerH -= tileH*0.5; }
		centerH -= tileH/15;
	}
	
	if( type == 2 ){
		tileH = tileH * 2;
		if( (posX + posY) == 1 ){ centerH -= tileH*0.25; }
		else if( (posX + posY) == 2 ){  }
		else if( (posX + posY) == -1 ){ centerH -= tileH*0.75; }
		else if( (posX + posY) == -2 ){ centerH -= tileH; }
		else{ centerH -= tileH*0.5; }
		centerH -= tileH/3;
		centerW += tileW/2;
	}
	
	if( type == 3 ){
		tileH = tileH * 2;
		if( (posX + posY) == 1 ){ centerH -= tileH*0.25; }
		else if( (posX + posY) == 2 ){  }
		else if( (posX + posY) == -1 ){ centerH -= tileH*0.75; }
		else if( (posX + posY) == -2 ){ centerH -= tileH; }
		else{ centerH -= tileH*0.5; }
		centerH -= tileH/15;
		centerH -= 200;
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
	if( posX == 0 && posY ==-2 ){ return CGRectMake(centerW-(tileW/2)*2, centerH+tileH, tileW, tileH); }
	if( posX ==-2 && posY == 0 ){ return CGRectMake(centerW+(tileW/2)*2, centerH+tileH, tileW, tileH); }
	
	NSLog(@"error");

	return CGRectMake(0, 0, 100, 100);
}


- (CGRect) wallLocation :(NSString*)tile :(NSString*)number
{
	screen = [[UIScreen mainScreen] bounds];
	screenMargin = screen.size.width/10;
	viewWidth = screen.size.width - (2*screenMargin);
	
	if( [tile isEqual:@"R"] && [number isEqual:@"1"] ){
		return CGRectMake( (screen.size.width/2), (screen.size.height/2)-(2.39*(viewWidth/3)), viewWidth/3, (viewWidth/3)*2);
	}
	if( [tile isEqual:@"R"] && [number isEqual:@"2"] ){
		return CGRectMake( (screen.size.width/2)+(viewWidth/6),(screen.size.height/2)-(2.14*(viewWidth/3)), viewWidth/3, (viewWidth/3)*2);
	}
	if( [tile isEqual:@"R"] && [number isEqual:@"3"] ){
		return CGRectMake( (screen.size.width/2)+(viewWidth/3), (screen.size.height/2)-(1.89*(viewWidth/3)), viewWidth/3, (viewWidth/3)*2);
	}
	
	if( [tile isEqual:@"L"] && [number isEqual:@"1"] ){
		return CGRectMake( (screen.size.width/2)-((viewWidth/3)*2), (screen.size.height/2)-(1.89*(viewWidth/3)), viewWidth/3, (viewWidth/3)*2);
	}
	if( [tile isEqual:@"L"] && [number isEqual:@"2"] ){
		return CGRectMake( (screen.size.width/2)-((viewWidth/3)*1.5), (screen.size.height/2)-(2.14*(viewWidth/3)), viewWidth/3, (viewWidth/3)*2);
	}
	if( [tile isEqual:@"L"] && [number isEqual:@"3"] ){
		return CGRectMake( (screen.size.width/2)-(viewWidth/3), (screen.size.height/2)-(2.39*(viewWidth/3)), viewWidth/3, (viewWidth/3)*2);
	}
	
	if( [tile isEqual:@"C"] && [number isEqual:@"1"] ){
		return CGRectMake( (screen.size.width/2)-((viewWidth/3)/2), (screen.size.height/2)-(2.39*(viewWidth/3)), viewWidth/3, (viewWidth/3)*2);
	}
	
	return CGRectMake(0, 0, 0, 0);
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
