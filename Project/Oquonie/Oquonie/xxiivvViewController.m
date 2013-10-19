//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvViewController.h"
#import "xxiivvWorld.h"
#import "xxiivvTemplates.h"
#import "xxiivvEvents.h"

@interface xxiivvViewController ()

@end

@implementation xxiivvViewController

-(void)viewDidLoad {
	[super viewDidLoad];
	[self start];
}

-(void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

# pragma mark Start -

-(void)start {
	
	[self userStart];
	
	[self templateStart];
	[self worldStart];
	[self roomStart];
	[self moveOrder];
}

# pragma mark User -

-(void)userStart {
	
	userPositionX = 0;
	userPositionY = 0;
	userSpriteChar = @"char2";
	userSpriteCharId = 5;
	userLocation = 1;
	userSpriteState = @"stand";
	userSpriteOrientationHorizontal = @"l";
	userSpriteOrientationVertical = @"f";
	
}

# pragma mark Move -

- (void) moveRouter :(int)posX :(int)posY :(UIButton *)sender
{
	NSLog(@"=====================");
	
	// Move disable timeout
	[self moveDisable];
	
	int blocker = [self moveEvent:( userPositionX+posX ) :( userPositionY+posY )];
	
	// Sprite face direction
	if( (long)sender.tag == 0 ){ userSpriteOrientationHorizontal = @"l"; userSpriteOrientationVertical = @"b"; }
	if( (long)sender.tag == 1 ){ userSpriteOrientationHorizontal = @"r"; userSpriteOrientationVertical = @"b"; }
	if( (long)sender.tag == 2 ){ userSpriteOrientationHorizontal = @"l"; userSpriteOrientationVertical = @"f"; }
	if( (long)sender.tag == 3 ){ userSpriteOrientationHorizontal = @"r"; userSpriteOrientationVertical = @"f"; }
		
	if( abs(userPositionX+posX) > 1 ){ blocker = 1; }
	if( abs(userPositionY+posY) > 1 ){ blocker = 1; }
	
	// Move if okay
	if(blocker == 0){
		// Update position
		userPositionX += posX;
		userPositionY += posY;
		[self moveEventCheck:(userPositionX) :(userPositionY)];
		[UIView beginAnimations: @"Fade In" context:nil];
		[UIView setAnimationDuration:0.3];
		[UIView setAnimationDelay:0];
		self.userPlayer.frame = [self tileLocation:4:userPositionX:userPositionY];
		[UIView commitAnimations];
		[self moveAnimation];
	}
	else{
		[self moveEventCheck:(userPositionX+posX) :(userPositionY+posY)];
		[self moveCollide:posX:posY];
	}
	[self moveOrder];
	
	
	[self roomCleanNotifications];
	[self roomGenerateNotifications];
	
	NSLog(@">  USER | Position: %d %d (%d)",userPositionX, userPositionY, [self flattenPosition:userPositionX :userPositionY]);
}

- (void) moveEventCheck :(int)userFuturePositionX :(int)userFuturePositionY {
	NSString *currentLocationString = worldNode[userLocation][[self flattenPosition:userFuturePositionX :userFuturePositionY]];
	NSString *currentLocationEventKey = [self tileParser:currentLocationString :1];
	NSString *currentLocationEventValue = [self tileParser:currentLocationString :2];
	NSString *currentLocationEventData = [self tileParser:currentLocationString :3];
	if( currentLocationEventKey ){
		[self eventRouter:currentLocationEventKey:currentLocationEventValue:currentLocationEventData];
	}
}


- (void) moveAnimation
{
	userSpriteState = @"walk";
	self.userPlayerChar.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", [self templateSpriteName:@"1"] ] ];
	[NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(animator1) userInfo:nil repeats:NO];
	[NSTimer scheduledTimerWithTimeInterval:0.30 target:self selector:@selector(animator2) userInfo:nil repeats:NO];
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
	// Look if tile is missing
	if( [worldNode[userLocation][[self flattenPosition:posX :posY]] intValue] == 0 ){
		NSLog(@"> EVENT | Blocked: %d %d (no ground)", posX, posY);
		[self moveCollide:posX:posY];
		return 1;
	}
	// Look if tile is a blocker
	if( [[self tileParser:worldNode[userLocation][[self flattenPosition:posX :posY]] :1] isEqualToString:@"block"] ){
		NSLog(@"> EVENT | Blocked: %d %d (blocker)", posX, posY);
		[self moveCollide:posX:posY];
		return 1;
	}
	// Look if tile is a event
	if( [[self tileParser:worldNode[userLocation][[self flattenPosition:posX :posY]] :1] isEqualToString:@"warp"] ){
		NSLog(@"> EVENT + Blocked: %d %d (warp)", posX, posY);
		[self moveCollide:posX:posY];
		return 1;
	}
	// Look if tile is a event
	if( [[self tileParser:worldNode[userLocation][[self flattenPosition:posX :posY]] :1] isEqualToString:@"event"] ){
		NSLog(@"> EVENT + Blocked: %d %d (event)", posX, posY);
		[self moveCollide:posX:posY];
		return 1;
	}
	
	return 0;
}

- (void) moveCollide :(int)posX :(int)posY
{
	for (UIView *subview in [self.view subviews]) {
		if( subview.tag == 300 ){
			CGRect origin = subview.frame;
			subview.frame = CGRectOffset(subview.frame, 0, -2);
			[UIView beginAnimations: @"Fade In" context:nil];
			[UIView setAnimationDuration:0.3];
			[UIView setAnimationDelay:0];
			subview.frame = origin;
			[UIView commitAnimations];
		}
	}
	self.userPlayerChar.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", [self templateSpriteName:@""] ] ];
	[self moveCollideAnimate:posX:posY];
}

-(void)moveCollideAnimate :(int)posX :(int)posY {
	CGRect userOrigin = self.userPlayer.frame;
	if( (posX == -1 && posY == 0) || (posX == 0 && posY == 1) ){ self.userPlayer.frame = CGRectOffset(self.userPlayer.frame, 2, 0); }
	if( (posX == 0 && posY == -1) || (posX == 1 && posY == 0) ){ self.userPlayer.frame = CGRectOffset(self.userPlayer.frame, -2, 0); }
	[UIView beginAnimations: @"Fade In" context:nil]; [UIView setAnimationDuration:0.3];
	self.userPlayer.frame = userOrigin;
	[UIView commitAnimations];
}

# pragma mark Speak -

-(void)eventSpeak:(NSString*)eventDialog {
	
	NSString *textCharacter1 = [eventDialog substringWithRange: NSMakeRange(0, 1) ];
	NSString *textCharacter2 = [eventDialog substringWithRange: NSMakeRange(1, 1) ];
	NSString *textCharacter3 = [eventDialog substringWithRange: NSMakeRange(2, 1) ];
	NSString *textCharacter4 = [eventDialog substringWithRange: NSMakeRange(3, 1) ];
	
	NSLog(@"> EVNT | Saying:'%@ %@ %@ %@'", textCharacter1, textCharacter2, textCharacter3, textCharacter4);

}

# pragma mark Misc -

- (void) animator1
{
	userSpriteState = @"walk";
	self.userPlayerChar.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", [self templateSpriteName:@"2"] ] ];
}

- (void) animator2
{
	userSpriteState = @"stand";
	self.userPlayerChar.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", [self templateSpriteName:@"1"] ] ];
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
	
	// Character
	if( type == 4 ){
		tileH = tileH * 3;
		centerH -= (tileH/2) + ((tileW * 0.5)/2);
		if( (posX + posY) == 1 ){ centerH += (tileW * 0.5); }
		else if( (posX + posY) == 2 ){ centerH += (tileW); }
		else if( (posX + posY) == -1 ){ centerH -= (tileW * 0.5); }
		else if( (posX + posY) == -2 ){ centerH -= (tileW); }
	}
	
	// Wall
	if( type == 5 ){
		tileH = tileH * 3;
		centerH -= (tileH/2) + ((tileW * 0.5)/2);
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
	
	if( posX ==-2 && posY == 1 ){ return CGRectMake(centerW+(tileW/2)*3, centerH+(tileH*0.5), tileW, tileH); }
	if( posX ==-2 && posY == 0 ){ return CGRectMake(centerW+(tileW/2)*2, centerH+(tileH*1.0), tileW, tileH); }
	if( posX ==-2 && posY ==-1 ){ return CGRectMake(centerW+(tileW/2), centerH+(tileH*1.5), tileW, tileH); }
	
	
	if( posX == 1 && posY ==-2 ){ return CGRectMake(centerW-(tileW/2)*3, centerH+(tileH*0.5), tileW, tileH); }
	if( posX == 0 && posY ==-2 ){ return CGRectMake(centerW-(tileW/2)*2, centerH+tileH, tileW, tileH); }
	if( posX ==-1 && posY ==-2 ){ return CGRectMake(centerW-(tileW/2)*1, centerH+(tileH*1.5), tileW, tileH); }
	
	if( posX == 2 && posY ==-1 ){ return CGRectMake(centerW-(tileW/2)*3, centerH+(tileH*0.5)*-0.12, tileW, tileH); }
	if( posX == 2 && posY == 0 ){ return CGRectMake(centerW-(tileW/2)*2, centerH+(tileH*0.5)*-0.45, tileW, tileH); }
	if( posX == 2 && posY == 1 ){ return CGRectMake(centerW-(tileW/2)*1, centerH+(tileH*0.5)*-0.79, tileW, tileH); }
	
	if( posX ==-1 && posY == 2 ){ return CGRectMake(centerW-(tileW/2)*-3, centerH+(tileH*0.5)*-0.12, tileW, tileH); }
	if( posX == 0 && posY == 2 ){ return CGRectMake(centerW-(tileW/2)*-2, centerH+(tileH*0.5)*-0.45, tileW, tileH); }
	if( posX == 1 && posY == 2 ){ return CGRectMake(centerW-(tileW/2)*-1, centerH+(tileH*0.5)*-0.79, tileW, tileH); }
	
	NSLog(@"error");
	
	return CGRectMake(0, 0, 100, 100);
}


-(int)flattenPosition :(int)x :(int)y {
	
	if(x==1 && y==-1){ return 0; }
	if(x==1 && y== 0){ return 1; }
	if(x==1 && y== 1){ return 2; }
	if(x==0 && y==-1){ return 3; }
	if(x==0 && y== 0){ return 4; }
	if(x==0 && y== 1){ return 5; }
	if(x==-1&& y==-1){ return 6; }
	if(x==-1&& y== 0){ return 7; }
	if(x==-1&& y== 1){ return 8; }
	
	if(x== 2&& y==-1){ return 9; }
	if(x== 2&& y== 0){ return 10; }
	if(x== 2&& y== 1){ return 11; }
	if(x== 1&& y== 2){ return 12; }
	if(x== 0&& y== 2){ return 13; }
	if(x==-1&& y== 2){ return 14; }
	
	if(x== 1&& y== 2){ return 12; }
	if(x== 0&& y== 2){ return 13; }
	if(x==-1&& y== 2){ return 14; }
	if(x== 1&& y==-2){ return 15; }
	if(x== 0&& y==-2){ return 16; }
	if(x==-1&& y==-2){ return 17; }
	
	if(x==-2&& y==-1){ return 18; }
	if(x==-2&& y== 0){ return 19; }
	if(x==-2&& y== 1){ return 20; }
	
	return 1;
}

-(int)flattenTileId :(int)tileId :(NSString*)axis {
	
	if([axis isEqualToString:@"x"]){
		if(tileId == 0){ return 1; }
		if(tileId == 1){ return 1; }
		if(tileId == 2){ return 1; }
		if(tileId == 3){ return 0; }
		if(tileId == 4){ return 0; }
		if(tileId == 5){ return 0; }
		if(tileId == 6){ return -1; }
		if(tileId == 7){ return -1; }
		if(tileId == 8){ return -1; }
	}
	if([axis isEqualToString:@"y"]){
		if(tileId == 0){ return -1; }
		if(tileId == 1){ return 0; }
		if(tileId == 2){ return 1; }
		if(tileId == 3){ return -1; }
		if(tileId == 4){ return 0; }
		if(tileId == 5){ return 1; }
		if(tileId == 6){ return -1; }
		if(tileId == 7){ return 0; }
		if(tileId == 8){ return 1; }
	}
	
	return 0;
}


# pragma mark IBActions -

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
