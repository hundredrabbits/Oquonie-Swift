//
//  Room.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Room : NSObject

-(Room*)initWithArray :(NSArray*)roomArray;
-(NSString*)tileAtLocation :(int)x :(int)y;
-(NSString*)tileAtId :(int)locationId;
-(UIImage*)tileImageAtId :(int)x :(int)y;

@end

NSArray* roomNode;