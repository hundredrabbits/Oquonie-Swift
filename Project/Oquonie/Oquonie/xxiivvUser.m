//
//  xxiivvViewController+xxiivvUser.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/10/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvSettings.h"
#import "xxiivvVariables.h"

#import "xxiivvUser.h"

@implementation xxiivvViewController (xxiivvUser)

-(void)userStart
{
	NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
	
	if(debug == 1){
		[self userDebug];
	}
	else if( [[defaults objectForKey:@"[user location]"] intValue]>0 ){
		[self userLoad];
	}
	else{
		[self userNew];
	}
	
    [user setEnabled:1];
	userDialogActive = 0;
}

-(void)userSave
{
	NSLog(@"   USER | Saving..     | Please hold");
	
	[UIView animateWithDuration:0.5 animations:^(void){
		[UIView setAnimationDelay:1];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		self.saveIndicator.alpha = 1;
	} completion:^(BOOL finished){
		[UIView animateWithDuration:3 animations:^(void){
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			self.saveIndicator.alpha = 0;
		} completion:^(BOOL finished){}];
	}];
	
	NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
	
	[defaults setObject:[NSString stringWithFormat:@"%d",[user location]] forKey:@"[user location]"];
	[defaults setObject:[NSString stringWithFormat:@"%d",[user character]] forKey:@"[user character]"];
	[defaults setObject:[NSString stringWithFormat:@"%d",userGameCompleted] forKey:@"userGameCompleted"];
	
	[defaults setObject:[user state] forKey:@"userSpriteState"];
//	[defaults setObject:userSpriteOrientationHorizontal forKey:@"userSpriteOrientationHorizontal"];
//	[defaults setObject:userSpriteOrientationVertical forKey:@"userSpriteOrientationVertical"];
	
	[defaults setObject:userSpellbook forKey:@"userSpellbook"];
	[defaults setObject:userStorageEvents forKey:@"userStorageEvents"];
	
	[defaults synchronize];
}

-(void)userLoad
{
	NSLog(@"   USER | Loading..    | Please hold");
	
	NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
	
//	[user location] = [[defaults objectForKey:@"[user location]"] intValue];
//	[user character] = [[defaults objectForKey:@"[user character]"] intValue];
	userGameCompleted = [[defaults objectForKey:@"userGameCompleted"] intValue];
	
    [user setState:[defaults objectForKey:@"userSpriteState"]];
//	userSpriteOrientationHorizontal = [defaults objectForKey:@"userSpriteOrientationHorizontal"];
//	userSpriteOrientationVertical = [defaults objectForKey:@"userSpriteOrientationVertical"];
	
	userSpellbook = [defaults objectForKey:@"userSpellbook"];
	userStorageEvents = [defaults objectForKey:@"userStorageEvents"];
    
    userSpellbook = [[NSMutableArray alloc] initWithArray:userSpellbook];
    userStorageEvents = [[NSMutableArray alloc] initWithArray:userStorageEvents];
	
}

-(void)userNew
{
	NSLog(@"   USER | Starting..     | Please hold");
    
    [user setCharacter:1];
    [user setLocation:29];
	
    [user setState:@"stand"];
	[user setHorizontal:@"l"];
	[user setVertical:@"f"];
	
    // New event storage
    userStorageEvents = [NSMutableArray arrayWithObjects:@"",nil];
    int myCount = 0;
    while ( myCount < 40 )	{ myCount++; userStorageEvents[myCount] = @"";	}
	
	// User Spellbook
	userSpellbook = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
}
-(void)userDebug
{
	NSLog(@"   USER | Starting..     | Please hold");
	
    [user setCharacter:1];
    [user setLocation:1];
    
    [user setState:@"stand"];
	[user setHorizontal:@"l"];
	[user setVertical:@"f"];
	
    // New event storage
    userStorageEvents = [NSMutableArray arrayWithObjects:@"",nil];
    int myCount = 0;
    while ( myCount < 40 )	{ myCount++; userStorageEvents[myCount] = @"";	}
	
	// User Spellbook
	userSpellbook = [NSMutableArray arrayWithObjects:@[@"",@""],@[@"",@""],@[@"",@""],nil];
}

@end
