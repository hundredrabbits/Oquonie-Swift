//
//  xxiivvVariables.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

int debug;

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

int userGameCompleted;

NSMutableArray *userSpellbook;
NSMutableArray *userStorageEvents;

// World

NSString *worldAudio;
NSString *worldBackground;

NSTimer *worldMoveHoldTimer;
NSTimer *worldMoveTimer;
NSTimer *worldWalkTimer;

int worldTimer;

int worldTimerNotifications;

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
NSString *audioCurrentlyPlaying;

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

CGFloat centerW;
CGFloat centerH;