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

-(NSString*)name;
-(NSString*)type;
-(int)x;
-(int)y;
-(int)location;

-(void)addName :(NSString*)name;
-(void)addCoordinates :(int)x :(int)y;
-(void)addAudio :(NSString*)soundName;
-(void)addLocation :(int)value;
-(void)addType :(NSString*)value;

@end

NSMutableDictionary * eventData;