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
	
	self.moveTL.frame = CGRectMake(0, 0, screen.size.width/2, screen.size.height/2);
	self.moveTR.frame = CGRectMake(screen.size.width/2, 0, screen.size.width/2, screen.size.height/2);
	self.moveBL.frame = CGRectMake(0, screen.size.height/2, screen.size.width/2, screen.size.height/2);
	self.moveBR.frame = CGRectMake(screen.size.width/2, screen.size.height/2, screen.size.width/2, screen.size.height/2);
	
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
	
	self.blocker1.frame = [self tileLocation:1 :0 :0];
	
	self.userPlayerShadow.frame = CGRectMake(0, tileH, tileW, tileH);
	self.userPlayerShadow.image = [UIImage imageNamed:@"char.shadow.png"];
	
	self.userPlayer.frame = [self tileLocation:4 :0 :0];
	
	self.userPlayerChat.hidden = YES;
	
	self.userPlayerChar.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", [self templateSpriteName:@"2"] ] ];
	
	self.userPlayerChar.frame = CGRectMake(0, 0, self.userPlayer.frame.size.width, self.userPlayer.frame.size.height);
	
	float textBlock = ( screen.size.width - (2*screenMargin) )/4;
	
	textBlock1 = CGRectMake(screenMargin+(0*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
	textBlock2 = CGRectMake(screenMargin+(1*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
	textBlock3 = CGRectMake(screenMargin+(2*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
	textBlock4 = CGRectMake(screenMargin+(3*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);

	self.text1.frame = textBlock1;
	self.text2.frame = textBlock2;
	self.text3.frame = textBlock3;
	self.text4.frame = textBlock4;
	
	self.text1.hidden = YES;
	self.text2.hidden = YES;
	self.text3.hidden = YES;
	self.text4.hidden = YES;
	
	portraitOrigin = self.dialogCharacter.frame;
	bubbleOrigin = self.dialogBubble.frame;
	char1Origin = self.dialogCharacter1.frame;
	char2Origin = self.dialogCharacter2.frame;
	char3Origin = self.dialogCharacter3.frame;
	
	self.dialogCharacter.frame = portraitOrigin;
	self.dialogCharacter.alpha = 0;
	self.dialogBubble.frame = bubbleOrigin;
	self.dialogBubble.alpha = 0;
	self.dialogCharacter1.alpha = 0;
	self.dialogCharacter2.alpha = 0;
	self.dialogCharacter3.alpha = 0;
	
}

- (void) templateRoomAnimation
{
	for (UIView *subview in [self.view subviews]) {
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
	
	if( [userSpriteState isEqual:@"walk"] ){
		spriteName = [NSString stringWithFormat:@"%@.%@.%@.%@.%@.png", userSpriteChar, userSpriteState, userSpriteOrientationHorizontal, userSpriteOrientationVertical,mod];
	}
	else{
		spriteName = [NSString stringWithFormat:@"%@.%@.%@.%@.png", userSpriteChar, userSpriteState, userSpriteOrientationHorizontal, userSpriteOrientationVertical];
	}
	
	return spriteName;
}

@end