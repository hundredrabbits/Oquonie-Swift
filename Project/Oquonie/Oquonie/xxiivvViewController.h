//
//  xxiivvViewController.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "xxiivvSettings.h"
#import "xxiivvVariables.h"

typedef enum {
    DirectionNone  = -1,
    DirectionNorth = 0,
    DirectionEast  = 1,
    DirectionSouth = 2,
    DirectionWest  = 3
} Direction;

@interface xxiivvViewController : UIViewController{
	CGPoint touchAnchorPoint;
    CGPoint touchMovePoint;
    Direction currentDirection;
}

// =================
// Room
// =================

@property (strong, nonatomic) IBOutlet UIView *roomContainer;
@property (strong, nonatomic) IBOutlet UIView *roomBackground;

@property (strong, nonatomic) IBOutlet UIImageView *floor11;
@property (strong, nonatomic) IBOutlet UIImageView *floor01;
@property (strong, nonatomic) IBOutlet UIImageView *floore1;
@property (strong, nonatomic) IBOutlet UIImageView *floor10;
@property (strong, nonatomic) IBOutlet UIImageView *floor00;
@property (strong, nonatomic) IBOutlet UIImageView *floore0;
@property (strong, nonatomic) IBOutlet UIImageView *floor1e;
@property (strong, nonatomic) IBOutlet UIImageView *floor0e;
@property (strong, nonatomic) IBOutlet UIImageView *flooree;

@property (strong, nonatomic) IBOutlet UIImageView *wall1l;
@property (strong, nonatomic) IBOutlet UIImageView *wall2l;
@property (strong, nonatomic) IBOutlet UIImageView *wall3l;
@property (strong, nonatomic) IBOutlet UIImageView *wall1r;
@property (strong, nonatomic) IBOutlet UIImageView *wall2r;
@property (strong, nonatomic) IBOutlet UIImageView *wall3r;

@property (strong, nonatomic) IBOutlet UIImageView *step1l;
@property (strong, nonatomic) IBOutlet UIImageView *step2l;
@property (strong, nonatomic) IBOutlet UIImageView *step3l;
@property (strong, nonatomic) IBOutlet UIImageView *step1r;
@property (strong, nonatomic) IBOutlet UIImageView *step2r;
@property (strong, nonatomic) IBOutlet UIImageView *step3r;

@property (strong, nonatomic) AVAudioPlayer *audioAmbientPlayer;
@property (strong, nonatomic) AVAudioPlayer *audioEffectPlayer;
@property (strong, nonatomic) AVAudioPlayer *audioDialogPlayer;

// =================
// Sprites
// =================

@property (strong, nonatomic) IBOutlet UIView *spritesContainer;

@property (strong, nonatomic) IBOutlet UIScrollView *userPlayer;
@property (strong, nonatomic) IBOutlet UIImageView *userPlayerChar;
@property (strong, nonatomic) IBOutlet UIImageView *userPlayerShadow;

// =================
// Interface
// =================

@property (strong, nonatomic) IBOutlet UIView *interfaceContainer;

@property (strong, nonatomic) IBOutlet UIView *dialogVignette;

@property (strong, nonatomic) IBOutlet UIView *dialogView;
@property (strong, nonatomic) IBOutlet UIImageView *dialogCharacter;
@property (strong, nonatomic) IBOutlet UIImageView *dialogBubble;
@property (strong, nonatomic) IBOutlet UIImageView *dialogCharacter1;
@property (strong, nonatomic) IBOutlet UIImageView *dialogCharacter2;
@property (strong, nonatomic) IBOutlet UIImageView *dialogCharacter3;
@property (strong, nonatomic) IBOutlet UIView *dialogCharacterWarpper;

@property (strong, nonatomic) IBOutlet UIView *spellView;
@property (strong, nonatomic) IBOutlet UIImageView *spellCharacter1;
@property (strong, nonatomic) IBOutlet UIImageView *spellCharacter2;
@property (strong, nonatomic) IBOutlet UIImageView *spellCharacter3;

@property (strong, nonatomic) IBOutlet UIImageView *parallaxFront;
@property (strong, nonatomic) IBOutlet UIImageView *parallaxBack;

@property (strong, nonatomic) IBOutlet UIImageView *vignette;

@property (strong, nonatomic) IBOutlet UILabel *debugLocation;

@property (strong, nonatomic) IBOutlet UIImageView *moveIndicator;

@property (strong, nonatomic) IBOutlet UIImageView *creditsImage;
@property (strong, nonatomic) IBOutlet UIImageView *mapImage;
@property (strong, nonatomic) IBOutlet UIImageView *saveIndicator;

// =================
// Controls
// =================

@property CGPoint touchAnchorPoint;

// =================
// Misc
// =================

-(void)start;

-(CGRect) tileLocation :(int)type :(int)posX :(int)posY;
-(int)flattenTileId :(int)tileId :(NSString*)axis;
-(void)userSpriteUpdate :(NSString*)imageName;

-(void)audioAmbientPlayer:(NSString*)filename;
-(void)audioEffectPlayer:(NSString*)filename;
-(void)audioDialogPlayer:(NSString*)filename;

- (void) moveEventCheck :(int)userFuturePositionX :(int)userFuturePositionY;
- (void) moveAnimation;

-(void)moveDisable :(float)disableTime;
-(void)moveOrder;
-(void)moveParallax;

-(void)apiContact:(NSString*)source :(NSString*)method :(NSString*)term :(NSString*)value;

@end
