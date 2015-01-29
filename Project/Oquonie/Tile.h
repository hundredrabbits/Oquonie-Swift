//
//  Tile.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tile : NSObject

-(Tile*)initWithString :(NSString*)tileString;

-(int)isEmpty;
-(int)isWarp;
-(int)isBlocker;
-(int)isEvent;

-(NSString*)value;
-(NSString*)type;
-(NSString*)name;
-(NSString*)data;

@end

NSArray* tileNode;