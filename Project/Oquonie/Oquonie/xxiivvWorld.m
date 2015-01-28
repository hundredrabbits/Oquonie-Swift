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





@end