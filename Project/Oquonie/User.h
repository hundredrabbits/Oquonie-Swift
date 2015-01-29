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

-(int)location;
-(void)setLocation :(int)value;
-(NSString*)locationString;

-(int)character;
-(void)setCharacter :(int)value;

-(int)x;
-(void)setX :(int)value;

-(int)y;
-(void)setY :(int)value;

@end

NSMutableDictionary * userData;