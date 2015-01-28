//
//  xxiivvViewController+xxiivvTouch.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "xxiivvViewController.h"

@interface xxiivvViewController (general)

- (NSString*) tileParser :(NSString*)tileString :(int)index;
-(NSString*)tileParserUpdate :(NSArray*)eventArray :(int)index;

- (void) roomStart;
- (void) roomGenerateNotifications;
- (void) roomClearNotifications;
- (void) roomClearSprites;
-(void)roomGenerateEvents;
-(void)roomGenerateTiles;

@end
