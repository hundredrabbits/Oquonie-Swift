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
    NSLog(@"+  DRAW | Init(width:%f height:%f)",storyboard.view.frame.size.width,storyboard.view.frame.size.height);
    room = [[Room alloc] initWithArray:[world roomAtLocation:[user location]]];
    position = [[Position alloc] initWithView:storyboard.view.frame];
	
	[storyboard.spriteCharacter setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.spriteShadow setImageScaling:NSImageScaleProportionallyUpOrDown];
	
	[self isResized];
	
    return self;
}

-(void)layout
{
	NSLog(@"~  DRAW | Layout");
	
	storyboard.view.wantsLayer = YES;
	
	storyboard.roomContainer.frame = storyboard.view.frame;
	storyboard.spriteContainer.frame = storyboard.view.frame;
	storyboard.interfaceContainer.frame = storyboard.view.frame;
	storyboard.dialogContainer.frame = storyboard.view.frame;
	storyboard.vignette.frame = storyboard.view.frame;
	
	storyboard.dialogContainer.hidden = YES;
	storyboard.vignette.alphaValue = 0;
	
	[storyboard.vignette setImageScaling:NSImageScaleProportionallyUpOrDown];
	
	[self room];
	[self character];
}

-(void)isResized
{
	if( windowSize.size.width != storyboard.view.frame.size.width || windowSize.size.height != storyboard.view.frame.size.height ){
		NSLog(@"~  DRAW | Resized!!!");
		
		room = [[Room alloc] initWithArray:[world roomAtLocation:[user location]]];
		position = [[Position alloc] initWithView:storyboard.view.frame];
		
		[self layout];
	}
	windowSize = storyboard.view.frame;
}

# pragma mark Notifications -

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
				if( subview.tag == tagCharacter ){ continue; }
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
	int width  = [position tile:4:x:y].size.width;
	int height = [position tile:4:x:y].size.height;
	
	NSImageView *bubbleView = [[NSImageView alloc] initWithFrame:CGRectMake([position tile:4:x:y].origin.x, [position tile:4:x:y].origin.y, width, height)];
	bubbleView.tag = tagNotifications;
	bubbleView.image = [NSImage imageNamed:[NSString stringWithFormat:@"notification.%@",letter]];
	[bubbleView setImageScaling:NSImageScaleProportionallyUpOrDown];
	
	return bubbleView;
}

# pragma mark Notifications -

-(void)eraseBlockers
{
	NSMutableArray *viewsToRemove = [[NSMutableArray alloc] init];
	for(NSImageView* subview in [spriteContainer subviews])
	{
		if( subview.tag == tagCharacter ){ continue; }
		if( subview.tag == tagBlockers ){
			[viewsToRemove addObject:subview];
		}
	}
	[viewsToRemove makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

-(void)blockers
{
	NSLog(@"~  DRAW | Blockers");
	[self eraseBlockers];
	for (int x = -1; x < 2; x++) {
		for (int y = -1; y < 2; y++) {
			Tile * tileCheck = [[Tile alloc] initWithString:[room tileAtLocation:x:y]];
			if( ![[tileCheck name] isEqualToString:@""] ){
				NSLog(@"~  DRAW | Blocker      : %@",[tileCheck name]);
				[spriteContainer addSubview:[self spriteImageView :x:y:tileCheck]];
			}
		}
	}
}

-(void)map :(NSString*)name
{
	NSLog(@"~  DRAW | Map %@",name);
}

-(void)animationTimer
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
	[self isResized];
}

-(void)events
{
	for (int x = -1; x < 2; x++) {
		for (int y = -1; y < 2; y++) {
			
			Tile * tileCheck = [[Tile alloc] initWithString:[room tileAtLocation:x:y]];
			if( ![tileCheck isEvent] ){ continue; }
			
			// Event is a blocker tile type
			for(NSImageView* subview in [spriteContainer subviews]) {
				if( subview.tag == tagCharacter ){ continue; }
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

# pragma mark Dialog -

-(void)dialog :(NSString*)dialog :(NSString*)characterId
{
    NSLog(@"~  DRAW | Dialog       | Message: %@ %@",dialog,characterId);
	
	[user talking:1];
    
    storyboard.dialogContainer.hidden = NO;
	
	[[storyboard.dialogContainer animator] setAlphaValue:1];
	
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

-(void)closeDialog
{
	NSLog(@"~  DRAW | Dialog       | Close");
	
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		context.duration = 0.50;
		[[storyboard.dialogContainer animator] setAlphaValue:0];
	} completionHandler:^{
		[user talking:0];
	}];
}

# pragma mark Spellbook -

-(void)spellbookDisplay
{
    NSLog(@"~  DRAW | spellbook");
    
    storyboard.interfaceContainer.frame = storyboard.view.frame;
    storyboard.spellsContainer.frame = CGRectMake((storyboard.view.frame.size.width)/2 - (([position tile:0 :0 :0].size.width)/2), storyboard.view.frame.size.height - 100, ([position tile:0 :0 :0].size.width)/3 * 3, ([position tile:0 :0 :0].size.width)/3);
	
	storyboard.spellView1.frame = CGRectMake(0, 10, storyboard.spellsContainer.frame.size.width/3, storyboard.spellsContainer.frame.size.width/3);
	storyboard.spellView2.frame = CGRectMake(storyboard.spellsContainer.frame.size.width/3, 20, storyboard.spellsContainer.frame.size.width/3, storyboard.spellsContainer.frame.size.width/3);
	storyboard.spellView3.frame = CGRectMake((storyboard.spellsContainer.frame.size.width/3)*2, 30, storyboard.spellsContainer.frame.size.width/3, storyboard.spellsContainer.frame.size.width/3);
	
	[[storyboard.spellView1 animator] setAlphaValue:1];
	[[storyboard.spellView2 animator] setAlphaValue:1];
	[[storyboard.spellView3 animator] setAlphaValue:1];
	[[storyboard.spellView1 animator] setFrame:CGRectMake(0, 0, storyboard.spellsContainer.frame.size.width/3, storyboard.spellsContainer.frame.size.width/3)];
	[[storyboard.spellView2 animator] setFrame:CGRectMake(storyboard.spellsContainer.frame.size.width/3, 0, storyboard.spellsContainer.frame.size.width/3, storyboard.spellsContainer.frame.size.width/3)];
	[[storyboard.spellView3 animator] setFrame:CGRectMake((storyboard.spellsContainer.frame.size.width/3)*2, 0, storyboard.spellsContainer.frame.size.width/3, storyboard.spellsContainer.frame.size.width/3)];
	
    if( [user spell:0] > 0 ){ storyboard.spellView1.image = [NSImage imageNamed:[NSString stringWithFormat:@"letterSpell%d",[user spell:0]]]; }
    else{ storyboard.spellView1.image = [NSImage imageNamed:[NSString stringWithFormat:@"letterSpell0"]]; }
    
    if( [user spell:1] > 0 ){ storyboard.spellView2.image = [NSImage imageNamed:[NSString stringWithFormat:@"letterSpell%d",[user spell:1]]]; }
    else{ storyboard.spellView2.image = [NSImage imageNamed:[NSString stringWithFormat:@"letterSpell0"]]; }
    
    if( [user spell:2] > 0 ){ storyboard.spellView3.image = [NSImage imageNamed:[NSString stringWithFormat:@"letterSpell%d",[user spell:2]]]; }
    else{ storyboard.spellView3.image = [NSImage imageNamed:[NSString stringWithFormat:@"letterSpell0"]]; }
}

-(void)spellbookHide
{
	NSLog(@"~  DRAW | spellbook");
	
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		context.duration = 0.50;
		[[storyboard.spellView1 animator] setFrame:CGRectMake(0, 30, storyboard.spellsContainer.frame.size.width/3, storyboard.spellsContainer.frame.size.width/3)];
		[[storyboard.spellView2 animator] setFrame:CGRectMake(storyboard.spellsContainer.frame.size.width/3, 20, storyboard.spellsContainer.frame.size.width/3, storyboard.spellsContainer.frame.size.width/3)];
		[[storyboard.spellView3 animator] setFrame:CGRectMake((storyboard.spellsContainer.frame.size.width/3)*2, 10, storyboard.spellsContainer.frame.size.width/3, storyboard.spellsContainer.frame.size.width/3)];
		
		[[storyboard.spellView1 animator] setAlphaValue:0];
		[[storyboard.spellView2 animator] setAlphaValue:0];
		[[storyboard.spellView3 animator] setAlphaValue:0];
		
	} completionHandler:^{}];
	
}

-(void)animateRoomPan
{
    NSLog(@"~  DRAW | animateRoomPan");
}

-(void)eraseNotifications
{
	NSLog(@"~  DRAW | Notifications| Erase");
	
	NSMutableArray *viewsToRemove = [[NSMutableArray alloc] init];
	for(NSImageView* subview in [spriteContainer subviews])
	{
		if( subview.tag == tagCharacter ){ continue; }
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

# pragma mark Character -

-(void)character
{
	if( ![[user state] isEqualToString:@"stand"] ){ return; }
	
	NSString * imageName = [NSString stringWithFormat:@"char%d.stand.%@.%@.%d",[user character],[user horizontal],[user vertical],characterFrame];
	
	if( ![[user vertical] isEqualToString:@"f"] ){
		imageName = [NSString stringWithFormat:@"char%d.stand.%@.%@.1",[user character],[user horizontal],[user vertical]];
	}
	
	storyboard.spriteCharacter.image = [NSImage imageNamed:imageName];
}

-(void)animateWalk
{
	NSLog(@"~  DRAW | animateWalk");
	
	[user setState:@"walk"];

    storyboard.spriteCharacter.image = [NSImage imageNamed:[NSString stringWithFormat:@"char%d.stand.%@.%@.1",[user character],[user horizontal],[user vertical] ]];
    storyboard.spriteCharacter.frame = CGRectMake(0, 0, [position tile:4 :0 : 0].size.width, [position tile:4 :0 : 0].size.height);
    storyboard.spriteShadow.frame = CGRectMake(0, 0, [position tile:4 :0 : 0].size.width, [position tile:4 :0 : 0].size.height);
	
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		context.duration = 0.25;
		[[storyboard.spriteCharacter animator] setFrame:[position tile:4 :[user x] : [user y]]];
		[[storyboard.spriteShadow animator] setFrame:[position tile:4 :[user x] : [user y]]];
	} completionHandler:^{
		[user setState:@"stand"];
	}];
	
	// Animate Sequence
	[self characterWalkFrame1];
	[NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(characterWalkFrame2) userInfo:nil repeats:NO];
	[NSTimer scheduledTimerWithTimeInterval:0.30 target:self selector:@selector(character) userInfo:nil repeats:NO];
	
	[self animateContainers];
	[self updateDrawOrder];
}

-(void)characterWalkFrame1
{
	NSString * imageName = [NSString stringWithFormat:@"char%d.walk.%@.%@.1",[user character],[user horizontal],[user vertical]];
	storyboard.spriteCharacter.image = [NSImage imageNamed:imageName];
}
-(void)characterWalkFrame2
{
	NSString * imageName = [NSString stringWithFormat:@"char%d.walk.%@.%@.2",[user character],[user horizontal],[user vertical]];
	storyboard.spriteCharacter.image = [NSImage imageNamed:imageName];
}

# pragma mark Room -

-(void)room
{
	NSLog(@"~  DRAW | Room(%@)", [room theme]);
	
	storyboard.roomColor.frame = storyboard.view.frame;
	storyboard.parallaxFront.frame = storyboard.view.frame;
	storyboard.parallaxBack.frame = storyboard.view.frame;
	[storyboard.parallaxBack setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.parallaxFront setImageScaling:NSImageScaleProportionallyUpOrDown];
	
	[storyboard.view setWantsLayer: YES];
	[storyboard.roomColor setImageScaling:NSImageScaleAxesIndependently];
	
	if( [[room theme] isEqualToString:@"Black"] ){
		storyboard.roomColor.image = [NSImage imageNamed:@"fx.background.black"];
		storyboard.parallaxFront.image = [NSImage imageNamed:@"fx.parallax.3"];
		storyboard.parallaxBack.image = [NSImage imageNamed:@"fx.parallax.4"];
	}
	else if( [[room theme] isEqualToString:@"White"] ){
		storyboard.roomColor.image = [NSImage imageNamed:@"fx.background.white"];
		storyboard.parallaxFront.image = [NSImage imageNamed:@"fx.parallax.1"];
		storyboard.parallaxBack.image = [NSImage imageNamed:@"fx.parallax.2"];
	}
	
	[storyboard.floor00 setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.floor1e setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.floore1 setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.floor10 setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.floor01 setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.floor0e setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.floore0 setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.floor11 setImageScaling:NSImageScaleProportionallyUpOrDown];
	[storyboard.flooree setImageScaling:NSImageScaleProportionallyUpOrDown];
	
	// Animate Room
	
	[storyboard.floor11 setFrame:CGRectOffset([position tile:0 :1 :1], 0, (arc4random() % 10)+2 )];
	[storyboard.floor10 setFrame:CGRectOffset([position tile:0 :1 :0], 0, (arc4random() % 10)+2 )];
	[storyboard.floor1e setFrame:CGRectOffset([position tile:0 :1 :-1], 0, (arc4random() % 10)+2 )];
	[storyboard.floor01 setFrame:CGRectOffset([position tile:0 :0 :1], 0, (arc4random() % 10)+2 )];
	[storyboard.floor00 setFrame:CGRectOffset([position tile:0 :0 :0], 0, (arc4random() % 10)+2 )];
	[storyboard.floor0e setFrame:CGRectOffset([position tile:0 :0 :-1], 0, (arc4random() % 10)+2 )];
	[storyboard.floore1 setFrame:CGRectOffset([position tile:0 :-1 :1], 0, (arc4random() % 10)+2 )];
	[storyboard.floore0 setFrame:CGRectOffset([position tile:0 :-1 :0], 0, (arc4random() % 10)+2 )];
	[storyboard.flooree setFrame:CGRectOffset([position tile:0 :-1 :-1], 0, (arc4random() % 10)+2 )];
	
	[storyboard.wall1l setFrame:CGRectOffset([position tile:5 :2 :-1],0,(arc4random() % 10)+2 )];
	[storyboard.wall2l setFrame:CGRectOffset([position tile:5 :2 :0], 0, (arc4random() % 10)+2 )];
	[storyboard.wall3l setFrame:CGRectOffset([position tile:5 :2 :1], 0, (arc4random() % 10)+2 )];
	
	[storyboard.wall1r setFrame:CGRectOffset([position tile:5 :-1:2],0,(arc4random() % 10)+2 )];
	[storyboard.wall2r setFrame:CGRectOffset([position tile:5 :0 :2], 0, (arc4random() % 10)+2 )];
	[storyboard.wall3r setFrame:CGRectOffset([position tile:5 :1 :2], 0, (arc4random() % 10)+2 )];
	
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		context.duration = 1.5;
		[[storyboard.floor11 animator]  setFrame:[position tile:0 :1 :1]];
		[[storyboard.floor10 animator]  setFrame:[position tile:0 :1 :0]];
		[[storyboard.floor1e animator]  setFrame:[position tile:0 :1 :-1]];
		[[storyboard.floor01 animator]  setFrame:[position tile:0 :0 :1]];
		[[storyboard.floor00 animator]  setFrame:[position tile:0 :0 :0]];
		[[storyboard.floor0e animator]  setFrame:[position tile:0 :0 :-1]];
		[[storyboard.floore1 animator]  setFrame:[position tile:0 :-1 :1]];
		[[storyboard.floore0 animator]  setFrame:[position tile:0 :-1 :0]];
		[[storyboard.flooree animator]  setFrame:[position tile:0 :-1 :-1]];
		
		[[storyboard.wall1l animator] setFrame:[position tile:5 :2 :-1]];
		[[storyboard.wall2l animator] setFrame:[position tile:5 :2 : 0]];
		[[storyboard.wall3l animator] setFrame:[position tile:5 :2 : 1]];
		
		[[storyboard.wall1r animator] setFrame:[position tile:5 : -1 : 2]];
		[[storyboard.wall2r animator] setFrame:[position tile:5 : 0 : 2]];
		[[storyboard.wall3r animator] setFrame:[position tile:5 : 1 : 2]];
		
	} completionHandler:^{}];

	storyboard.step1l.frame = [position tile:0 :1 :-2];
	storyboard.step2l.frame = [position tile:0 :0 :-2];
	storyboard.step3l.frame = [position tile:0 :-1 :-2];
	
	storyboard.step1r.frame = [position tile:0 :-2 : -1];
	storyboard.step2r.frame = [position tile:0 :-2 : 0];
	storyboard.step3r.frame = [position tile:0 :-2 : 1];
	
	
	// Animate Character
	
	storyboard.spriteShadow.frame = [position tile:4 :[user x] : [user y]];
	storyboard.spriteCharacter.image = [NSImage imageNamed:[NSString stringWithFormat:@"char%d.stand.%@.%@.1",[user character],[user horizontal],[user vertical] ]];
	
	// Perform
	
	[self blockers];
	[self notifications];
	[self events];
	[self animateContainers];
	[self updateDrawOrder];
	[self roomSprites];
	
	[storyboard.spriteCharacter setFrame:CGRectOffset([position tile:4 :[user x] : [user y]], 0, 0)];
	[storyboard.spriteCharacter setAlphaValue:0];
	
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		context.duration = 0.5;
		[[storyboard.spriteCharacter animator] setAlphaValue:1];
	} completionHandler:^{
		NSLog(@"Animated entrance");
	}];
	
}

-(void)roomSprites
{
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
	
	storyboard.floor00.image = [self tileImageAtId:0:0];
	storyboard.floor1e.image = [self tileImageAtId:1:-1];
	storyboard.floore1.image = [self tileImageAtId:-1:1];
	storyboard.floor10.image = [self tileImageAtId:1:0];
	storyboard.floor01.image = [self tileImageAtId:0:1];
	storyboard.floor0e.image = [self tileImageAtId:0:-1];
	storyboard.floore0.image = [self tileImageAtId:-1:0];
	storyboard.floor11.image = [self tileImageAtId:1:1];
	storyboard.flooree.image = [self tileImageAtId:-1:-1];
	
	[self gates];
}

-(void)gates
{
	NSLog(@"~  DRAW | Gates        | char%d",[user character]);
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

-(void)roomShuffle
{
	NSMutableArray* tiles = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"9",@"10",@"16",@"17",@"18",@"19",@"38",@"32",@"33",@"34",@"35",@"36",@"37",@"28",@"29",@"30",@"31",@"39",@"40",nil];
	
	storyboard.floor11.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	storyboard.floor01.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	storyboard.floore1.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	
	storyboard.floor10.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	storyboard.floor00.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	storyboard.floore0.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	
	storyboard.floor1e.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	storyboard.floor0e.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	storyboard.flooree.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	
	NSMutableArray* walls = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",nil];
	
	storyboard.wall1l.image = [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",[self randomObject:walls]]];
	storyboard.wall2l.image = [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",[self randomObject:walls]]];
	storyboard.wall3l.image = [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",[self randomObject:walls]]];
	storyboard.wall1r.image = [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",[self randomObject:walls]]];
	storyboard.wall2r.image = [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",[self randomObject:walls]]];
	storyboard.wall3r.image = [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",[self randomObject:walls]]];
}

-(void)roomShuffle2
{
	NSMutableArray* tiles = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"9",@"10",@"38",@"32",@"33",@"34",@"35",@"36",@"37",@"28",@"29",@"30",@"31",@"39",@"40",nil];
	
	NSString* tileType1 = [self randomObject:tiles];
	NSString* tileType2 = [self randomObject:tiles];
	
	storyboard.floor11.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType1]];
	storyboard.floor01.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType2]];
	storyboard.floore1.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType1]];
	
	storyboard.floor10.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType2]];
	storyboard.floor00.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self randomObject:tiles]]];
	storyboard.floore0.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType2]];
	
	storyboard.floor1e.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType1]];
	storyboard.floor0e.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType2]];
	storyboard.flooree.image = [NSImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",tileType1]];
	
	NSMutableArray* walls = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"25",@"26",@"28",@"31",@"34",@"35",@"36",@"37",nil];
	
	NSString* wallType1 = [self randomObject:walls];
	NSString* wallType2 = [self randomObject:walls];
	
	NSMutableArray* door = [NSMutableArray arrayWithObjects:@"30",@"10",@"11",@"12",@"13",@"14",nil];
	
	NSString* doorType = [self randomObject:door];
	
	storyboard.wall1l.image = [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",wallType2]];
	storyboard.wall2l.image = [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",doorType]];
	storyboard.wall3l.image = [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",wallType2]];
	storyboard.wall1r.image = [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",wallType1]];
	storyboard.wall2r.image = [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",doorType]];
	storyboard.wall3r.image = [NSImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",wallType1]];
	
	NSMutableArray* step = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",nil];
	
	NSString* steptype = [self randomObject:step];
	
	storyboard.step2l.image = [NSImage imageNamed:[NSString stringWithFormat:@"step.%@.l.png",steptype]];
	storyboard.step2r.image = [NSImage imageNamed:[NSString stringWithFormat:@"step.%@.r.png",steptype]];
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
	
	for(NSImageView* subview in tempArray) {
		// Send at the back
		if( subview.tag == tagNotifications ){
			[spriteContainer addSubview:subview positioned:NSWindowAbove relativeTo:nil];
			count += 1;
		}
	}
	
	NSLog(@"~  DRAW | drawOrder    | Redrawn %d views",count);
}

-(void)animateContainers
{
	CGFloat verticalOffset = (storyboard.view.frame.size.height / 10);
	CGFloat offsetScale = (storyboard.view.frame.size.height / 200);
	
	verticalOffset = 0;
	
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		context.duration = 0.5;
		
		[[storyboard.parallaxFront animator] setFrame:CGRectOffset(storyboard.view.frame, ([user x]*[user y])*4, ([user x]+[user y])*-4)];
		[[storyboard.parallaxBack animator] setFrame:CGRectOffset(storyboard.view.frame, ([user x]*[user y])*2, ([user x]+[user y])*-2)];
		
		[[storyboard.roomContainer animator] setFrame:CGRectOffset(storyboard.view.frame, ([user x])*offsetScale, (([user x]+[user y])*offsetScale*-1)-verticalOffset )];
		[[storyboard.spriteContainer animator] setFrame:CGRectOffset(storyboard.view.frame, ([user x])*offsetScale, (([user x]+[user y])*offsetScale*-1)-verticalOffset )];
		
	} completionHandler:^{
		
	}];
}

-(void)animateBlock
{
	NSLog(@"~  DRAW | animateBlock");
	
	storyboard.spriteCharacter.image = [NSImage imageNamed:[NSString stringWithFormat:@"char%d.stand.%@.%@.1",[user character],[user horizontal],[user vertical] ]];
	
	[user setEnabled:0];
	
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		
		context.duration = 0.15;
		[[storyboard.spriteCharacter animator] setFrame:CGRectOffset([position tile:4 :[user x] : [user y]], 0, 10)];
		
	} completionHandler:^{
		
		[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
			context.duration = 0.07;
			[[storyboard.spriteCharacter animator] setFrame:[position tile:4 :[user x] : [user y]]];
		} completionHandler:^{
			[user setEnabled:1];
			[user setState:@"stand"];
		}];
		
	}];
}

-(void)animateTransform :(int)nextCharacter
{
	int currentCharacter = [user character];
    NSLog(@"~  DRAW | Transform    | From %d to %d",currentCharacter, nextCharacter);
    storyboard.spriteCharacter.image = [NSImage imageNamed:[NSString stringWithFormat:@"char%d.stand.%@.%@.1",[user character],[user horizontal],[user vertical] ]];
	
	[user setEnabled:0];
	[user setState:@"warp"];
	[user setHorizontal:@"l"];
	[user setVertical:@"f"];
	[user setLock:1];
	[self spellbookHide];
	
	NSString * warpImage = [NSString stringWithFormat:@"char%d.warp.l.f.1",currentCharacter];
	storyboard.spriteCharacter.image = [NSImage imageNamed:warpImage];
	
	// Character
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		context.duration = 1.0;
		[[storyboard.spriteCharacter animator] setFrame:CGRectOffset([position tile:4 :[user x]:[user y]], 0, 50)];
		[[storyboard.spriteShadow animator] setAlphaValue:0];
	} completionHandler:^{
		
		[self spellbookHide];
		
		[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
			context.duration = 1.5;
			[[storyboard.spriteCharacter animator] setFrame:CGRectOffset([position tile:4 :[user x] : [user y]], 0, 25)];
		} completionHandler:^{
			
			NSString * warpImage = [NSString stringWithFormat:@"char%d.warp.l.f.1",nextCharacter];
			storyboard.spriteCharacter.image = [NSImage imageNamed:warpImage];
			storyboard.vignette.alphaValue = 1;
			storyboard.vignette.image = [NSImage imageNamed:@"fx.vignette.1.horizontal"];
			[storyboard.vignette setImageScaling:NSImageScaleAxesIndependently];
			
			[self roomSprites];
			
			[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
				context.duration = 1.0;
				[[storyboard.spriteCharacter animator] setFrame:CGRectOffset([position tile:4 :[user x] : [user y]], 0, 30)];
			} completionHandler:^{
				
				[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
					context.duration = 1.0;
					[[storyboard.spriteCharacter animator] setFrame:CGRectOffset([position tile:4 :[user x] : [user y]], 0, 0)];
					[storyboard.vignette setAlphaValue:0];
					[[storyboard.spriteShadow animator] setAlphaValue:1];
				} completionHandler:^{
					
					NSString * warpImage = [NSString stringWithFormat:@"char%d.stand.l.f.1",nextCharacter];
					storyboard.spriteCharacter.image = [NSImage imageNamed:warpImage];
					[user setLock:0];
					[user setState:@"stand"];
					[user setEnabled:1];
					storyboard.vignette.alphaValue = 0;
					[storyboard.vignette setImageScaling:NSImageScaleProportionallyUpOrDown];
					
				}];
				
			}];
			
		}];
		
	}];
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

- (id)randomObject :(NSArray*)array
{
	id randomObject = [array count] ? array[arc4random_uniform((u_int32_t)[array count])] : nil;
	return randomObject;
}

-(void)vignette
{
	NSLog(@"~  DRAW | Vignette");
	
	storyboard.vignette.image = [NSImage imageNamed:@"fx.vignette.1.horizontal"];
	[storyboard.vignette setImageScaling:NSImageScaleAxesIndependently];

	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		context.duration = 0.5;
		[[storyboard.vignette animator] setAlphaValue:1];
	} completionHandler:^{
		[[storyboard.vignette animator] setAlphaValue:0];
		storyboard.vignette.image = [NSImage imageNamed:@"fx.vignette.1.horizontal"];
		[storyboard.vignette setImageScaling:NSImageScaleAxesIndependently];
	}];
}

# pragma mark Sequences -

-(void)sequenceWarpTo:(int)destination
{
	[user setPosition:0 :0];
	[self animateWalk];
	[user setEnabled:0];
	
	eventTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(sequenceWarpAnimation:) userInfo:@(destination) repeats:NO];
}

-(void)sequenceWarpAnimation:(NSTimer *)timer
{
	int destination = [[timer userInfo] intValue];
	
	[user setState:@"warp"];
	[user setLock:1];
	[user setHorizontal:@"l"];
	[user setVertical:@"f"];
	
	NSString * warpImage = [NSString stringWithFormat:@"char%d.warp.l.f.1",user.character];
	storyboard.spriteCharacter.image = [NSImage imageNamed:warpImage];
	
	// Character
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		context.duration = 3.0;
		[[storyboard.spriteCharacter animator] setFrame:CGRectOffset([position tile:4 :[user x] : [user y]], 0, 50)];
		[[storyboard.spriteShadow animator] setAlphaValue:0];
	} completionHandler:^{
		
		[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
			context.duration = 3.0;
			[[storyboard.spriteCharacter animator] setFrame:[position tile:4 :[user x] : [user y]]];
			[[storyboard.spriteShadow animator] setAlphaValue:1];
		} completionHandler:^{
			
			NSString * warpImage = [NSString stringWithFormat:@"char%d.stand.l.f.1",user.character];
			storyboard.spriteCharacter.image = [NSImage imageNamed:warpImage];
			[user setEnabled:1];
			[user setLock:0];
		}];
	}];
	
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		
		context.duration = 2.0;
		[[storyboard.floor11 animator] setFrame:CGRectOffset([position tile:0 :1 :1], 0, (arc4random() % 25) )];
		[[storyboard.floor10 animator] setFrame:CGRectOffset([position tile:0 :1 :0], 0, (arc4random() % 25) )];
		[[storyboard.floor1e animator] setFrame:CGRectOffset([position tile:0 :1 :-1], 0, (arc4random() % 25) )];
		[[storyboard.floor01 animator] setFrame:CGRectOffset([position tile:0 :0 :1], 0, (arc4random() % 25) )];
		[[storyboard.floor00 animator] setFrame:CGRectOffset([position tile:0 :0 :0], 0, (arc4random() % 25) )];
		[[storyboard.floor0e animator] setFrame:CGRectOffset([position tile:0 :0 :-1], 0, (arc4random() % 25) )];
		[[storyboard.floore1 animator] setFrame:CGRectOffset([position tile:0 :-1 :1], 0, (arc4random() % 25) )];
		[[storyboard.floore0 animator] setFrame:CGRectOffset([position tile:0 :-1 :0], 0, (arc4random() % 25) )];
		[[storyboard.flooree animator] setFrame:CGRectOffset([position tile:0 :-1 :-1], 0, (arc4random() % 25) )];
		
		[[storyboard.wall1l animator] setFrame:CGRectOffset([position tile:5 :2 :-1],0,(arc4random() % 35) )];
		[[storyboard.wall2l animator] setFrame:CGRectOffset([position tile:5 :2 :0], 0, (arc4random() % 35) )];
		[[storyboard.wall3l animator] setFrame:CGRectOffset([position tile:5 :2 :1], 0, (arc4random() % 35) )];
		
		[[storyboard.wall1r animator] setFrame:CGRectOffset([position tile:5 :-1:2],0,(arc4random() % 35) )];
		[[storyboard.wall2r animator] setFrame:CGRectOffset([position tile:5 :0 :2], 0, (arc4random() % 35) )];
		[[storyboard.wall3r animator] setFrame:CGRectOffset([position tile:5 :1 :2], 0, (arc4random() % 35) )];
		
		[[storyboard.roomContainer animator] setAlphaValue:0];
		
		[[storyboard.parallaxFront animator] setFrame:CGRectOffset(storyboard.view.frame, 0, 50 )];
		[[storyboard.parallaxBack animator] setFrame:CGRectOffset(storyboard.view.frame, 0, 75 )];
		
	} completionHandler:^{
		
		[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
			
			[user setLocation:destination];
			room = [[Room alloc] initWithArray:[world roomAtLocation:[user location]]];
			[self roomSprites];
			
			// Draw Blockers
			
			[self blockers];
			[self updateDrawOrder];
			
			for(NSImageView* subview in [spriteContainer subviews]) {
				if( subview.tag != tagBlockers ){ continue; }
				CGRect targetPos = subview.frame;
				subview.frame = CGRectOffset(targetPos, 0, (arc4random() % 50)+5 );
				subview.alphaValue = 0;
				
				[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
					context.duration = 3.5;
					[[subview animator]  setFrame:targetPos];
					[[subview animator]  setAlphaValue:1];
				} completionHandler:^{}];
				
			}
			
			context.duration = 4.0;
			
			[[storyboard.floor11 animator]  setFrame:[position tile:0 :1 :1]];
			[[storyboard.floor10 animator]  setFrame:[position tile:0 :1 :0]];
			[[storyboard.floor1e animator]  setFrame:[position tile:0 :1 :-1]];
			[[storyboard.floor01 animator]  setFrame:[position tile:0 :0 :1]];
			[[storyboard.floor00 animator]  setFrame:[position tile:0 :0 :0]];
			[[storyboard.floor0e animator]  setFrame:[position tile:0 :0 :-1]];
			[[storyboard.floore1 animator]  setFrame:[position tile:0 :-1 :1]];
			[[storyboard.floore0 animator]  setFrame:[position tile:0 :-1 :0]];
			[[storyboard.flooree animator]  setFrame:[position tile:0 :-1 :-1]];
			
			[[storyboard.wall1l animator] setFrame:[position tile:5 :2 :-1]];
			[[storyboard.wall2l animator] setFrame:[position tile:5 :2 : 0]];
			[[storyboard.wall3l animator] setFrame:[position tile:5 :2 : 1]];
			
			[[storyboard.wall1r animator] setFrame:[position tile:5 : -1 : 2]];
			[[storyboard.wall2r animator] setFrame:[position tile:5 : 0 : 2]];
			[[storyboard.wall3r animator] setFrame:[position tile:5 : 1 : 2]];
			
			[[storyboard.roomContainer animator] setAlphaValue:1];
			
			[[storyboard.parallaxFront animator] setFrame:storyboard.view.frame];
			[[storyboard.parallaxBack animator] setFrame:storyboard.view.frame];
			[[storyboard.parallaxFront animator] setAlphaValue:1];
			[[storyboard.parallaxBack animator] setAlphaValue:1];
			
		} completionHandler:^{
			[self roomSprites];
		}];
		
	}];
}

-(void)sequenceResetTree
{
	
}

-(void)sequenceEndRed
{
	
}

-(void)sequenceCredits1
{
	
}

-(void)sequenceCredits2
{
	
}

-(void)sequenceCredits3
{
	
}

-(void)sequenceRamen
{
	NSLog(@"~  DRAW | sequenceIntro");
	[self eraseBlockers];
	[self blockers];
	[self vignette];
}

-(void)sequenceIntro
{
	NSLog(@"~  DRAW | sequenceIntro");
	[self cameraShake:0];
}

-(void)cameraShake:(int)tremor
{
	int minimum = (tremor*-1)/5;
	int maximum = (tremor)/5;
	int valX = random(minimum,maximum);
	int valY = random(minimum,maximum);
	
	if(tremor == 50){ storyboard.floor0e.image = [NSImage imageNamed:@"tile.4.png"]; }
	if(tremor == 110){ storyboard.wall2l.image = [NSImage imageNamed:@"wall.34.r.png"]; }
	if(tremor == 130){ storyboard.floore1.image = [NSImage imageNamed:@"tile.5.png"]; }
	if(tremor == 140){ storyboard.wall3r.image = [NSImage imageNamed:@"wall.26.l.png"]; }
	if(tremor == 150){ storyboard.floor01.image = [NSImage imageNamed:@"tile.6.png"]; }
	if(tremor == 170){ storyboard.floor1e.image = [NSImage imageNamed:@"tile.4.png"]; }
	if(tremor == 180){ storyboard.wall3l.image = [NSImage imageNamed:@"wall.26.r.png"]; }
	if(tremor == 190){ storyboard.step2l.image = [NSImage imageNamed:@"step.9.l.png"]; }
	if(tremor == 200){ storyboard.wall1r.image = [NSImage imageNamed:@"wall.15.l.png"]; }
	if(tremor == 200){ storyboard.wall1l.image = [NSImage imageNamed:@"wall.26.r.png"]; }
	if(tremor == 200){ storyboard.wall2r.image = [NSImage imageNamed:@"wall.40.l.png"]; }
	
	if(tremor < 201){
		[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
			context.duration = 0.03;
			[[storyboard.roomContainer animator] setFrame:CGRectOffset(storyboard.view.frame, valX/10, valY/10)];
			[[storyboard.spriteContainer animator] setFrame:CGRectOffset(storyboard.view.frame, valX/10, valY/10)];
		} completionHandler:^{
			[self cameraShake:tremor+1];
		}];
	}
	else{
		[render router:[[Event alloc] initWarp:31:0:0]];
	}
}


-(void)sequenceRedSight
{
	NSLog(@"~  DRAW | sequenceRedSight");
	
	[user setEnabled:0];
	
	// Look for red ghost
	NSImageView * redGhostView = [self findViewWithName:@"redGhost"];
	
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		context.duration = 3.0;
		[[redGhostView animator] setAlphaValue:0];
	} completionHandler:^{
		
		if( [user location] == 31 ){ [user eventCollect:storageGhostOffice];		}
		if( [user location] == 36 ){ [user eventCollect:storageGhostNecomedre];		}
		if( [user location] == 40 ){ [user eventCollect:storageGhostNephtaline];	}
		if( [user location] == 68 ){ [user eventCollect:storageGhostNeomine];		}
		if( [user location] == 36 ){ [user eventCollect:storageGhostNecomedre];		}
		if( [user location] == 86 ){ [user eventCollect:storageGhostNestorine];		}
		
		[user setEnabled:1];
	}];
}

-(void)sequenceRedHide
{
	NSLog(@"~  DRAW | sequenceRedHide");
	
	[[self findViewWithName:@"redGhost"] setAlphaValue:0];
}

-(NSImageView*)findViewWithName:(NSString*)name
{
	NSImageView * target = [[NSImageView alloc] init];
	for (int x = -1; x < 2; x++) {
		for (int y = -1; y < 2; y++) {
			
			Tile * tileCheck = [[Tile alloc] initWithString:[room tileAtLocation:x:y]];
			if( ![tileCheck isEvent] ){ continue; }
			if( ![[tileCheck name] isEqualToString:name] ){ continue; }
			NSLog(@"Seeing: %@", [tileCheck name]);
			// Event is a blocker tile type
			for(NSImageView* subview in [spriteContainer subviews]) {
				 if( subview.frame.origin.y == [position tile:4:x:y].origin.y && subview.frame.origin.x == [position tile:4:x:y].origin.x && subview.frame.size.width == [position tile:4:x:y].size.width && subview.frame.size.height == [position tile:4:x:y].size.height ){
					 return subview;
				 }
			}
		}
	}
	
	NSLog(@"Could not find the target view: %@", name);
	
	return target;
}

@end



#if TARGET_OS_IPHONE
// iOS code
#else
// OSX code
#endif