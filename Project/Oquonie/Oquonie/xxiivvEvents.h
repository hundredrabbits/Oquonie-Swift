//
//  xxiivvViewController.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvViewController.h"

@interface xxiivvViewController (Events)

-(void)eventWarp :(int)eventId :(NSString*)eventData;
-(void)eventRouter :(NSString*)eventType :(NSString*)eventId :(NSString*)eventData;
-(int)notificationListen :(NSString*)eventId;
-(void)roomCleanDialog;
-(NSString*) eventParser :(NSString*)eventString :(int)index;

-(void)eventDialog :(NSString*)dialog :(NSString*)characterId;
-(void)eventSpell :(int)spellId :(int)spellType;

@end