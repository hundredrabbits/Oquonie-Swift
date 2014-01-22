//
//  xxiivvViewController+xxiivvUser.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/10/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvUser.h"
#import "xxiivvSettings.h"

@implementation xxiivvViewController (xxiivvUser)

-(void)userStart
{
	userPositionX = userCharacterX;
	userPositionY = userCharacterY;
	userCharacter = userCharacterId;
	userLocation = userCharacterLocation;
	
	userSpriteState = @"stand";
	userSpriteOrientationHorizontal = @"l";
	userSpriteOrientationVertical = @"f";
	userMoveEnabled = 1;
	userDialogActive = 0;
	
    // New event storage
    userStorageEvents = [NSMutableArray arrayWithObjects:@"",nil];
    int myCount = 0;
    while ( myCount < 40 )	{ myCount++; userStorageEvents[myCount] = @"";	}
	
	// User Spellbook
	userSpellbook = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
}

-(void)userSave
{
	NSLog(@"   USER | Saving..     | Please hold");
}

-(void)userLoad
{
	NSLog(@"   USER | Loading..    | Please hold");
}

@end
