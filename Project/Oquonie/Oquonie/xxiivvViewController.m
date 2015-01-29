//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvViewController.h"

#import "xxiivvTouch.h"
#import "xxiivvTemplates.h"
#import "xxiivvEvents.h"
#import <Social/Social.h>

#define POINT_DISTANCE(start, end) abs(sqrt((end.x-start.x)*(end.x-start.x) + (end.y-start.y)*(end.y-start.y)))
#define MOVE_DIRECTION(start, end) start.y > end.y ? (start.x > end.x ? DirectionNorth : DirectionEast) : (start.x > end.x ? DirectionWest : DirectionSouth)

@interface xxiivvViewController ()

@end

@implementation xxiivvViewController

@synthesize touchAnchorPoint;

-(void)viewDidLoad
{	
	[super viewDidLoad];
    [self saveOrientation];
	[self start];
}

# pragma mark Start -

-(void)start
{
    world = [[World alloc] init];
    user  = [[User alloc] init];
    position = [[Position alloc] initWithView:self.view.frame];

    [self timerStart];
    
	debug = 1;
    
    if( debug == 1){
        [user listening:0];
        [user setLocation:50];
        [user eventCollect:storageQuestPillarNemedique];
    }
    else{
        [user listening:1];
    }
    
	[self templateStart];
    [self roomStart];
    
    [self moveOrder];
	
	[self eventIntroduction];
	
	self.debugLocation.hidden = YES;	
}

- (BOOL)prefersStatusBarHidden {
	return YES;
}

# pragma mark Move -

- (void) moveRouter :(int)posX :(int)posY :(int)direction
{
    NSLog(@"======= + ============ + ===================");
    
    // Move is disabled if dialog is active
    if( [user isTalking] ){
        [self roomClearDialog];
        [user talking:0];
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
    
    int blocker = [self moveEvent:( [user x]+posX ) :( [user y]+posY )];
    
    // Sprite face direction
    if( direction == 0 ){ [user setHorizontal:@"l"]; [user setVertical:@"b"]; }
    if( direction == 1 ){ [user setHorizontal:@"r"]; [user setVertical:@"b"]; }
    if( direction == 2 ){ [user setHorizontal:@"l"]; [user setVertical:@"f"]; }
    if( direction == 3 ){ [user setHorizontal:@"r"]; [user setVertical:@"f"]; }
    
    if( abs([user x]+posX) > 1 ){ blocker = 1; }
    if( abs([user y]+posY) > 1 ){ blocker = 1; }
    
    // Move if okay
    if(blocker == 0){
        // Update position
        [user setX:([user x] + posX)];
        [user setY:([user y] + posY)];
        
        [self audioEffectPlayer:@"walk"];
        [self moveEventCheck:([user x]) :([user y])];
        
        [UIView animateWithDuration:0.3 animations:^(void){
            self.userPlayer.frame = [position tile:4:[user x]:[user y]];
        } completion:^(BOOL finished){}];
        
        [self moveAnimation];
        [self moveParallax];
        [self moveIndicator:posX:posY];
    }
    else{
        [self moveEventCheck:([user x]+posX):([user y]+posY)];
        [self moveCollideAnimateEvent:([user x]+posX):([user y]+posY)];
        [self moveCollideAnimateChar:posX:posY];
    }
    [self moveOrder];
}

- (void) old_moveRouter :(int)posX :(int)posY :(int)direction
{
	NSLog(@"======= + ============ + ===================");
	
	// Move is disabled if dialog is active
	if([user isTalking]){
		[self roomClearDialog];
        [user talking:0];
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
	
	int blocker = [self moveEvent:( [user x]+posX ) :( [user y]+posY )];
	
	// Sprite face direction
	if( direction == 0 ){ [user setHorizontal:@"l"]; [user setVertical:@"b"]; }
	if( direction == 1 ){ [user setHorizontal:@"r"]; [user setVertical:@"b"]; }
	if( direction == 2 ){ [user setHorizontal:@"l"]; [user setVertical:@"f"]; }
	if( direction == 3 ){ [user setHorizontal:@"r"]; [user setVertical:@"f"]; }
		
	if( abs([user x]+posX) > 1 ){ blocker = 1; }
	if( abs([user y]+posY) > 1 ){ blocker = 1; }
	
	// Move if okay
	if(blocker == 0){
        // Update position
        [user setX:([user x] + posX)];
        [user setY:([user y] + posY)];
        
		[self audioEffectPlayer:@"walk"];
		[self moveEventCheck:([user x]) :([user y])];
		
		[UIView animateWithDuration:0.3 animations:^(void){
			self.userPlayer.frame = [position tile:4:[user x]:[user y]];
		} completion:^(BOOL finished){}];

		[self moveAnimation];
		[self moveParallax];
		[self moveIndicator:posX:posY];
	}
	else{
		[self moveEventCheck:([user x]+posX):([user y]+posY)];
		[self moveCollideAnimateEvent:([user x]+posX):([user y]+posY)];
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
    
	self.parallaxFront.frame = CGRectOffset(self.view.frame, ([user x]*-1+[user y])*3, ([user x]+[user y])*-3);
	self.parallaxBack.frame = CGRectOffset(self.view.frame, ([user x]*-1+[user y])*2, ([user x]+[user y])*-2);
    
	self.roomContainer.frame = CGRectOffset(self.view.frame, ([user x]*-1+[user y])*1.1, ([user x]+[user y])*-1.1);
	self.spritesContainer.frame = CGRectOffset(self.view.frame, ([user x]*-1+[user y])*1.1, ([user x]+[user y])*-1.1);
    
	[UIView commitAnimations];
}

- (void) moveEventCheck :(int)targetX :(int)targetY
{
    Tile* tileTarget = [[Tile alloc] initWithString:[room tileAtLocation:targetX:targetY]];

	if( [tileTarget isEvent] == 1 || [tileTarget isWarp] == 1 ){
		[self eventRouter :[tileTarget type]:[tileTarget name]:[tileTarget data]];
	}
}

- (void) moveAnimation
{
	[user setState:@"walk"];
	[self userSpriteUpdate:[self templateSpriteName:@"1"]];
	[NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(animator1) userInfo:nil repeats:NO];
	[NSTimer scheduledTimerWithTimeInterval:0.30 target:self selector:@selector(animator2) userInfo:nil repeats:NO];
}

- (void) animator1
{
	[user setState:@"walk"];
	[self userSpriteUpdate:[self templateSpriteName:@"2"]];
}

- (void) animator2
{
	[user setState:@"stand"];
	[self userSpriteUpdate:[self templateSpriteName:@"1"]];
}

-(void)userSpriteUpdate :(NSString*)imageName
{
	self.userPlayerChar.image = [UIImage imageNamed: imageName];
}

- (void) moveEnable
{
	[user setEnabled:1];
}

- (void) moveDisable :(float)disableTime
{
	[worldMoveTimer invalidate];
	[user setEnabled:0];
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
    Tile* tile = [[Tile alloc] initWithString:[room tileAtLocation:posX :posY]];
    
	// If Ghost
	if([[tile name] isEqualToString:@"redGhost"]){
		return 0;
	}
	
	// Look if tile is missing
	if( [tile isEmpty] ){
		NSLog(@"> EVENT | Blocked      | No Ground");
		[self audioEffectPlayer:@"bump"];
		[self moveCollideAnimateChar:posX:posY];
		return 1;
	}
	// Look if tile is a blocker
	if( [tile isBlocker] ){
		NSLog(@"> EVENT | Blocked      | Blocker");
		[self audioEffectPlayer:@"bump"];
		[self moveCollideAnimateChar:posX:posY];
		return 1;
	}
	// Look if tile is a event
	if( [tile isWarp] ){
		NSLog(@"> EVENT | Blocked      | Warp");
		[self audioEffectPlayer:@"warp"];
		[self moveCollideAnimateChar:posX:posY];
		return 1;
	}
	// Look if tile is a event
	if( [tile isEvent] ){
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
		CGPoint subviewPosition = [position tile:4:posX:posY].origin;
		
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
            
            Tile* tile = [[Tile alloc] initWithString:[room tileAtId:tileId]];
            
			if(![tile isEvent]){ continue; }
			if( subview.frame.origin.x != [position tile:4:[room inflateTileId:tileId :@"x"]:[room inflateTileId:tileId :@"y"]].origin.x ){ continue;}
			if( subview.frame.origin.y != [position tile:4:[room inflateTileId:tileId :@"x"]:[room inflateTileId:tileId :@"y"]].origin.y ){ continue;}
            
			subview.image = [UIImage imageNamed:[NSString stringWithFormat:@"event.%d.%@.%d.png", [[tile data] intValue], [tile extras], worldTimerEventCount]];
		
		}
	}
}

-(void)timerAnimateUser
{
	if([[user state] isEqual:@"stand"]){
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
	if(![user isListening]){
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
	if([filename isEqualToString:@"town1.mp3"] && [user isFinished] ){
		filename = @"town3.mp3";
	}
	else if([filename isEqualToString:@"town1.mp3"] && [user eventExists:storageQuestPillarNemedique]){
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
	
	if(debug != 1){
		[self.audioAmbientPlayer play];
	}
	
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
    
	if( [user enabled] == 0 ){ return; }
	
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

# pragma mark Misc -

-(void)apiContact:(NSString*)source :(NSString*)method :(NSString*)term :(NSString*)value
{
	NSString *post = [NSString stringWithFormat:@"values={\"term\":\"%@\",\"value\":\"%@\"}",term,value];
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	
	NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	[request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.xxiivv.com/%@/%@",source,method]]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	NSURLResponse *response;
	NSData *POSTReply = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
	NSString *theReply = [[NSString alloc] initWithBytes:[POSTReply bytes] length:[POSTReply length] encoding: NSASCIIStringEncoding];
	NSLog(@"& API  | %@: %@",method, theReply);
	
	return;
}

-(void)saveOrientation{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
}

- (void) orientationChanged:(NSNotification *)note
{
    if( [[UIDevice currentDevice] orientation] == 5 ){
        return;
    }
    
    [self templateStart];
    [self roomStart];
    [position tile:4:[user x]:[user y]];
    self.userPlayer.frame = [position tile:4:[user x]:[user y]];
    [self moveOrder];
}

@end
