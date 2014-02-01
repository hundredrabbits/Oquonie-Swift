//
//  xxiivvViewController.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface xxiivvViewController : UIViewController{
	CGPoint interactionMap;
    CGPoint interactionMapHold;
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

@property (strong, nonatomic) IBOutlet UIView *spellView;
@property (strong, nonatomic) IBOutlet UIImageView *spellCharacter1;
@property (strong, nonatomic) IBOutlet UIImageView *spellCharacter2;
@property (strong, nonatomic) IBOutlet UIImageView *spellCharacter3;

@property (strong, nonatomic) IBOutlet UIImageView *parallaxFront;
@property (strong, nonatomic) IBOutlet UIImageView *parallaxBack;

@property (strong, nonatomic) IBOutlet UIImageView *vignette;

@property (strong, nonatomic) IBOutlet UILabel *debugLocation;

@property (strong, nonatomic) IBOutlet UIImageView *moveIndicator;

// =================
// Controls
// =================

@property CGPoint interactionMap;

// =================
// Misc
// =================

-(CGRect) tileLocation :(int)type :(int)posX :(int)posY;
-(int)flattenTileId :(int)tileId :(NSString*)axis;
-(void)userSpriteUpdate :(NSString*)imageName;

-(void)audioAmbientPlayer:(NSString*)filename;
-(void)audioEffectPlayer:(NSString*)filename;

- (void) moveEventCheck :(int)userFuturePositionX :(int)userFuturePositionY;
- (void) moveAnimation;

-(void)moveDisable :(float)disableTime;
-(void)moveOrder;
-(void)moveParallax;

@end

int viewWidth;
int tileW;
int tileH;

// User

NSString *userSpriteState;
NSString *userSpriteOrientationHorizontal;
NSString *userSpriteOrientationVertical;

int userAudioPlaying;
int userMoveEnabled;
int userDialogActive;

int userLocation;
int userPositionX;
int userPositionY;
int userPositionZ;
int userCharacter;

NSMutableArray *userSpellbook;
NSMutableArray *userStorageEvents;

// World

NSString *worldAudio;
NSString *worldBackground;

NSTimer *worldMoveHold;
NSTimer *worldMoveTimer;
NSTimer *worldWalkTimer;

int worldTimer;

int worldTimerEvents;
int worldTimerEventCount;
int worldTimerEventDirection;
int worldTimerEventCycle;

int worldTimerUser;
int worldTimerUserCount;
int worldTimerUserDirection;
int worldTimerUserCycle;

NSMutableArray *worldNode;

int roomDoorState;

CGRect	screen;
int		screenMargin;

CGRect textBlock1;
CGRect textBlock2;
CGRect textBlock3;
CGRect textBlock4;

CGRect portraitOrigin;
CGRect bubbleOrigin;
CGRect char1Origin;
CGRect char2Origin;
CGRect char3Origin;

CGRect spellCharacter1Origin;
CGRect spellCharacter2Origin;
CGRect spellCharacter3Origin;

CGRect parallaxFrontOrigin;
CGRect parallaxBackOrigin;
CGRect roomContainerOrigin;
CGRect spriteContainerOrigin;

