//
//  World.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface World : NSObject

-(NSArray*)roomAtLocation :(int)location;

@end

NSMutableArray* worldNode;