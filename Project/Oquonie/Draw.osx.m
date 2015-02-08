//
//  Draw.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-30.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "Draw.osx.h"
#import "xxiivvVariables.h"
#import "xxiivvSettings.h"

#import "ViewController.h"

#import "TileView.h"

@implementation Draw

-(Draw*)init
{
    NSLog(@"+  DRAW | Init");
    room = [[Room alloc] initWithArray:[world roomAtLocation:[user location]]];
    position = [[Position alloc] initWithView:storyboard.view.frame];
	
	[eventTimer invalidate];
	eventTimer = [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(animate) userInfo:nil repeats:YES];
	
    return self;
}

-(void)map :(NSString*)name
{
    NSLog(@"~  DRAW | Map %@",name);
}

-(void)notifications
{
	[self eraseNotifications];
	
	NSLog(@"~  DRAW | Notifications");
	for (int x = -2; x < 3; x++) {
		for (int y = -2; y < 3; y++) {
			
			Tile * tileCheck = [[Tile alloc] initWithString:[room tileAtLocation:x:y]];
			if( ![tileCheck isEvent] ){ continue; }
			
			// Event is a blocker tile type
			for(NSImageView* subview in [spriteContainer subviews]) {
				if( subview.frame.origin.y == [position tile:4:x:y].origin.y && subview.frame.origin.x == [position tile:4:x:y].origin.x && subview.frame.size.width == [position tile:4:x:y].size.width && subview.frame.size.height == [position tile:4:x:y].size.height ){
					Encounter * newEncounter = [[Encounter alloc] initWithName:[tileCheck name]];
					
					if( ![[newEncounter notify] isEqualToString:@""] ){
						NSLog(@"~  DRAW | Notification : %@ at %d %d", [newEncounter notify], x, y);
						[storyboard.spriteContainer addSubview:[self notificationView:x:y:[newEncounter notify]]];
						break;
					}
				}
			}
			
		}
	}
}

-(NSImageView*)notificationView :(int)x :(int)y :(NSString*)letter
{
	NSImageView *bubbleView = [[NSImageView alloc] initWithFrame:[position tile:4:x:y]];
	bubbleView.tag = tagNotifications;
	bubbleView.image = [NSImage imageNamed:[NSString stringWithFormat:@"fx.notification.1.png"]];
	
	CGFloat scaleFactor = 3.2;
	NSImageView *letterView = [[NSImageView alloc] initWithFrame:CGRectMake( (bubbleView.frame.size.width/2)-((bubbleView.frame.size.width/scaleFactor)/2), bubbleView.frame.size.height-(bubbleView.frame.size.width/scaleFactor)-(bubbleView.frame.size.height*0.025), bubbleView.frame.size.width/scaleFactor, bubbleView.frame.size.width/scaleFactor)];
	letterView.image = [NSImage imageNamed:[NSString stringWithFormat:@"letter%@.png",letter]];
	
	[letterView setImageScaling:NSImageScaleProportionallyUpOrDown];
	[bubbleView addSubview:letterView];
	
	return bubbleView;
}

-(void)gates
{
	NSLog(@"~  DRAW | Gates");
	for (int x = -2; x < 3; x++) {
		for (int y = -2; y < 3; y++) {
			
			Tile * tileCheck = [[Tile alloc] initWithString:[room tileAtLocation:x:y]];
			if( ![tileCheck isEvent] ){ continue; }
			
			// Event is a wall tile type
			for(NSImageView* subview in [storyboard.roomContainer subviews]) {
				if( subview.frame.origin.y == [position tile:5:x:y].origin.y && subview.frame.origin.x == [position tile:5:x:y].origin.x && subview.frame.size.width == [position tile:5:x:y].size.width && subview.frame.size.height == [position tile:5:x:y].size.height ){
					Encounter * newEncounter = [[Encounter alloc] initWithName:[tileCheck name]];
					
					if( ![[newEncounter see] isEqualToString:@""] ){
						NSLog(@"~  DRAW | Redrawing    : %@ at %d %d with %@", [tileCheck name], x, y, [newEncounter see]);
						if( y == 2 ){ subview.image = [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",[newEncounter see]]]; }
						else{ subview.image = [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",[newEncounter see]]]; }
						
					}
				}
			}
			
		}
	}
}

-(void)eraseBlockers
{
	NSMutableArray *viewsToRemove = [[NSMutableArray alloc] init];
	for(NSImageView* subview in [spriteContainer subviews])
	{
		if( subview.tag == tagBlockers ){
			[viewsToRemove addObject:subview];
		}
	}
	[viewsToRemove makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

-(void)blockers
{
	[self eraseBlockers];
	for (int x = -1; x < 2; x++) {
		for (int y = -1; y < 2; y++) {
			Tile * tileCheck = [[Tile alloc] initWithString:[room tileAtLocation:x:y]];
			if( ![[tileCheck name] isEqualToString:@""] ){
				[spriteContainer addSubview:[self spriteImageView :x:y:tileCheck]];
			}
		}
	}
}


-(void)animate
{
	eventTime += 1;
	
	// Event Frame
	if( eventTime == 1 ){ eventFrame = 1;}
	else if( eventTime == 2 ){ eventFrame = 2;}
	else if( eventTime == 3 ){ eventFrame = 3;}
	else if( eventTime == 4 ){ eventFrame = 2;}
	else if( eventTime >  4 ){ eventFrame = 1;}
	else { eventTime = 1; }
	
	// Character Frame
	if( eventTime <  7 ){ characterFrame = 1;}
	else if( eventTime == 8 ){ characterFrame = 2;}
	else if( eventTime == 9 ){ characterFrame = 3;}
	else if( eventTime ==10 ){ characterFrame = 2;}
	else { characterFrame = 1;}
	
	if( eventTime > 16 ){
		eventTime = 1;
	}
	
	[self events];
	[self character];
}

-(void)character
{
	if( ![[user vertical] isEqualToString:@"f"] ){ return; }
	if( ![[user state] isEqualToString:@"stand"] ){ return; }
	
	NSString * imageName = [NSString stringWithFormat:@"char%d.stand.%@.%@.%d",[user character],[user horizontal],[user vertical],characterFrame];
	storyboard.spriteCharacter.image = [NSImage imageNamed:imageName];
}

-(void)events
{
	for (int x = -1; x < 2; x++) {
		for (int y = -1; y < 2; y++) {
			
			Tile * tileCheck = [[Tile alloc] initWithString:[room tileAtLocation:x:y]];
			if( ![tileCheck isEvent] ){ continue; }
			
			// Event is a blocker tile type
			for(NSImageView* subview in [spriteContainer subviews]) {
				if( subview.frame.origin.y == [position tile:4:x:y].origin.y && subview.frame.origin.x == [position tile:4:x:y].origin.x && subview.frame.size.width == [position tile:4:x:y].size.width && subview.frame.size.height == [position tile:4:x:y].size.height ){
					Encounter * newEncounter = [[Encounter alloc] initWithName:[tileCheck name]];
					
					if( ![[newEncounter see] isEqualToString:@""] ){
						subview.image = [NSImage imageNamed:[NSString stringWithFormat:@"event.%@.%@.%d.png",[newEncounter see],[tileCheck extras],eventFrame ]];
					}
					else{
						subview.image = [NSImage imageNamed:[NSString stringWithFormat:@"event.%@.%@.%d.png",[tileCheck data],[tileCheck extras],eventFrame ]];
					}
				}
			}
		}
	}
}

-(void)dialog :(NSString*)dialog :(NSString*)characterId
{
    NSLog(@"~  DRAW | Dialog       | Message: %@ %@",dialog,characterId);
    
    storyboard.dialogContainer.hidden = NO;
    
    storyboard.dialogContainer.frame = storyboard.view.frame;
    
    CALayer *viewLayer = [CALayer layer];
    [viewLayer setBackgroundColor:CGColorCreateGenericRGB(0.0, 0.0, 0.0, 0.3)]; //RGB plus Alpha Channel
    [storyboard.dialogContainer setWantsLayer:YES]; // view's backing store is using a Core Animation Layer
    [storyboard.dialogContainer setLayer:viewLayer];
    
    storyboard.portraitImageView.frame = CGRectMake(storyboard.view.frame.size.width/6, 0, storyboard.view.frame.size.width/1.5, 240);
    storyboard.bubbleImageView.frame = storyboard.portraitImageView.frame;
    
    CGFloat viewCenter = storyboard.view.frame.size.width/2;
    storyboard.bubbleContainer.frame = CGRectMake(viewCenter-170, 35, 195, 70);
    CGFloat spellSize = storyboard.bubbleContainer.frame.size.height;
    
    storyboard.letterView1.frame = CGRectMake(0, 0, spellSize, spellSize);
    storyboard.letterView2.frame = CGRectMake(spellSize -10, 0, spellSize, spellSize);
    storyboard.letterView3.frame = CGRectMake(spellSize*2 -20, 0, spellSize, spellSize);
    
    [storyboard.portraitImageView setImageScaling:NSImageScaleProportionallyUpOrDown];
    [storyboard.bubbleImageView setImageScaling:NSImageScaleProportionallyUpOrDown];
    [storyboard.letterView1 setImageScaling:NSImageScaleProportionallyUpOrDown];
    [storyboard.letterView2 setImageScaling:NSImageScaleProportionallyUpOrDown];
    [storyboard.letterView3 setImageScaling:NSImageScaleProportionallyUpOrDown];
    
    storyboard.letterView1.image = [NSImage imageNamed:[NSString stringWithFormat:@"letter%@", [dialog substringWithRange:NSMakeRange(0, 1)] ]];
    storyboard.letterView2.image = [NSImage imageNamed:[NSString stringWithFormat:@"letter%@", [dialog substringWithRange:NSMakeRange(1, 1)] ]];
    storyboard.letterView3.image = [NSImage imageNamed:[NSString stringWithFormat:@"letter%@", [dialog substringWithRange:NSMakeRange(2, 1)] ]];
    storyboard.portraitImageView.image = [NSImage imageNamed:[NSString stringWithFormat:@"event.%@.portrait", characterId ]];
}

-(void)animateSpellbook
{
    NSLog(@"~  DRAW | spellbook");
    
    storyboard.interfaceContainer.frame = storyboard.view.frame;
    storyboard.spellsContainer.frame = CGRectMake((storyboard.view.frame.size.width)/2 - (([position tile:0 :0 :0].size.width)/2), storyboard.view.frame.size.height - 100, ([position tile:0 :0 :0].size.width)/3 * 3, ([position tile:0 :0 :0].size.width)/3);
    
    storyboard.spellView1.frame = CGRectMake(0, 0, storyboard.spellsContainer.frame.size.width/3, storyboard.spellsContainer.frame.size.width/3);
    storyboard.spellView2.frame = CGRectMake(storyboard.spellsContainer.frame.size.width/3, 0, storyboard.spellsContainer.frame.size.width/3, storyboard.spellsContainer.frame.size.width/3);
    storyboard.spellView3.frame = CGRectMake((storyboard.spellsContainer.frame.size.width/3)*2, 0, storyboard.spellsContainer.frame.size.width/3, storyboard.spellsContainer.frame.size.width/3);
    
    if( [user spell:0] > 0 ){ storyboard.spellView1.image = [NSImage imageNamed:[NSString stringWithFormat:@"letterSpell%d",[user spell:0]]]; }
    else{ storyboard.spellView1.image = [NSImage imageNamed:[NSString stringWithFormat:@"letterSpell0"]]; }
    
    if( [user spell:1] > 0 ){ storyboard.spellView2.image = [NSImage imageNamed:[NSString stringWithFormat:@"letterSpell%d",[user spell:1]]]; }
    else{ storyboard.spellView2.image = [NSImage imageNamed:[NSString stringWithFormat:@"letterSpell0"]]; }
    
    if( [user spell:2] > 0 ){ storyboard.spellView3.image = [NSImage imageNamed:[NSString stringWithFormat:@"letterSpell%d",[user spell:2]]]; }
    else{ storyboard.spellView3.image = [NSImage imageNamed:[NSString stringWithFormat:@"letterSpell0"]]; }
}

-(void)animateRoomPan
{
    NSLog(@"~  DRAW | animateRoomPan");
}

-(void)animateRoom
{
    NSLog(@"~  DRAW | animateRoom");
    storyboard.roomContainer.frame = CGRectOffset(storyboard.view.frame, 0, -100);
    storyboard.spriteContainer.frame = CGRectOffset(storyboard.view.frame, 0, -100);
	
	[storyboard.floor00 setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.floor1e setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.floore1 setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.floor10 setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.floor01 setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.floor0e setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.floore0 setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.floor11 setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.flooree setImageScaling:NSImageScaleProportionallyUpOrDown];
	
	
    storyboard.floor00.frame = [position tile:0 :0 :0];
    storyboard.floor1e.frame = [position tile:0 :1 :-1];
    storyboard.floore1.frame = [position tile:0 :-1 :1];
    storyboard.floor10.frame = [position tile:0 :1 :0];
    storyboard.floor01.frame = [position tile:0 :0 :1];
    storyboard.floor0e.frame = [position tile:0 :0 :-1];
    storyboard.floore0.frame = [position tile:0 :-1 :0];
    storyboard.floor11.frame = [position tile:0 :1 :1];
    storyboard.flooree.frame = [position tile:0 :-1 :-1];
    
    storyboard.floor00.image = [self tileImageAtId:0:0];
    storyboard.floor1e.image = [self tileImageAtId:1:-1];
    storyboard.floore1.image = [self tileImageAtId:-1:1];
    storyboard.floor10.image = [self tileImageAtId:1:0];
    storyboard.floor01.image = [self tileImageAtId:0:1];
    storyboard.floor0e.image = [self tileImageAtId:0:-1];
    storyboard.floore0.image = [self tileImageAtId:-1:0];
    storyboard.floor11.image = [self tileImageAtId:1:1];
    storyboard.flooree.image = [self tileImageAtId:-1:-1];
    
    storyboard.wall1l.frame = [position tile:5 :2 :-1];
    storyboard.wall2l.frame = [position tile:5 :2 : 0];
    storyboard.wall3l.frame = [position tile:5 :2 : 1];
    
    storyboard.wall1r.frame = [position tile:5 : -1 : 2];
    storyboard.wall2r.frame = [position tile:5 : 0 : 2];
    storyboard.wall3r.frame = [position tile:5 : 1 : 2];
    
    storyboard.step1l.frame = [position tile:0 :1 :-2];
    storyboard.step2l.frame = [position tile:0 :0 :-2];
    storyboard.step3l.frame = [position tile:0 :-1 :-2];
    
    storyboard.step1r.frame = [position tile:0 :-2 : -1];
    storyboard.step2r.frame = [position tile:0 :-2 : 0];
    storyboard.step3r.frame = [position tile:0 :-2 : 1];
    
    storyboard.wall1l.image = [self tileImageAtId:2:-1];
    storyboard.wall2l.image = [self tileImageAtId:2:0];
    storyboard.wall3l.image = [self tileImageAtId:2:1];
    storyboard.wall1r.image = [self tileImageAtId:1:2];
    storyboard.wall2r.image = [self tileImageAtId:0:2];
    storyboard.wall3r.image = [self tileImageAtId:-1:2];

    storyboard.step1l.image = [self tileImageAtId:1:-2];
    storyboard.step2l.image = [self tileImageAtId:0:-2];
    storyboard.step3l.image = [self tileImageAtId:-1:-2];
    storyboard.step1r.image = [self tileImageAtId:-2:-1];
    storyboard.step2r.image = [self tileImageAtId:-2:0];
    storyboard.step3r.image = [self tileImageAtId:-2:1];
	
    storyboard.spriteUser.frame = [position tile:4 :[user x] : [user y]];
    storyboard.spriteCharacter.frame = CGRectMake(0, 0, [position tile:4 :0 : 0].size.width, [position tile:4 :0 : 0].size.height);
    storyboard.spriteShadow.frame = CGRectMake(0, 0, [position tile:4 :0 : 0].size.width, [position tile:4 :0 : 0].size.height);
    storyboard.spriteCharacter.image = [NSImage imageNamed:[NSString stringWithFormat:@"char%d.stand.%@.%@.1",[user character],[user horizontal],[user vertical] ]];

    [self blockers];
	[self notifications];
	[self events];
	[self gates];
	[self updateDrawOrder];
}


-(void)eraseNotifications
{
	NSLog(@"~  DRAW | Notifications| Erase");
	
	NSMutableArray *viewsToRemove = [[NSMutableArray alloc] init];
	for(NSImageView* subview in [spriteContainer subviews])
	{
		if( subview.tag == tagNotifications ){
			[viewsToRemove addObject:subview];
		}
	}
	[viewsToRemove makeObjectsPerformSelector:@selector(removeFromSuperview)];
}


-(NSImageView*)spriteImageView :(int)x :(int)y :(Tile*)tile
{
	NSLog(@"~  DRAW | Sprite       | %@ -> %@", [tile type],[tile name]);
    NSImageView * newSprite = [[NSImageView alloc] initWithFrame:[position tile:4:x:y]];
    
    if( [[tile type] isEqualToString:@"event"] ){
        newSprite.image = [NSImage imageNamed:[NSString stringWithFormat:@"event.%@.%@.1",[tile data],[tile extras]]];
    }
    else if( [[tile type] isEqualToString:@"block"] ){
        newSprite.image = [NSImage imageNamed:[NSString stringWithFormat:@"blocker.%@",[tile name]]];
	}
	[newSprite setImageScaling:NSImageScaleProportionallyUpOrDown];
	
    newSprite.tag = tagBlockers;
    return newSprite;
}

-(void)animateWalk
{
    NSLog(@"~  DRAW | animateWalk");
	
	[user setState:@"walk"];
	
    storyboard.dialogContainer.hidden = YES;
    storyboard.spriteCharacter.image = [NSImage imageNamed:[NSString stringWithFormat:@"char%d.stand.%@.%@.1",[user character],[user horizontal],[user vertical] ]];
    storyboard.spriteCharacter.frame = CGRectMake(0, 0, [position tile:4 :0 : 0].size.width, [position tile:4 :0 : 0].size.height);
    storyboard.spriteShadow.frame = CGRectMake(0, 0, [position tile:4 :0 : 0].size.width, [position tile:4 :0 : 0].size.height);
	
	[user setEnabled:0];
	
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		context.duration = 0.25;
		[[storyboard.spriteUser animator] setFrame:[position tile:4 :[user x] : [user y]]];
	} completionHandler:^{
		[user setState:@"stand"];
		[user setEnabled:1];
	}];
	
	[self updateDrawOrder];
}

-(void)updateDrawOrder
{
	NSLog(@"~  DRAW | drawOrder    | Redraw");
	
	int count = 0;
	NSArray *tempArray = [[spriteContainer subviews] copy];
	
	[self eraseBlockers];
	
	for(NSImageView* subview in tempArray) {
		// Send at the back
		if( subview.frame.origin.y == [position tile:4:0:0].origin.y ){
			[spriteContainer addSubview:subview positioned:NSWindowBelow relativeTo:nil];
			count += 1;
		}
	}
	
	for(NSImageView* subview in tempArray) {
		// Send at the back
		if( subview.frame.origin.y == [position tile:4:0:1].origin.y ){
			[spriteContainer addSubview:subview positioned:NSWindowBelow relativeTo:nil];
			count += 1;
		}
		// Send at the front
		else if( subview.frame.origin.y == [position tile:4:0:-1].origin.y ){
			[spriteContainer addSubview:subview positioned:NSWindowAbove relativeTo:nil];
			count += 1;
		}
	}
	
	for(NSImageView* subview in tempArray) {
		// Send at the back
		if( subview.frame.origin.y == [position tile:4:1:1].origin.y ){
			[spriteContainer addSubview:subview positioned:NSWindowBelow relativeTo:nil];
			count += 1;
		}
		// Send at the front
		else if( subview.frame.origin.y == [position tile:4:-1:-1].origin.y ){
			[spriteContainer addSubview:subview positioned:NSWindowAbove relativeTo:nil];
			count += 1;
		}
	}
	
	NSLog(@"~  DRAW | drawOrder    | Redrawn %d views",count);
}

-(void)animateBlock
{
	NSLog(@"~  DRAW | animateBlock");
	
	storyboard.dialogContainer.hidden = YES;
	
	storyboard.spriteCharacter.image = [NSImage imageNamed:[NSString stringWithFormat:@"char%d.stand.%@.%@.1",[user character],[user horizontal],[user vertical] ]];
	
	storyboard.spriteCharacter.frame = CGRectMake(0, 0, [position tile:4 :0 : 0].size.width, [position tile:4 :0 : 0].size.height);
	storyboard.spriteShadow.frame = CGRectMake(0, 0, [position tile:4 :0 : 0].size.width, [position tile:4 :0 : 0].size.height);
	
	[user setEnabled:0];
	
	if( [[user horizontal] isEqualToString:@"r"] ){	storyboard.spriteUser.frame = CGRectOffset([position tile:4 :[user x] : [user y]], 5, 0); }
	if( [[user horizontal] isEqualToString:@"l"] ){	storyboard.spriteUser.frame = CGRectOffset([position tile:4 :[user x] : [user y]], 5, 0); }
	
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		context.duration = 0.25;
		[[storyboard.spriteUser animator] setFrame:[position tile:4 :[user x] : [user y]]];
	} completionHandler:^{
		[user setEnabled:1];
		[user setState:@"stand"];
	}];
}


-(void)animateTransform
{
    NSLog(@"~  DRAW | animateTransform");
    storyboard.spriteCharacter.image = [NSImage imageNamed:[NSString stringWithFormat:@"char%d.stand.%@.%@.1",[user character],[user horizontal],[user vertical] ]];
}

-(NSImage*)tileImageAtId :(int)x :(int)y
{
    Tile* tile = [[Tile alloc] initWithString:[room tileAtLocation:x :y]];
    
    if( x == 2 ){ return [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.r", [tile value] ]]; }
    if( y == 2 ){ return [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.l", [tile value] ]]; }
    if( y == -2 ){ return [NSImage imageNamed:[NSString stringWithFormat:@"step.%@.l", [tile value] ]]; }
    if( x == -2 ){ return [NSImage imageNamed:[NSString stringWithFormat:@"step.%@.r", [tile value] ]]; }
    
    return [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@", [tile value] ]];
}

@end

#if TARGET_OS_IPHONE
// iOS code
#else
// OSX code
#endif