//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvVariables.h"
#import "xxiivvSettings.h"

//#import "xxiivvWorld.h"
//#import "xxiivvEvents.h"
//#import "xxiivvUtils.h"

#import "worldLobby.h"
#import "worldNecomedre.h"		// Chapter I
#import "worldNephtaline.h"		// Chapter II
#import "worldNemedique.h"		// Chapter III
#import "worldNestorine.h"		// Chapter IV
#import "worldNeomine.h"		// Chapter V
#import "worldSecret.h"			// Chapter *
#import "worldNastazie.h"		// Chapter VI

@implementation xxiivvViewController (world)

-(void)worldStart
{
    worldNode = [NSMutableArray arrayWithObjects:@"",nil];
    int myCount = 0;
    while ( myCount < 160 )	{ myCount++; worldNode[myCount] = @[];	}
    
    // 0 - 19
    [self createWorldLobby];
    // 20 - 39
    [self createWorldNecomedre];
    // 40 - 59
    [self createWorldNephtaline];
    // 60 - 79
    [self createWorldNeomine];
    // 80 - 99
    [self createWorldNestorine];
    // 100 - 99
    [self createWorldNemedique];
    // 110 - >
    [self createWorldSecret];
    // 130
    [self createWorldNastazie];
}

- (NSString*) tileParser :(NSString*)tileString :(int)index
{
	int exception = 0;
	// Ignore if index is 99
	if(index == 99){
		index = 0;
		exception = 1;
	}
	
	NSArray* array = [tileString componentsSeparatedByString: @"|"];
	if( [array count] < (index+1) && index > 0 ){
		return 0;
	}
	
	// Catch if event is broadcasting an update
	if( [array count] > 2 && exception == 0){
		// Update event
		if( [[array objectAtIndex: 1] isEqualToString:@"event"] && index == 3 ){
			return [self tileParserUpdate:array:index];
		}
		// Update tile
		else if( [[array objectAtIndex: 1] isEqualToString:@"event"] && index == 0 && [array count] < 4){
			return [self tileParserUpdate:array:index];
		}
	}
	
	return [array objectAtIndex:index];
}

-(NSString*)tileParserUpdate :(NSArray*)eventArray :(int)index
{
	// Contact event
	#pragma clang diagnostic push
	#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
	NSString *eventSelector = [NSString stringWithFormat:@"event_%@:",[eventArray objectAtIndex:2]];
	NSString *eventUpdate = [self performSelector:NSSelectorFromString(eventSelector) withObject:@"postUpdate"];
	#pragma clang diagnostic pop
	
	if(![eventUpdate isEqualToString:@""]){
		return eventUpdate;
	}
	
	return [eventArray objectAtIndex:index];
}



@end