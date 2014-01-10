//
//  xxiivvViewController.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvViewController.h"

@interface xxiivvViewController (Events)

-(void)eventWarp :(NSString*)nodeId :(NSString*)eventData;
-(void)eventRouter :(NSString*)eventType :(NSString*)eventId :(NSString*)eventData;
-(void)eventDialog :(NSString*)dialog :(NSString*)characterId;
-(void)eventSpell :(int)spellId :(int)spellType;
-(void)eventAudioToggle :(int)toggle;

-(void)eventTransitionPan :(NSString*)destinationId :(NSString*)destinationCoordinates;

-(NSString*) eventParser :(NSString*)eventString :(int)index;

-(void)roomClearDialog;

@end