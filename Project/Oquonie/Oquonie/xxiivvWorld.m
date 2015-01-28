//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvVariables.h"
#import "xxiivvSettings.h"

#import "xxiivvWorld.h"
#import "xxiivvEvents.h"
#import "xxiivvUtils.h"

#import "worldLobby.h"
#import "worldNecomedre.h"		// Chapter I
#import "worldNephtaline.h"		// Chapter II
#import "worldNemedique.h"		// Chapter III
#import "worldNestorine.h"		// Chapter IV
#import "worldNeomine.h"		// Chapter V
#import "worldSecret.h"			// Chapter *
#import "worldNastazie.h"		// Chapter VI

//#import "worldNecostrate.h"		// Chapter: Bonus
//#import "worldNelorianne.h"		// Chapter: Bonus

@implementation xxiivvViewController (world)

-(void)worldStart
{
	worldNode = [NSMutableArray arrayWithObjects:@"",nil];
	int myCount = 0;
	while ( myCount < 160 )	{ myCount++; worldNode[myCount] = @[];	}

	// 0 - 19
	[self createWorldLobby];
	// 20 - 39
	[self createWorldNecomedre];
	// 40 - 59
	[self createWorldNephtaline];
	// 60 - 79
	[self createWorldNeomine];
	// 80 - 99
	[self createWorldNestorine];
	// 100 - 99
	[self createWorldNemedique];
	// 110 - >
	[self createWorldSecret];
	// 130
	[self createWorldNastazie];
}

- (NSString*) tileParser :(NSString*)tileString :(int)index
{
	int exception = 0;
	// Ignore if index is 99
	if(index == 99){
		index = 0;
		exception = 1;
	}
	
	NSArray* array = [tileString componentsSeparatedByString: @"|"];
	if( [array count] < (index+1) && index > 0 ){
		return 0;
	}
	
	// Catch if event is broadcasting an update
	if( [array count] > 2 && exception == 0){
		// Update event
		if( [[array objectAtIndex: 1] isEqualToString:@"event"] && index == 3 ){
			return [self tileParserUpdate:array:index];
		}
		// Update tile
		else if( [[array objectAtIndex: 1] isEqualToString:@"event"] && index == 0 && [array count] < 4){
			return [self tileParserUpdate:array:index];
		}
	}
	
	return [array objectAtIndex:index];
}

-(NSString*)tileParserUpdate :(NSArray*)eventArray :(int)index
{
	// Contact event
	#pragma clang diagnostic push
	#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
	NSString *eventSelector = [NSString stringWithFormat:@"event_%@:",[eventArray objectAtIndex:2]];
	NSString *eventUpdate = [self performSelector:NSSelectorFromString(eventSelector) withObject:@"postUpdate"];
	#pragma clang diagnostic pop
	
	if(![eventUpdate isEqualToString:@""]){
		return eventUpdate;
	}
	
	return [eventArray objectAtIndex:index];
}

-(void)roomStart
{
	NSLog(@"------- - ------------ - -------------------");
	NSLog(@"!  ROOM | Load..       * %d:%@", userLocation, worldNode[userLocation][21]);
	NSLog(@"------- - ------------ - -------------------");
	
	self.debugLocation.text = [NSString stringWithFormat:@"Node:v%d_n%d - %@(%@)",systemBuild,userLocation,worldNode[userLocation][21],worldNode[userLocation][23]];
	
	[self roomClearParallax];
	[self roomClearSprites];
	[self roomClearNotifications];
	
	[self roomGenerateAudioTrack];
	[self roomGenerateTiles];
	[self roomGenerateBlockers];
	[self roomGenerateEvents];
	[self roomGenerateNotifications];
	[self roomGenerateBackground];
	
	worldTimerNotifications = 4;
}

-(void)roomGenerateTiles
{
	self.floor00.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][4]:0]] ];
	self.floor1e.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][8]:0]] ];
	self.floore1.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][0]:0]] ];
	self.floor10.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][1]:0]] ];
	self.floor01.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][5]:0]] ];
	self.floor0e.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][3]:0]] ];
	self.floore0.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][7]:0]] ];
	self.floor11.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][2]:0]] ];
	self.flooree.image = [UIImage imageNamed:[NSString stringWithFormat:@"tile.%@.png",[self tileParser:worldNode[userLocation][6]:0]] ];
	
	self.wall1l.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",[self tileParser:worldNode[userLocation][9]:0]] ];
	self.wall2l.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",[self tileParser:worldNode[userLocation][10]:0]] ];
	self.wall3l.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.r.png",[self tileParser:worldNode[userLocation][11]:0]] ];
	self.wall1r.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",[self tileParser:worldNode[userLocation][14]:0]] ];
	self.wall2r.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",[self tileParser:worldNode[userLocation][13]:0]] ];
	self.wall3r.image = [UIImage imageNamed:[NSString stringWithFormat:@"wall.%@.l.png",[self tileParser:worldNode[userLocation][12]:0]] ];
	
	self.step1l.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.l.png",[self tileParser:worldNode[userLocation][15]:99]] ];
	self.step2l.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.l.png",[self tileParser:worldNode[userLocation][16]:99]] ];
	self.step3l.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.l.png",[self tileParser:worldNode[userLocation][17]:99]] ];
	self.step1r.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.r.png",[self tileParser:worldNode[userLocation][18]:99]] ];
	self.step2r.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.r.png",[self tileParser:worldNode[userLocation][19]:99]] ];
	self.step3r.image = [UIImage imageNamed:[NSString stringWithFormat:@"step.%@.r.png",[self tileParser:worldNode[userLocation][20]:99]] ];
}

-(void)roomGenerateBlockers
{
	int tileId = 0;
	for (NSString *tile in worldNode[userLocation]) {
		if( [[self tileParser:tile :1] isEqualToString:@"block"] ){
			NSLog(@"+  ROOM | Blockers     | Generate -> #%@ x:%d y:%d", [self tileParser:tile :2], [self flattenTileId:tileId :@"x"], [self flattenTileId:tileId :@"y"] );
			UIImageView *newView = [[UIImageView alloc] initWithFrame:[self tileLocation:4 :[self flattenTileId:tileId :@"x"] :[self flattenTileId:tileId :@"y"]]];
			newView.tag = 10;
			newView.image = [UIImage imageNamed:[NSString stringWithFormat:@"blocker.%@.png",[self tileParser:tile :2]]];
			[self.spritesContainer addSubview:newView];
		}
		tileId += 1;
	}
}

-(void)roomGenerateEvents
{
	int tileId = 0;
	for (NSString *tile in worldNode[userLocation]) {
		if( [[self tileParser:tile :1] isEqualToString:@"event"] ){
			NSLog(@"+  ROOM | Events       | Generate -> %@ x:%d y:%d", [self tileParser:tile :2], [self flattenTileId:tileId :@"x"], [self flattenTileId:tileId :@"y"] );
			
			UIImageView *newView = [[UIImageView alloc] initWithFrame:[self tileLocation:4 :[self flattenTileId:tileId :@"x"] :[self flattenTileId:tileId :@"y"]]];
			newView.tag = 20;
			
			if([self tileParser:tile :3]){
				newView.image = [UIImage imageNamed:[NSString stringWithFormat:@"event.%@.%@.1.png",[self tileParser:tile :3],[self tileParser:tile :4]]];
			}
			[self.spritesContainer addSubview:newView];
		}
		tileId += 1;
	}
}

-(void)roomGenerateNotifications
{
	int tileId = -1; // ...
	for (NSString *tile in worldNode[userLocation]) {
		tileId += 1;
		// Skip if not an event
		if( ![[self tileParser:tile :1] isEqualToString:@"event"] ){ continue; }
		// Skip if has no notification
		NSString *eventSelector = [NSString stringWithFormat:@"event_%@:",[self tileParser:tile :2]];
		
		#pragma clang diagnostic push
		#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
		NSString *notificationLetter = [self performSelector:NSSelectorFromString(eventSelector) withObject:@"postNotification"];
		#pragma clang diagnostic pop
		
		if([notificationLetter isEqualToString:@""]){ continue; }
        
		// Notification
		
		NSLog(@"+ NOTIF | Notification | Generate -> %@", [self tileParser:tile :2]);
		
		CGRect bubbleViewFrame = CGRectOffset([self tileLocation:4 :[self flattenTileId:tileId :@"x"] :[self flattenTileId:tileId :@"y"]], 10, -10);
		UIImageView *bubbleView = [[UIImageView alloc] initWithFrame:CGRectOffset(bubbleViewFrame, 0, 5)];
		bubbleView.tag = 30;
		bubbleView.image = [UIImage imageNamed:[NSString stringWithFormat:@"fx.notification.1.png"]];
		
			UIImageView *letterView = [[UIImageView alloc] initWithFrame:CGRectMake( (bubbleView.frame.size.width/2)-(bubbleView.frame.size.width/2.2/2), bubbleView.frame.size.width/32, bubbleView.frame.size.width/2.2, bubbleView.frame.size.width/2.2)];
			letterView.image = [UIImage imageNamed:[NSString stringWithFormat:@"letter%@.png",notificationLetter]];
			letterView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
			[bubbleView addSubview:letterView];
		
		bubbleView.alpha = 0;
		
		[UIView animateWithDuration:0.5 animations:^(void){
			bubbleView.frame = bubbleViewFrame;
			bubbleView.alpha = 1;
		} completion:^(BOOL finished){}];
		
		[self.spritesContainer addSubview:bubbleView];
		
	}
}

-(void)roomGenerateAudioTrack
{
	if(![worldAudio isEqualToString:worldNode[userLocation][23] ]){
		NSLog(@"•  ROOM | Audio        | Update   -> %@",worldNode[userLocation][23]);
		[self audioAmbientPlayer:[NSString stringWithFormat:@"%@.mp3",worldNode[userLocation][23]]];
		worldAudio = worldNode[userLocation][23];
	}
}

-(void)roomGenerateBackground
{
	if(![worldBackground isEqualToString:worldNode[userLocation][22] ]){
		NSLog(@"•  ROOM | Background   | Update   -> %@",worldNode[userLocation][22]);
		worldBackground = worldNode[userLocation][22];
		// Start Game
		if([worldBackground isEqualToString:@"Black"] && userGameCompleted == 0){
			[UIView animateWithDuration:1.0 animations:^{
				self.roomBackground.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1];
			} completion:NULL];
			self.parallaxFront.image = [UIImage imageNamed:@"fx.parallax.3.png"];
			self.parallaxBack.image = [UIImage imageNamed:@"fx.parallax.4.png"];
			self.debugLocation.textColor = [UIColor whiteColor];
		}
		if([worldBackground isEqualToString:@"White"] && userGameCompleted == 0){
			[UIView animateWithDuration:1.0 animations:^{
				self.roomBackground.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
			} completion:NULL];
			self.parallaxFront.image = [UIImage imageNamed:@"fx.parallax.1.png"];
			self.parallaxBack.image = [UIImage imageNamed:@"fx.parallax.2.png"];
			self.debugLocation.textColor = [UIColor blackColor];
		}
		// End Game
		if([worldBackground isEqualToString:@"Black"] && userGameCompleted == 1){
			[UIView animateWithDuration:1.0 animations:^{
				self.roomBackground.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
			} completion:NULL];
			self.parallaxFront.image = [UIImage imageNamed:@"fx.parallax.1.png"];
			self.parallaxBack.image = [UIImage imageNamed:@"fx.parallax.2.png"];
			self.debugLocation.textColor = [UIColor redColor];
		}
		if([worldBackground isEqualToString:@"White"] && userGameCompleted == 1){
			[UIView animateWithDuration:1.0 animations:^{
				self.roomBackground.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1];
			} completion:NULL];
			self.parallaxFront.image = [UIImage imageNamed:@"fx.parallax.3.png"];
			self.parallaxBack.image = [UIImage imageNamed:@"fx.parallax.4.png"];
			self.debugLocation.textColor = [UIColor blackColor];
		}
		// End Game
		if([worldBackground isEqualToString:@"Pest"]){
			[UIView animateWithDuration:1.0 animations:^{
				self.roomBackground.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
			} completion:NULL];
			self.parallaxFront.image = [UIImage imageNamed:@"fx.parallax.1.png"];
			self.parallaxBack.image = [UIImage imageNamed:@"fx.parallax.5.png"];
		}
		// Pillar
		if([worldBackground isEqualToString:@"Red"]){
			[UIView animateWithDuration:1.0 animations:^{
				self.roomBackground.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1];
			} completion:NULL];
			self.parallaxFront.image = [UIImage imageNamed:@"fx.parallax.6.png"];
			self.parallaxBack.image = [UIImage imageNamed:@"fx.parallax.7.png"];
        }
        // Hiversaires
        if([worldBackground isEqualToString:@"Void"]){
            [UIView animateWithDuration:1.0 animations:^{
                self.roomBackground.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1];
            } completion:NULL];
            self.parallaxFront.image = [UIImage imageNamed:@"fx.parallax.3.png"];
            self.parallaxBack.image = [UIImage imageNamed:@"fx.parallax.4.png"];
            self.debugLocation.textColor = [UIColor whiteColor];
        }
	}
}


- (void) roomClearSprites
{
	NSLog(@"-  ROOM | Blockers     | Clear");
	for (UIView *subview in [self.spritesContainer subviews]) {
		// Remove Blockers
		if(subview.tag == 10){
			[subview removeFromSuperview];
		}
		// Remove Events
		if(subview.tag == 20){
			[subview removeFromSuperview];
		}
	}
}

- (void) roomClearNotifications
{
	NSLog(@"-  ROOM | Notification | Clear");
	for (UIView *subview in [self.spritesContainer subviews]) {
		// Remove Notification
		if(subview.tag == 30){
			[subview removeFromSuperview];
		}
	}
}

- (void) roomClearParallax
{
	self.parallaxFront.alpha = 0;
	self.parallaxBack.alpha = 0;
	self.parallaxFront.frame = CGRectOffset(self.view.frame, (userPositionX*-1+userPositionY)*3, (userPositionX+userPositionY)*-3);
	self.parallaxBack.frame = CGRectOffset(self.view.frame, (userPositionX*-1+userPositionY)*1.5, (userPositionX+userPositionY)*-1.5);
}


@end