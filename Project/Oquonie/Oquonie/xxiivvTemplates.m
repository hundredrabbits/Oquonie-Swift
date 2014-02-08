//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvWorld.h"
#import "xxiivvViewController.h"

@implementation xxiivvViewController (Templates)


-(void)templateStart {
	
	screen = [[UIScreen mainScreen] bounds];
	screenMargin = screen.size.width/10;
	
	self.floor00.frame = [self tileLocation:0 :0 :0];
	self.floor1e.frame = [self tileLocation:0 :-1 :1];
	self.floore1.frame = [self tileLocation:0 :1 :-1];
	self.floor10.frame = [self tileLocation:0 :1 :0];
	self.floor01.frame = [self tileLocation:0 :0 :1];
	self.floor0e.frame = [self tileLocation:0 :0 :-1];
	self.floore0.frame = [self tileLocation:0 :-1 :0];
	self.floor11.frame = [self tileLocation:0 :1 :1];
	self.flooree.frame = [self tileLocation:0 :-1 :-1];
	
	self.wall1l.frame = [self tileLocation:5 :2 :-1];
	self.wall2l.frame = [self tileLocation:5 :2 : 0];
	self.wall3l.frame = [self tileLocation:5 :2 : 1];
	
	self.wall1r.frame = [self tileLocation:5 : -1 : 2];
	self.wall2r.frame = [self tileLocation:5 : 0 : 2];
	self.wall3r.frame = [self tileLocation:5 : 1 : 2];
	
	self.step1l.frame = [self tileLocation:0 :1 :-2];
	self.step2l.frame = [self tileLocation:0 :0 :-2];
	self.step3l.frame = [self tileLocation:0 :-1 :-2];
	
	self.step1r.frame = [self tileLocation:0 :-2 : -1];
	self.step2r.frame = [self tileLocation:0 :-2 : 0];
	self.step3r.frame = [self tileLocation:0 :-2 : 1];
	
	self.userPlayer.tag = 404;
	self.userPlayer.frame = [self tileLocation:4 :0 :0];
	
	self.userPlayerChar.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", [self templateSpriteName:@"2"] ] ];
	
	self.userPlayerChar.frame = CGRectMake(0, 0, self.userPlayer.frame.size.width, self.userPlayer.frame.size.height);
	
	self.userPlayerShadow.frame = self.userPlayerChar.frame;
	self.userPlayerShadow.image = [UIImage imageNamed:@"fx.shadow.png"];
	
	float textBlock = ( screen.size.width - (2*screenMargin) )/4;
	
	textBlock1 = CGRectMake(screenMargin+(0*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
	textBlock2 = CGRectMake(screenMargin+(1*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
	textBlock3 = CGRectMake(screenMargin+(2*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
	textBlock4 = CGRectMake(screenMargin+(3*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
	
	self.dialogView.frame = CGRectMake(0, screen.size.height-screen.size.width, screen.size.width, screen.size.width);
	
	self.dialogCharacterWarpper.frame = CGRectMake(self.dialogView.frame.size.width/15, self.dialogView.frame.size.height/1.7, self.dialogView.frame.size.width/5.5*2.5, self.dialogView.frame.size.width/5.5);
	
	float letterSize = self.dialogCharacterWarpper.frame.size.height;
	float letterSizeMargin = letterSize/8;
	
	self.dialogCharacter1.frame = CGRectMake(0, 0, letterSize, letterSize);
	self.dialogCharacter2.frame = CGRectMake(letterSize-letterSizeMargin, 0, letterSize, letterSize);
	self.dialogCharacter3.frame = CGRectMake((letterSize*2)-(2*letterSizeMargin), 0, letterSize, letterSize);
//	self.dialogCharacter2.frame = CGRectMake(self.dialogCharacterWarpper.frame.size.width/3, 0, self.dialogCharacterWarpper.frame.size.width/2.5, self.dialogCharacterWarpper.frame.size.width/2.5);
//	self.dialogCharacter3.frame = CGRectMake(self.dialogCharacterWarpper.frame.size.width/3*2, 0, self.dialogCharacterWarpper.frame.size.width/2.5, self.dialogCharacterWarpper.frame.size.width/2.5);
	
	
	// Dialog
	portraitOrigin = self.dialogCharacter.frame;
	bubbleOrigin = self.dialogBubble.frame;
	char1Origin = self.dialogCharacter1.frame;
	char2Origin = self.dialogCharacter2.frame;
	char3Origin = self.dialogCharacter3.frame;
	
	// Spellbook
	spellCharacter1Origin = self.spellCharacter1.frame;
	spellCharacter2Origin = self.spellCharacter2.frame;
	spellCharacter3Origin = self.spellCharacter3.frame;
	
	spriteContainerOrigin = self.spritesContainer.frame;
	roomContainerOrigin = self.roomContainer.frame;
	parallaxFrontOrigin = self.parallaxFront.frame;
	parallaxBackOrigin = self.parallaxBack.frame;
	
	self.dialogCharacter.frame = portraitOrigin;
	self.dialogCharacter.alpha = 0;
	self.dialogBubble.frame = bubbleOrigin;
	self.dialogBubble.alpha = 0;
	self.dialogCharacter1.alpha = 0;
	self.dialogCharacter2.alpha = 0;
	self.dialogCharacter3.alpha = 0;
	
	self.debugLocation.hidden = YES;
	self.creditsImage.hidden = YES;
	
}

- (void) templateRoomAnimation
{
	for (UIView *subview in [self.roomContainer subviews]) {
		float delay = (arc4random()%30)+1;
		
		if (subview.tag == 100 || subview.tag == 200) {
			CGRect origin = subview.frame;
			subview.frame = CGRectOffset(subview.frame, 0, 5);
			subview.alpha = 0;
			[UIView beginAnimations: @"Fade In" context:nil];
			[UIView setAnimationDuration:(delay/50)];
			[UIView setAnimationDelay:0];
			subview.frame = origin;
			subview.alpha = 1;
			[UIView commitAnimations];
		}
	}
}


- (NSString *) templateSpriteName :(NSString*) mod
{
	NSString *spriteName = @"";
	
	// Remove mod if looking back
	if( [userSpriteState isEqual:@"stand"] && [userSpriteOrientationVertical isEqualToString:@"b"]){
		mod = @"1";
	}
	// If there is no mod
	if([mod isEqualToString:@""]){
		mod = @"1";
	}
	
	spriteName = [NSString stringWithFormat:@"char%d.%@.%@.%@.%@.png", userCharacter, userSpriteState, userSpriteOrientationHorizontal, userSpriteOrientationVertical,mod];
	return spriteName;
}

@end