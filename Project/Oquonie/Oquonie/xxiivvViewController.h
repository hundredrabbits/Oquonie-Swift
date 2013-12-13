//
//  xxiivvViewController.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xxiivvViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *moveTL;
@property (strong, nonatomic) IBOutlet UIButton *moveTR;
@property (strong, nonatomic) IBOutlet UIButton *moveBL;
@property (strong, nonatomic) IBOutlet UIButton *moveBR;

- (IBAction)moveTL:(id)sender;
- (IBAction)moveTR:(id)sender;
- (IBAction)moveBL:(id)sender;
- (IBAction)moveBR:(id)sender;

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

@property (strong, nonatomic) IBOutlet UIScrollView *userPlayer;
@property (strong, nonatomic) IBOutlet UIImageView *userPlayerChar;
@property (strong, nonatomic) IBOutlet UIImageView *userPlayerShadow;
@property (strong, nonatomic) IBOutlet UIImageView *userPlayerChat;

@property (strong, nonatomic) IBOutlet UIImageView *text1;
@property (strong, nonatomic) IBOutlet UIImageView *text2;
@property (strong, nonatomic) IBOutlet UIImageView *text3;
@property (strong, nonatomic) IBOutlet UIImageView *text4;

@property (strong, nonatomic) IBOutlet UIImageView *blocker1;

@property (strong, nonatomic) IBOutlet UIView *dialogView;
@property (strong, nonatomic) IBOutlet UIImageView *dialogCharacter;
@property (strong, nonatomic) IBOutlet UIImageView *dialogBubble;
@property (strong, nonatomic) IBOutlet UIImageView *dialogCharacter1;
@property (strong, nonatomic) IBOutlet UIImageView *dialogCharacter2;
@property (strong, nonatomic) IBOutlet UIImageView *dialogCharacter3;

-(CGRect) tileLocation :(int)type :(int)posX :(int)posY;
-(int)flattenTileId :(int)tileId :(NSString*)axis;

@end

int viewWidth;
int tileW;
int tileH;

NSString *userSpriteChar;
NSString *userSpriteState;
NSString *userSpriteOrientationHorizontal;
NSString *userSpriteOrientationVertical;
NSString *userAudioTrack;

int userAudioPlaying;

int userLocation;
int userPositionX;
int userPositionY;
int userPositionZ;
int userSpriteCharId;

NSMutableArray *userStorageEvents;

NSMutableArray *worldNode;

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