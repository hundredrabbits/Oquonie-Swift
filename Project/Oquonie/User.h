//
//  User.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-29.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

-(User*)init;

-(NSString*)state;
-(void)setState :(NSString*)value;

-(int)location;
-(void)setLocation :(int)value;
-(NSString*)locationString;

-(int)character;
-(void)setCharacter :(int)value;

-(int)x;
-(void)setX :(int)value;

-(int)y;
-(void)setY :(int)value;

-(NSString*)vertical;
-(void)setVertical :(NSString*)value;
-(NSString*)horizontal;
-(void)setHorizontal :(NSString*)value;

-(int)enabled;
-(void)setEnabled :(int)value;

-(void)clearSpellbook;

-(int)spellExists :(NSString*)spellId;
-(void)spellCollect :(NSString*)spellId :(int)spellType;
-(int)spellCount;

-(int)eventExists :(int)eventId;
-(void)eventCollect :(int)eventId;
-(void)eventRemove :(int)eventId;

@end

NSMutableDictionary * userData;