//
//  Encounter.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-30.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Draw.h"
#import "Audio.h"

@interface Encounter : NSObject

-(Encounter*)initWithName :(NSString*)name;
-(void)touch;
-(void)see;

-(NSString*)map :(NSString*)option;

@end

NSString* encounterName;
Draw * newDraw;
Audio * newSound;