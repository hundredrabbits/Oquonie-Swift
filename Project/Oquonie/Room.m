//
//  Room.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "Room.h"
#import "Tile.h"

@implementation Room

-(Room*)initWithArray :(NSArray*)roomArray
{
    NSLog(@"+  ROOM | Init");
    roomNode = [[NSArray alloc] initWithArray:roomArray];
    return self;
}

-(NSString*)tileAtLocation :(int)x :(int)y
{
    int index = [self flattenPosition:x:y];
    return roomNode[index];
}

-(NSString*)tileAtId :(int)locationId
{
    return roomNode[locationId];
}

-(int)flattenPosition :(int)x :(int)y
{
    if(x==1 && y==-1){ return 0; }
    if(x==1 && y== 0){ return 1; }
    if(x==1 && y== 1){ return 2; }
    if(x==0 && y==-1){ return 3; }
    if(x==0 && y== 0){ return 4; }
    if(x==0 && y== 1){ return 5; }
    if(x==-1&& y==-1){ return 6; }
    if(x==-1&& y== 0){ return 7; }
    if(x==-1&& y== 1){ return 8; }
    
    if(x== 2&& y==-1){ return 9; }
    if(x== 2&& y== 0){ return 10; }
    if(x== 2&& y== 1){ return 11; }
    if(x== 1&& y== 2){ return 12; }
    if(x== 0&& y== 2){ return 13; }
    if(x==-1&& y== 2){ return 14; }
    
    if(x== 1&& y== 2){ return 12; }
    if(x== 0&& y== 2){ return 13; }
    if(x==-1&& y== 2){ return 14; }
    if(x== 1&& y==-2){ return 15; }
    if(x== 0&& y==-2){ return 16; }
    if(x==-1&& y==-2){ return 17; }
    
    if(x==-2&& y==-1){ return 18; }
    if(x==-2&& y== 0){ return 19; }
    if(x==-2&& y== 1){ return 20; }
    
    return 1;
}

-(int)inflateTileId :(int)tileId :(NSString*)axis
{
    if([axis isEqualToString:@"x"]){
        // Tiles
        if(tileId == 0){ return 1;  }
        if(tileId == 1){ return 1;  }
        if(tileId == 2){ return 1;  }
        if(tileId == 3){ return 0;  }
        if(tileId == 4){ return 0;  }
        if(tileId == 5){ return 0;  }
        if(tileId == 6){ return -1; }
        if(tileId == 7){ return -1; }
        if(tileId == 8){ return -1; }
        // Walls
        if(tileId == 9 ){ return 2; }
        if(tileId == 10){ return 2; }
        if(tileId == 11){ return 2; }
        if(tileId == 12){ return 2; }
        if(tileId == 13){ return 1; }
        if(tileId == 14){ return 0; }
        // Steps
        if(tileId == 15){ return -1;}
        if(tileId == 16){ return  0;}
        if(tileId == 17){ return -1;}
        if(tileId == 18){ return -1;}
        if(tileId == 19){ return -1;}
        if(tileId == 20){ return -1;}
    }
    if([axis isEqualToString:@"y"]){
        // Tiles
        if(tileId == 0){ return -1; }
        if(tileId == 1){ return 0; }
        if(tileId == 2){ return 1; }
        if(tileId == 3){ return -1; }
        if(tileId == 4){ return 0; }
        if(tileId == 5){ return 1; }
        if(tileId == 6){ return -1; }
        if(tileId == 7){ return 0; }
        if(tileId == 8){ return 1; }
        // Walls
        if(tileId == 9 ){ return 0; }
        if(tileId == 10){ return 1; }
        if(tileId == 11){ return 2; }
        if(tileId == 12){ return 2; }
        if(tileId == 13){ return 2; }
        if(tileId == 14){ return 2; }
        // Steps
        if(tileId == 15){ return -1;}
        if(tileId == 16){ return -2;}
        if(tileId == 17){ return -1;}
        if(tileId == 18){ return -1;}
        if(tileId == 19){ return -1;}
        if(tileId == 20){ return -1;}
    }
    
    return 0;
}

-(NSString*)theme
{
	return roomNode[22];
}

@end
