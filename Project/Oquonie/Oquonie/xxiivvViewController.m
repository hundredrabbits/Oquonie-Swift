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
#import "xxiivvSettings.h"
#import "xxiivvUser.h"

#define POINT_DISTANCE(start, end) abs(sqrt((end.x-start.x)*(end.x-start.x) + (end.y-start.y)*(end.y-start.y)))
#define MOVE_DIRECTION(start, end) start.y > end.y ? (start.x > end.x ? DirectionNorth : DirectionEast) : (start.x > end.x ? DirectionWest : DirectionSouth)

@interface xxiivvViewController ()

@end

@implementation xxiivvViewController

@synthesize touchAnchorPoint;

-(void)viewDidLoad
{	
	[super viewDidLoad];
	[self start];
}

-(void)createJSON
{
    NSError* error;
	NSData* jsonData = [NSJSONSerialization dataWithJSONObject:worldNode options:NSJSONWritingPrettyPrinted error:&error];
	NSString* jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
	
	NSLog(@"%@",jsonString);
}

# pragma mark Start -

-(void)start
{
	[self userStart];
	userAudioPlaying = 1;
	
	[self templateStart];
	[self worldStart];
	[self roomStart];
	[self moveOrder];
	[self timerStart];
	[self eventSpellRefresh];
	
	[self eventIntroduction];
	
	self.debugLocation.hidden = YES;
	
//	[self createJSON];
	
}

- (BOOL)prefersStatusBarHidden {
	return YES;
}

# pragma mark Move -

- (void) moveRouter :(int)posX :(int)posY :(int)direction
{
	NSLog(@"======= + ============ + ===================");
	
	// Move is disabled if dialog is active
	if(userDialogActive == 1){
		[self roomClearDialog];
		userDialogActive = 0;
		return;
	}
	
	// Close credits
	if(self.creditsImage.alpha == 1){
		[UIView animateWithDuration:1.0 animations:^(void){
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			self.creditsImage.alpha = 0;
		} completion:^(BOOL finished){}];
		return;
	}
	
	// Close Map
	if(self.mapImage.alpha == 1){
		[UIView animateWithDuration:0.5 animations:^(void){
			self.mapImage.alpha = 0;
		} completion:^(BOOL finished){}];
		return;
	}
	
	// Move disable timeout
	[self moveDisable:0.2];
	
	int blocker = [self moveEvent:( userPositionX+posX ) :( userPositionY+posY )];
	
	// Sprite face direction
	if( direction == 0 ){ userSpriteOrientationHorizontal = @"l"; userSpriteOrientationVertical = @"b"; }
	if( direction == 1 ){ userSpriteOrientationHorizontal = @"r"; userSpriteOrientationVertical = @"b"; }
	if( direction == 2 ){ userSpriteOrientationHorizontal = @"l"; userSpriteOrientationVertical = @"f"; }
	if( direction == 3 ){ userSpriteOrientationHorizontal = @"r"; userSpriteOrientationVertical = @"f"; }
		
	if( abs(userPositionX+posX) > 1 ){ blocker = 1; }
	if( abs(userPositionY+posY) > 1 ){ blocker = 1; }
	
	// Move if okay
	if(blocker == 0){
		// Update position
		userPositionX += posX;
		userPositionY += posY;
		NSLog(@"•  USER | Position     | Update   -> X:%d Y:%d TILE:%d",userPositionX, userPositionY, [self flattenPosition:userPositionX :userPositionY]);
		[self audioEffectPlayer:@"walk"];
		[self moveEventCheck:(userPositionX) :(userPositionY)];
		
		[UIView animateWithDuration:0.3 animations:^(void){
			self.userPlayer.frame = [self tileLocation:4:userPositionX:userPositionY];
		} completion:^(BOOL finished){}];

		[self moveAnimation];
		[self moveParallax];
		[self moveIndicator:posX:posY];
	}
	else{
		[self moveEventCheck:(userPositionX+posX):(userPositionY+posY)];
		[self moveCollideAnimateEvent:(userPositionX+posX):(userPositionY+posY)];
		[self moveCollideAnimateChar:posX:posY];
	}
	[self moveOrder];
}

-(void)moveIndicator :(int)posX :(int)posY
{
	if(posY == -1){ // F L
		self.moveIndicator.frame = CGRectMake(0, screen.size.height-100, 100, 100);
		self.moveIndicator.alpha = 0.15;
		self.moveIndicator.image = [UIImage imageNamed:@"fx.indicator.f.l.png"];
	}
	else if (posX == -1){ // F R
		self.moveIndicator.frame = CGRectMake(screen.size.width-100, screen.size.height-100, 100, 100);
		self.moveIndicator.alpha = 0.15;
		self.moveIndicator.image = [UIImage imageNamed:@"fx.indicator.f.r.png"];
	}
	else if(posY == 1){ // B R
		self.moveIndicator.frame = CGRectMake(screen.size.width-100, 0, 100, 100);
		self.moveIndicator.alpha = 0.15;
		self.moveIndicator.image = [UIImage imageNamed:@"fx.indicator.b.r.png"];
	}
	else if (posX == 1){ // B L
		self.moveIndicator.frame = CGRectMake(0, 0, 100, 100);
		self.moveIndicator.alpha = 0.15;
		self.moveIndicator.image = [UIImage imageNamed:@"fx.indicator.b.l.png"];
	}
	[UIView animateWithDuration:0.5 animations:^(void){
		self.moveIndicator.alpha = 0;
	} completion:^(BOOL finished){}];
}

- (void)moveParallax
{
	NSLog(@"•  USER | Effect       | Update   -> parallax");
	
	[UIView beginAnimations: @"Fade In" context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDelay:0];
	
	self.parallaxFront.alpha = 1;
	self.parallaxBack.alpha = 1;
	
	self.parallaxFront.frame = CGRectOffset(parallaxFrontOrigin, (userPositionX*-1+userPositionY)*3, (userPositionX+userPositionY)*-3);
	self.parallaxBack.frame = CGRectOffset(parallaxFrontOrigin, (userPositionX*-1+userPositionY)*2, (userPositionX+userPositionY)*-2);
	
	self.roomContainer.frame = CGRectOffset(self.view.frame, (userPositionX*-1+userPositionY)*1.1, (userPositionX+userPositionY)*-1.1);
	self.spritesContainer.frame = CGRectOffset(self.view.frame, (userPositionX*-1+userPositionY)*1.1, (userPositionX+userPositionY)*-1.1);
	[UIView commitAnimations];
	
}

- (void) moveEventCheck :(int)userFuturePositionX :(int)userFuturePositionY
{
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
	[self userSpriteUpdate:[self templateSpriteName:@"1"]];
	[NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(animator1) userInfo:nil repeats:NO];
	[NSTimer scheduledTimerWithTimeInterval:0.30 target:self selector:@selector(animator2) userInfo:nil repeats:NO];
}

- (void) animator1
{
	userSpriteState = @"walk";
	[self userSpriteUpdate:[self templateSpriteName:@"2"]];
}

- (void) animator2
{
	userSpriteState = @"stand";
	[self userSpriteUpdate:[self templateSpriteName:@"1"]];
}

-(void)userSpriteUpdate :(NSString*)imageName
{
	self.userPlayerChar.image = [UIImage imageNamed: imageName];
}

- (void) moveEnable
{
	NSLog(@"•  USER | Move         | Enabled");
	
	userMoveEnabled = 1;
}

- (void) moveDisable :(float)disableTime
{
	NSLog(@"•  USER | Move         | Disabled");
	
	[worldMoveTimer invalidate];
	
	userMoveEnabled = 0;
	worldMoveTimer = [NSTimer scheduledTimerWithTimeInterval:disableTime target:self selector:@selector(moveEnable) userInfo:nil repeats:NO];
}

- (void) moveOrder
{
	NSLog(@"•  ROOM | Blockers     | Update   -> z order");
    float subviewPositionOrder = 0;
	// +Z1 & -Z1
    for (UIView *subview in [self.spritesContainer subviews]) {
        subviewPositionOrder = subview.frame.origin.y+subview.frame.size.height;
		if(subviewPositionOrder > ((self.floor0e.frame.origin.y+self.floor0e.frame.size.height)-10) ){
			[self.spritesContainer bringSubviewToFront:subview];
		}
		if(subviewPositionOrder < ((self.floor10.frame.origin.y+self.floor10.frame.size.height)+10) ){
			[self.spritesContainer sendSubviewToBack:subview];
		}
	}
	
	// +Z2 & -Z2
    for (UIView *subview in [self.spritesContainer subviews]) {
        subviewPositionOrder = subview.frame.origin.y+subview.frame.size.height;
		if(subviewPositionOrder > ((self.flooree.frame.origin.y+self.flooree.frame.size.height)-10) ){
			[self.spritesContainer bringSubviewToFront:subview];
		}
		if(subviewPositionOrder < ((self.floor11.frame.origin.y+self.floor11.frame.size.height)+10) ){
			[self.spritesContainer sendSubviewToBack:subview];
		}
	}
	
	// Find notifications
    for (UIView *subview in [self.spritesContainer subviews]) {
		if(subview.tag == 30){
			[self.spritesContainer bringSubviewToFront:subview];
		}
	}
}

- (int) moveEvent :(int)posX :(int)posY
{
	// If Ghost
	if([[self tileParser:worldNode[userLocation][[self flattenPosition:posX :posY]] :2] isEqualToString:@"redGhost"]){
		return 0;
	}
	
	// Look if tile is missing
	if( [worldNode[userLocation][[self flattenPosition:posX :posY]] intValue] == 0 ){
		NSLog(@"> EVENT | Blocked      | No Ground");
		[self audioEffectPlayer:@"bump"];
		[self moveCollideAnimateChar:posX:posY];
		return 1;
	}
	// Look if tile is a blocker
	if( [[self tileParser:worldNode[userLocation][[self flattenPosition:posX :posY]] :1] isEqualToString:@"block"] ){
		NSLog(@"> EVENT | Blocked      | Blocker");
		[self audioEffectPlayer:@"bump"];
		[self moveCollideAnimateChar:posX:posY];
		return 1;
	}
	// Look if tile is a event
	if( [[self tileParser:worldNode[userLocation][[self flattenPosition:posX :posY]] :1] isEqualToString:@"warp"] ){
		NSLog(@"> EVENT | Blocked      | Warp");
		[self audioEffectPlayer:@"warp"];
		[self moveCollideAnimateChar:posX:posY];
		return 1;
	}
	// Look if tile is a event
	if( [[self tileParser:worldNode[userLocation][[self flattenPosition:posX :posY]] :1] isEqualToString:@"event"] ){
		NSLog(@"> EVENT | Blocked      | x%d y%d", posX, posY);
		[self moveCollideAnimateChar:posX:posY];
		return 1;
	}
	
	return 0;
}

# pragma mark Move Animate -

-(void)moveCollideAnimateChar :(int)posX :(int)posY
{
	[self userSpriteUpdate:[NSString stringWithFormat:@"%@", [self templateSpriteName:@""]]];
	CGRect userOrigin = self.userPlayer.frame;
	if( (posX == -1 && posY == 0) || (posX == 0 && posY == 1) ){ self.userPlayer.frame = CGRectOffset(self.userPlayer.frame, 2, 0); }
	if( (posX == 0 && posY == -1) || (posX == 1 && posY == 0) ){ self.userPlayer.frame = CGRectOffset(self.userPlayer.frame, -2, 0); }

    [UIView animateWithDuration:0.3 animations:^(void){
        self.userPlayer.frame = userOrigin;
    } completion:^(BOOL finished){}];
}

-(void)moveCollideAnimateEvent:(int)posX :(int)posY
{
	for (UIView *subview in [self.spritesContainer subviews]) {
		
		if(subview.tag == 10){ continue; }
		
		CGPoint targetPosition = subview.frame.origin;
		CGPoint subviewPosition = [self tileLocation:4:posX:posY].origin;
		
		if( targetPosition.x == subviewPosition.x && targetPosition.y == subviewPosition.y){
			CGRect origin = subview.frame;
			subview.frame = CGRectOffset(subview.frame, 0, -2);
			[UIView beginAnimations: @"Fade In" context:nil];
			[UIView setAnimationDuration:0.3];
			[UIView setAnimationDelay:0];
			subview.frame = origin;
			[UIView commitAnimations];
		}
	}
}

# pragma mark Misc -

- (CGRect)tileLocation :(int)type :(int)posX :(int)posY
{
	screen = [[UIScreen mainScreen] bounds];
	screenMargin = screen.size.width/10;
	viewWidth = screen.size.width - (2*screenMargin);
	
	tileW = viewWidth/3;
	tileH = tileW * 0.5;
	
	int centerW = (screen.size.width/2)-(tileW/2);
	int centerH = (screen.size.height/2)-(tileH/2);
	
	if( type == 0 ){		
		if( posX == 2 && posY == -1 ){ return CGRectMake(centerW+(tileW/2)*-3, centerH+(tileH*-0.5), tileW, tileH); }
		if( posX == 2 && posY == 0 ){ return CGRectMake(centerW+(tileW/2)*-2, centerH+(tileH*-1), tileW, tileH); }
		if( posX == 2 && posY == 1 ){ return CGRectMake(centerW+(tileW/2)*-1, centerH+(tileH*-1.5), tileW, tileH); }
		
		if( posX == 1 && posY == 2 ){ return CGRectMake(centerW+(tileW/2)*1, centerH+(tileH*-1.5), tileW, tileH); }
		if( posX == 0 && posY == 2 ){ return CGRectMake(centerW+(tileW/2)*2, centerH+(tileH*-1), tileW, tileH); }
		if( posX == -1 && posY == 2 ){ return CGRectMake(centerW+(tileW/2)*3, centerH+(tileH*-0.5), tileW, tileH); }
	}
	
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
	
	return CGRectMake(0, 0, 0, 0);
}


-(int)flattenPosition :(int)x :(int)y
{
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

-(int)flattenTileId :(int)tileId :(NSString*)axis
{
	if([axis isEqualToString:@"x"]){
		// Tiles
		if(tileId == 0){ return 1;  }
		if(tileId == 1){ return 1;  }
		if(tileId == 2){ return 1;  }
		if(tileId == 3){ return 0;  }
		if(tileId == 4){ return 0;  }
		if(tileId == 5){ return 0;  }
		if(tileId == 6){ return -1; }
		if(tileId == 7){ return -1; }
		if(tileId == 8){ return -1; }
		// Walls
		if(tileId == 9 ){ return 2; }
		if(tileId == 10){ return 2; }
		if(tileId == 11){ return 2; }
		if(tileId == 12){ return 2; }
		if(tileId == 13){ return 1; }
		if(tileId == 14){ return 0; }
		// Steps
		if(tileId == 15){ return -1;}
		if(tileId == 16){ return  0;}
		if(tileId == 17){ return -1;}
		if(tileId == 18){ return -1;}
		if(tileId == 19){ return -1;}
		if(tileId == 20){ return -1;}
	}
	if([axis isEqualToString:@"y"]){
		// Tiles
		if(tileId == 0){ return -1; }
		if(tileId == 1){ return 0; }
		if(tileId == 2){ return 1; }
		if(tileId == 3){ return -1; }
		if(tileId == 4){ return 0; }
		if(tileId == 5){ return 1; }
		if(tileId == 6){ return -1; }
		if(tileId == 7){ return 0; }
		if(tileId == 8){ return 1; }
		// Walls
		if(tileId == 9 ){ return 0; }
		if(tileId == 10){ return 1; }
		if(tileId == 11){ return 2; }
		if(tileId == 12){ return 2; }
		if(tileId == 13){ return 2; }
		if(tileId == 14){ return 2; }
		// Steps
		if(tileId == 15){ return -1;}
		if(tileId == 16){ return -2;}
		if(tileId == 17){ return -1;}
		if(tileId == 18){ return -1;}
		if(tileId == 19){ return -1;}
		if(tileId == 20){ return -1;}
	}
	
	return 0;
}

# pragma mark Timer -

-(void)timerStart
{
	[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(timerTic) userInfo:nil repeats:YES];
}

-(void)timerTic
{
	worldTimer += 1;
	worldTimerEvents = [self worldTimerEvents];
	worldTimerUser = [self worldTimerUser];
	worldTimerNotifications = [self worldTimerNotifications];
	
	// Animate only in the cyle
	if(worldTimerEventCycle < 1){
		[self timerAnimateEvents];
	}
	// Animate only in the cyle
	if(worldTimerUserCycle < 1){
		[self timerAnimateUser];
	}
	// Animate only in the cyle
	if(worldTimerNotifications == 0){
		[self timerAnimateNotifications];
	}
}

-(int)worldTimerNotifications
{
	worldTimerNotifications += 1;
	if(worldTimerNotifications > 9){
		worldTimerNotifications = 0;
	}
	return worldTimerNotifications;
}

-(int)worldTimerEvents
{
	if(worldTimerEventCount == 1 && worldTimerEventCycle < 10){
		worldTimerEventCycle += 1;
	}
	else if(worldTimerEventCycle < 13){
		worldTimerEventCycle = 0;
		
		if(worldTimerEventCount>2)		{ worldTimerEventDirection = 0; }
		else if(worldTimerEventCount<2){ worldTimerEventDirection = 1; }
		
		if(worldTimerEventDirection == 1){	worldTimerEventCount += 1; }
		else{ worldTimerEventCount -= 1; }
	}
	return worldTimerEventCount;
}
-(int)worldTimerUser
{
	if(worldTimerUserCount == 1 && worldTimerUserCycle < 6){
		worldTimerUserCycle += 1;
	}
	else if(worldTimerUserCycle < 8){
		worldTimerUserCycle = 0;
		
		if(worldTimerUserCount>2)		{ worldTimerUserDirection = 0; }
		else if(worldTimerUserCount<2){ worldTimerUserDirection = 1; }
		
		if(worldTimerUserDirection == 1){	worldTimerUserCount += 1; }
		else{ worldTimerUserCount -= 1; }
	}
	return worldTimerUserCount;
}

-(void)timerAnimateEvents
{
	for (UIImageView *subview in [self.spritesContainer subviews]) {
		if(subview.tag != 20){ continue; }
		
		int tileId = -1;
		while (tileId < 21) {
			
			tileId += 1;
			
			// Lets identify the current subview
			if(![[self tileParser:worldNode[userLocation][tileId] :1] isEqualToString:@"event"]){ continue; }
			if( subview.frame.origin.x != [self tileLocation:4:[self flattenTileId:tileId :@"x"]:[self flattenTileId:tileId :@"y"]].origin.x ){ continue;}
			if( subview.frame.origin.y != [self tileLocation:4:[self flattenTileId:tileId :@"x"]:[self flattenTileId:tileId :@"y"]].origin.y ){ continue;}
			
			subview.image = [UIImage imageNamed:[NSString stringWithFormat:@"event.%d.%@.%d.png", [[self tileParser:worldNode[userLocation][tileId] :3] intValue], [self tileParser:worldNode[userLocation][tileId] :4], worldTimerEventCount]];
		
		}
	}
}

-(void)timerAnimateUser
{
	if([userSpriteState isEqual:@"stand"]){
		[self userSpriteUpdate:[NSString stringWithFormat:@"%@", [self templateSpriteName:[NSString stringWithFormat:@"%d",worldTimerUserCount]]] ];
	}
}

-(void)timerAnimateNotifications
{
	for (UIImageView *subview in [self.spritesContainer subviews]) {
		if(subview.tag != 30){ continue; }
		
		CGRect subviewOrigin = subview.frame;
		
		[UIView animateWithDuration:1.5 animations:^(void){
			subview.frame = CGRectOffset(subviewOrigin, 0, -4);
		} completion:^(BOOL finished){
			
			[UIView animateWithDuration:1.5 animations:^(void){
				subview.frame = subviewOrigin;
			} completion:^(BOOL finished){
				
			}];
		}];
		
	}
}

# pragma mark Audio Stuff -

-(void)decreaseVolume:(NSString*)filename {
    // Until threshold is met, lower volume and repeat
    if(self.audioAmbientPlayer.volume > 0.1) {
        self.audioAmbientPlayer.volume = self.audioAmbientPlayer.volume - 0.05;
        [self performSelector:@selector(decreaseVolume) withObject:nil afterDelay:0.1];
    }
    // Stop and reset audio
    else {
        [self.audioAmbientPlayer stop];
        self.audioAmbientPlayer.currentTime = 0;
        [self.audioAmbientPlayer prepareToPlay];
		
		audioCurrentlyPlaying = filename;
		[self audioAmbientPlayer:filename];
		NSLog(@"ready to play");
    }
	
	NSLog(@"%f",self.audioAmbientPlayer.volume);
}


-(void)audioAmbientPlayer:(NSString*)filename
{
	if(userAudioPlaying == 0){
		return;
	}
	
	
	if(audioCurrentlyPlaying != filename){
		[self fadeOut];
		audioCurrentlyPlaying = filename;
	}
	else{
		[self fadeIn];
	}
}

-(void)fadeOut
{
    if(self.audioAmbientPlayer.volume > 0.1) {
        self.audioAmbientPlayer.volume = self.audioAmbientPlayer.volume - 0.2;
        [self performSelector:@selector(fadeOut) withObject:nil afterDelay:0.1];
    }
    else {
		[self audioAmbientPlayer:audioCurrentlyPlaying];
	}
	NSLog(@"fade out: %f",self.audioAmbientPlayer.volume);
}

-(void)fadeIn
{
	// Initiate audio player if volume is low
	if(self.audioAmbientPlayer.volume < 0.1){
		[self playAudio:audioCurrentlyPlaying];
	}
	
	// Until threshold is met, lower volume and repeat
    if(self.audioAmbientPlayer.volume < 1) {
        self.audioAmbientPlayer.volume += 0.3;
        [self performSelector:@selector(fadeIn) withObject:nil afterDelay:0.1];
    }
//	if(self.audioAmbientPlayer.volume > 1){ self.audioAmbientPlayer.volume = 1;}
	NSLog(@"fade in: %f",self.audioAmbientPlayer.volume);
}

-(void)playAudio:(NSString*)filename
{
	if([filename isEqualToString:@"town1.mp3"] && userGameCompleted == 1){
		filename = @"town3.mp3";
	}
	else if([filename isEqualToString:@"town1.mp3"] && [userStorageEvents[storageQuestPillarNemedique] intValue] == 1){
		filename = @"town2.mp3";
	}
	
	float currentVolume = self.audioAmbientPlayer.volume;
	NSError *error;
	NSString *resourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString: [NSString stringWithFormat:@"/%@", filename] ];
	
	self.audioAmbientPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:resourcePath] error:&error];
	
	if (error){
		NSLog(@"$ ERROR | Ambient      | Error    -> (%@)%@",filename,[error localizedDescription]);
	}
	else {
		NSLog(@"$ AUDIO | Ambient      | File     -> %@",filename);
		self.audioAmbientPlayer.numberOfLoops = -1;
		[self.audioAmbientPlayer prepareToPlay];
		self.audioAmbientPlayer.volume = currentVolume;
	}
	
	[self.audioAmbientPlayer play];
}


-(void)audioEffectPlayer:(NSString*)filename
{
	self.audioEffectPlayer.volume = 0.5;
	filename = [NSString stringWithFormat:@"sfx_%@.wav",filename];
	NSError *error;
	NSString *resourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString: [NSString stringWithFormat:@"/%@", filename] ];
	self.audioEffectPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:resourcePath] error:&error];
	if (error){
		NSLog(@"$ ERROR | Effect       | Error    -> (%@)%@",filename,[error localizedDescription]);
	}
	else {
		NSLog(@"$ AUDIO | Effect       | File     -> %@",filename);
		self.audioEffectPlayer.numberOfLoops = 0;
		self.audioEffectPlayer.currentTime = 0;
        [self.audioEffectPlayer prepareToPlay];
        self.audioEffectPlayer.volume = 0.5;
	}
	[self.audioEffectPlayer play];
}

-(void)audioDialogPlayer:(NSString*)filename
{
	self.audioDialogPlayer.volume = 1;
	
	filename = [NSString stringWithFormat:@"dialog_%@.wav",filename];
	
	NSError *error;
	NSString *resourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString: [NSString stringWithFormat:@"/%@", filename] ];
	
	self.audioDialogPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:resourcePath] error:&error];
	
	if (error){
		NSLog(@"$ ERROR | Effect       | Error    -> (%@)%@",filename,[error localizedDescription]);
	}
	else {
		NSLog(@"$ AUDIO | Effect       | File     -> %@",filename);
		self.audioDialogPlayer.numberOfLoops = 0;
		[self.audioDialogPlayer prepareToPlay];
	}
	[self.audioDialogPlayer play];
}

# pragma mark Interaction Map -

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [worldMoveHoldTimer invalidate];
    currentDirection = DirectionNone;
    
	touchAnchorPoint = [[touches anyObject] locationInView:self.view];
    touchMovePoint = touchAnchorPoint;
    
    worldMoveHoldTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(moveAndUpdateDirection) userInfo:nil repeats:YES];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	touchMovePoint = [[touches anyObject] locationInView:self.view];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [worldMoveHoldTimer invalidate];
    currentDirection = DirectionNone;
    
	if(userMoveEnabled == 0){ return; }
	
	CGPoint touchReleasePoint = [[touches anyObject] locationInView:self.view];
	
	int xDifference = abs(touchAnchorPoint.x-touchReleasePoint.x);
	int yDifference = abs(touchAnchorPoint.y-touchReleasePoint.y);
	
	if(xDifference < 20 && yDifference < 20){
		if( touchReleasePoint.x < (screen.size.width/2) && touchReleasePoint.y < (screen.size.height/2) ){ [self moveRouter:1 :0 :0]; }
		else if( touchReleasePoint.x > (screen.size.width/2) && touchReleasePoint.y > (screen.size.height/2) ){ [self moveRouter:-1 :0 :3]; }
		else if( touchReleasePoint.x < (screen.size.width/2) && touchReleasePoint.y > (screen.size.height/2) ){ [self moveRouter:0 :-1 :2]; }
		else if( touchReleasePoint.x > (screen.size.width/2) && touchReleasePoint.y < (screen.size.height/2) ){ [self moveRouter:0 :1 :1]; }
	}
	else{
		if(touchAnchorPoint.x < touchReleasePoint.x && touchAnchorPoint.y < touchReleasePoint.y)		{ [self moveRouter:-1 :0 :3]; }
		else if(touchAnchorPoint.x > touchReleasePoint.x && touchAnchorPoint.y < touchReleasePoint.y)	{ [self moveRouter:0 :-1 :2]; }
		else if(touchAnchorPoint.x > touchReleasePoint.x && touchAnchorPoint.y > touchReleasePoint.y)	{ [self moveRouter:1 :0 :0];  }
		else if(touchAnchorPoint.x < touchReleasePoint.x && touchAnchorPoint.y > touchReleasePoint.y)	{ [self moveRouter:0 :1 :1];  }
	}
}

-(void)moveAndUpdateDirection
{
    CGFloat distanceMoved = POINT_DISTANCE(touchAnchorPoint, touchMovePoint);
    if(distanceMoved > 20) {
        currentDirection = MOVE_DIRECTION(touchAnchorPoint, touchMovePoint);
        touchAnchorPoint = touchMovePoint;
    }
    switch (currentDirection) {
        case DirectionNorth: [self moveRouter:1 :0 :0]; break;
        case DirectionEast:  [self moveRouter:0 :1 :1]; break;
        case DirectionWest:  [self moveRouter:0 :-1 :2]; break;
        case DirectionSouth: [self moveRouter:-1 :0 :3]; break;
        case DirectionNone: default:; // Do nothing
    }
}

// Currently not used
-(void)touchHeld
{
	NSString* userSpriteOrientationOriginHorizontal = userSpriteOrientationHorizontal;
	NSString* userSpriteOrientationOriginVertical = userSpriteOrientationHorizontal;
	
    if(touchAnchorPoint.y > touchMovePoint.y){
        if(touchAnchorPoint.x > touchMovePoint.x){ [self moveRouter:1 :0 :0]; }
        else{ [self moveRouter:0 :1 :1]; }
    }
    else{
        if(touchAnchorPoint.x > touchMovePoint.x){ [self moveRouter:0 :-1 :2]; }
        else{ [self moveRouter:-1 :0 :3]; }
    }
	
	if(userSpriteOrientationHorizontal != userSpriteOrientationOriginHorizontal && userSpriteOrientationVertical != userSpriteOrientationOriginVertical){
		touchAnchorPoint = touchMovePoint;
	}
}

@end
