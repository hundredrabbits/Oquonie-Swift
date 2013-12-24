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

@synthesize interactionMap;

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
	userSpriteChar = @"char4";
	userSpriteCharId = 4;
	userLocation = 1;
	userSpriteState = @"stand";
	userSpriteOrientationHorizontal = @"l";
	userSpriteOrientationVertical = @"f";
	userMoveEnabled = 1;
	userDialogActive = 0;
    // New event storage
    userStorageEvents = [NSMutableArray arrayWithObjects:@"",nil];
    int myCount = 0;
    while ( myCount < 10 )	{ myCount++; userStorageEvents[myCount] = @"";	}

}

# pragma mark Move -

- (void) moveRouter :(int)posX :(int)posY :(int)direction
{
	NSLog(@"========+==============+====================");
	
	if(userDialogActive == 1){
		[self roomCleanDialog];
		userDialogActive = 0;
		return;
	}
	
	// Move disable timeout
	[self moveDisable];
	
	int blocker = [self moveEvent:( userPositionX+posX ) :( userPositionY+posY )];
	
	// Sprite face direction
	if( direction == 0 ){ userSpriteOrientationHorizontal = @"l"; userSpriteOrientationVertical = @"b"; }
	if( direction == 1 ){ userSpriteOrientationHorizontal = @"r"; userSpriteOrientationVertical = @"b"; }
	if( direction == 2 ){ userSpriteOrientationHorizontal = @"l"; userSpriteOrientationVertical = @"f"; }
	if( direction == 3 ){ userSpriteOrientationHorizontal = @"r"; userSpriteOrientationVertical = @"f"; }
		
	if( abs(userPositionX+posX) > 1 ){ blocker = 1; }
	if( abs(userPositionY+posY) > 1 ){ blocker = 1; }
	
	NSLog(@">  USER | Position     | Update to %d %d (%d)",userPositionX, userPositionY, [self flattenPosition:userPositionX :userPositionY]);
	
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
		[self moveParallax];
	}
	else{
		[self moveEventCheck:(userPositionX+posX) :(userPositionY+posY)];
		[self moveCollide:posX:posY];
	}
	[self moveOrder];
	
}

- (void)moveParallax
{
	NSLog(@">  USER | Effect       | Moving parallax");
	
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
	userMoveEnabled = 1;
}

- (void) moveDisable
{
	userMoveEnabled = 0;
	[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(moveEnable) userInfo:nil repeats:NO];
}

- (void) moveOrder
{
	NSLog(@">  ROOM | Blockers     | Updating z order");
	
    float userPositionOrder = self.userPlayer.frame.origin.y+self.userPlayer.frame.size.height;
    float subviewPositionOrder = 0;

    for (UIView *subview in [self.spritesContainer subviews]) {
		
		if(subview.tag == 404){ continue; }
		
        subviewPositionOrder = subview.frame.origin.y+subview.frame.size.height;
		
        if( userPositionOrder > subviewPositionOrder ){
			NSLog(@"> move player to front: %f %f",subviewPositionOrder,userPositionOrder);
			[self.spritesContainer bringSubviewToFront:self.userPlayer];
        }
        else{
			NSLog(@"> move player to back: %f %f",subviewPositionOrder,userPositionOrder);
            [self.spritesContainer bringSubviewToFront:subview];
        }
    }
}

- (int) moveEvent :(int)posX :(int)posY
{
	// Look if tile is missing
	if( [worldNode[userLocation][[self flattenPosition:posX :posY]] intValue] == 0 ){
		NSLog(@"> EVENT | Blocked      | x%d y%d (no ground)", posX, posY);
		[self moveCollide:posX:posY];
		return 1;
	}
	// Look if tile is a blocker
	if( [[self tileParser:worldNode[userLocation][[self flattenPosition:posX :posY]] :1] isEqualToString:@"block"] ){
		NSLog(@"> EVENT | Blocked      | x%d y%d (blocker)", posX, posY);
		[self moveCollide:posX:posY];
		return 1;
	}
	// Look if tile is a event
	if( [[self tileParser:worldNode[userLocation][[self flattenPosition:posX :posY]] :1] isEqualToString:@"warp"] ){
		NSLog(@"> EVENT | Blocked      | x%d y%d (warp)", posX, posY);
		[self moveCollide:posX:posY];
		return 1;
	}
	// Look if tile is a event
	if( [[self tileParser:worldNode[userLocation][[self flattenPosition:posX :posY]] :1] isEqualToString:@"event"] ){
		NSLog(@"> EVENT | Blocked      | x%d y%d", posX, posY);
		[self moveCollide:posX:posY];
		return 1;
	}
	
	return 0;
}

- (void) moveCollide :(int)posX :(int)posY
{
	for (UIView *subview in [self.spritesContainer subviews]) {
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

# pragma mark Interaction Map -

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *theTouch = [touches anyObject];
	interactionMap = [theTouch locationInView:self.view];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(userMoveEnabled == 0){ return; }
	
	UITouch *theTouch = [touches anyObject];
	CGPoint endPoint = [theTouch locationInView:self.view];
	
	int xDifference = abs(interactionMap.x-endPoint.x);
	int yDifference = abs(interactionMap.y-endPoint.y);
	
	if(xDifference < 20 && yDifference < 20){
		if( endPoint.x < (screen.size.width/2) && endPoint.y < (screen.size.height/2) ){ [self moveRouter:1 :0 :0]; }
		else if( endPoint.x > (screen.size.width/2) && endPoint.y > (screen.size.height/2) ){ [self moveRouter:-1 :0 :3]; }
		else if( endPoint.x < (screen.size.width/2) && endPoint.y > (screen.size.height/2) ){ [self moveRouter:0 :-1 :2]; }
		else if( endPoint.x > (screen.size.width/2) && endPoint.y < (screen.size.height/2) ){ [self moveRouter:0 :1 :1]; }
	}
	else{
		if(interactionMap.x < endPoint.x && interactionMap.y < endPoint.y)		{ [self moveRouter:-1 :0 :3]; }
		else if(interactionMap.x > endPoint.x && interactionMap.y < endPoint.y)	{ [self moveRouter:0 :-1 :2]; }
		else if(interactionMap.x > endPoint.x && interactionMap.y > endPoint.y)	{ [self moveRouter:1 :0 :0];  }
		else if(interactionMap.x < endPoint.x && interactionMap.y > endPoint.y)	{ [self moveRouter:0 :1 :1];  }
	}
}

@end
