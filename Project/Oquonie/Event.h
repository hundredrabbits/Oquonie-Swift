//
//  Event.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-29.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"

@interface Event : NSObject

-(Event*)initWithTile :(Tile*)tile;
-(Event*)initWithName :(NSString*)name;
-(Event*)initWarp :(int)location :(int)x :(int)y;

-(NSString*)name;
-(NSString*)type;
-(int)x;
-(int)y;
-(int)location;

-(void)setName :(NSString*)name;
-(void)setCoordinates :(int)x :(int)y;
-(void)setAudio :(NSString*)soundName;
-(void)setLocation :(int)value;
-(void)setType :(NSString*)value;


@end

NSMutableDictionary * eventData;