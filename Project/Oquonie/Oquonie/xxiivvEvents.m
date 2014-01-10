//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvWorld.h"
#import "xxiivvViewController.h"
#import "xxiivvTemplates.h"
#import "xxiivvUtils.h"

#import "eventsLobby.h"
#import "eventsNecomedre.h"

@implementation xxiivvViewController (Events)

// =======================
// @ Events: Routers
// =======================

# pragma mark Routers -

-(void)eventRouter :(NSString*)eventType :(NSString*)eventId :(NSString*)eventData {
	
	if ([eventType isEqualToString:@"warp"]) {
		[self eventWarp:eventId:eventData];
	}
	if ([eventType isEqualToString:@"event"]) {
		NSString *eventSelector = [NSString stringWithFormat:@"event_%@:",[self eventParser:eventId:0]];
		NSLog(@"------- - ------------ - -------------------");
		NSLog(@"! EVENT | Load..       * %@", eventId );
		NSLog(@"------- - ------------ - -------------------");
		[self performSelector:NSSelectorFromString(eventSelector) withObject:@""];
		[self roomClearNotifications];
        [self roomGenerateNotifications];
	}
	
}

- (NSString*) eventParser :(NSString*)eventString :(int)index {
	
	NSArray* array = [eventString componentsSeparatedByString: @"_"];
	if( [array count] < (index+1) && index > 0 ){
		return 0;
	}
	NSString* value = [array objectAtIndex: index];
	
	return value;
}

// =======================
// @ Events: Generic Events
// =======================

# pragma mark Generic Events -

- (void)eventWarp :(NSString*)nodeId :(NSString*)eventData
{
	NSLog(@"> EVENT | Warp         | Node.%@",nodeId );
	
	NSArray* array = [eventData componentsSeparatedByString: @","];
	int x = [[array objectAtIndex: 0] intValue];
	int y = [[array objectAtIndex: 1] intValue];
	
	self.userPlayerChar.alpha = 0;
	
	userPositionX = x;
	userPositionY = y;
	userLocation = [nodeId intValue];
	self.userPlayer.frame = [self tileLocation:4:userPositionX:userPositionY];
	
	[UIView beginAnimations: @"Fade In" context:nil];
	[UIView setAnimationDuration:0.3];
	self.userPlayerChar.alpha = 1;
	[UIView commitAnimations];
	
	[self roomStart];
	[self templateRoomAnimation];
	[self moveParallax];
	[self moveOrder];
}

- (void)eventDialog :(NSString*)dialog :(NSString*)characterId
{
	NSLog(@"  EVENT | Dialog       | Letters %@",dialog);
	
	userDialogActive = 1;
	
    self.dialogCharacter1.image = [UIImage imageNamed:@""];
    self.dialogCharacter2.image = [UIImage imageNamed:@""];
    self.dialogCharacter3.image = [UIImage imageNamed:@""];

    if(dialog.length > 2){
        self.dialogCharacter3.image = [UIImage imageNamed:[NSString stringWithFormat:@"letter%@.png",[dialog substringFromIndex:2]]];
    }
    if(dialog.length > 1){
        self.dialogCharacter2.image = [UIImage imageNamed:[NSString stringWithFormat:@"letter%@.png",[dialog substringWithRange:NSMakeRange(1, 1)]]];
    }
    if(dialog.length > 0){
        self.dialogCharacter1.image = [UIImage imageNamed:[NSString stringWithFormat:@"letter%@.png",[dialog substringToIndex:1]]];
    }
	
	self.dialogCharacter.frame = CGRectOffset(portraitOrigin, 0, 2);
	self.dialogCharacter.image = [UIImage imageNamed:[NSString stringWithFormat:@"event.%@.portrait.png",characterId]];
	self.dialogCharacter.alpha = 0;
	
	self.dialogBubble.frame = CGRectOffset(bubbleOrigin, 3, 0);
	self.dialogBubble.alpha = 0;
	
	self.dialogCharacter1.alpha = 0;
	self.dialogCharacter2.alpha = 0;
	self.dialogCharacter3.alpha = 0;
	
	[UIView beginAnimations: @"animate dialog" context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	self.dialogCharacter.frame = portraitOrigin;
	self.dialogCharacter.alpha = 1;
	self.dialogBubble.frame = CGRectOffset(bubbleOrigin, 0, 0);
	self.dialogBubble.alpha = 1;
	self.dialogCharacter2.alpha = 1;
	[UIView commitAnimations];
	
	[UIView beginAnimations: @"animate dialog" context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDelay:0.2];
	self.dialogCharacter1.alpha = 1;
	self.dialogCharacter3.alpha = 1;
	[UIView commitAnimations];
	
}

-(void)eventSpell :(int)spellId :(int)spellType
{
    NSLog(@"> EVENT | Spell        | Added    -> id:%d type:%d",spellId,spellType);
	
    userStorageEvents[spellId] = [NSString stringWithFormat:@"%d",spellType];
	
	[self eventSpellRefresh];
}

-(void)eventSpellRefresh
{
	NSLog(@"> EVENT | Spell        | Refresh");
	
	// Create merge array
	int index = 0;
	NSMutableArray *spellTest = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
	
	// Merge events counts
	for (NSString *tile in userStorageEvents) {
		int spellId = [tile intValue];
		spellTest[spellId] = [NSString stringWithFormat:@"%d",[spellTest[spellId] intValue]+1];
		index += 1;
	}
	
	// Transform in the right character
	index = 0;
	for (NSString *spellCountForId in spellTest) {
		if(index>0){
			if([spellCountForId intValue] > 2){
				[self eventTranform:index];
			}
		}
		index += 1;
	}
	
	// Display the spells in spellview
	
	index = 0;
	int spellIndex = 0;
	for (NSString *spellValue in userStorageEvents) {
		
		if( [self util_IsSpell:index] == TRUE ){
			
			if([spellValue isEqualToString:@""]){ continue; }
			
			NSLog(@"     UI | Spell        | StorageId: %d SpellId:%@",index,spellValue);
			
			UIImage *letterImage = [UIImage imageNamed:[NSString stringWithFormat:@"letter%@.png",[self util_CharIdToLetter:[spellValue intValue]]]];
			
			if(spellIndex == 0){ self.spellCharacter1.image = letterImage; }
			if(spellIndex == 1){ self.spellCharacter2.image = letterImage; }
			if(spellIndex == 2){ self.spellCharacter3.image = letterImage; }
			spellIndex += 1;
			
		}
		
		index += 1;
	}
	
}

-(void)eventTranform :(int)charId
{
	NSLog(@"+ EVENT | Spell        | Transform intro char%d",charId);
	userSpriteCharId = charId;
}

-(void)eventAudioToggle :(int)toggle
{
	if(toggle == 1){
		NSLog(@"•  ROOM | Audio        | Turned On");
	}
	else{
		NSLog(@"•  ROOM | Audio        | Turned Off");
	}
}

-(void)eventTransitionPan :(NSString*)destinationId :(NSString*)destinationCoordinates
{
	[self moveDisable:4];
	[UIView animateWithDuration:3 animations:^(void){
		NSLog(@"  EVENT | Pan          | Panning Out");
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		[UIView setAnimationDelay:0.2];
		self.roomContainer.frame = CGRectOffset(self.roomContainer.frame, 0, screen.size.height);
		self.spritesContainer.frame = CGRectOffset(self.spritesContainer.frame, 0, screen.size.height-30);
		self.parallaxBack.frame = CGRectOffset(self.parallaxBack.frame, 0, screen.size.height-10);
		self.parallaxFront.frame = CGRectOffset(self.parallaxFront.frame, 0, screen.size.height+20);
	} completion:^(BOOL finished){
		NSLog(@"  EVENT | Pan          | Panning In");
		
		[self eventWarp:destinationId:destinationCoordinates];
		
		self.roomContainer.frame = CGRectOffset(self.roomContainer.frame, 0, -1*screen.size.height);
		self.spritesContainer.frame = CGRectOffset(self.spritesContainer.frame, 0, -1*screen.size.height-100);
		self.parallaxBack.frame = CGRectOffset(self.parallaxBack.frame, 0, -1*screen.size.height+10);
		self.parallaxFront.frame = CGRectOffset(self.parallaxFront.frame, 0, -1*screen.size.height-50);
		
		[UIView animateWithDuration:2.5 animations:^(void){
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			self.roomContainer.frame = roomContainerOrigin;
			self.spritesContainer.frame = spriteContainerOrigin;
			self.parallaxBack.frame = parallaxBackOrigin;
			self.parallaxFront.frame = parallaxFrontOrigin;
		} completion:^(BOOL finished){}];
	}];
}

-(void)eventVignette :(NSString*) vignetteType
{
	self.vignette.image = [UIImage imageNamed:@"fx.vignette.1.png"];
	[UIView animateWithDuration:1.5 animations:^(void){
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		self.vignette.alpha = 0;
	} completion:^(BOOL finished){}];
	
}

// =======================
// @ Events: Clear Events
// =======================

# pragma mark Clear Events -

-(void)roomClearDialog
{
	NSLog(@"> EVENT | Dialog       | Closed");
	[UIView animateWithDuration:0.2 animations:^(void){
		self.dialogCharacter.frame = portraitOrigin;
		self.dialogCharacter.alpha = 0;
		self.dialogBubble.frame = bubbleOrigin;
		self.dialogBubble.alpha = 0;
		self.dialogCharacter1.alpha = 0;
		self.dialogCharacter2.alpha = 0;
		self.dialogCharacter3.alpha = 0;
	} completion:^(BOOL finished){}];
}

@end