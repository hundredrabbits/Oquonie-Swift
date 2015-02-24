//
//  Draw.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-01-30.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Draw : NSObject

-(void)map :(NSString*)name;

-(void)dialog  :(NSString*)dialog :(NSString*)characterId;
-(void)closeDialog;

-(void)mapHide;

-(void)animateWalk;
-(void)animateTransform :(int)nextCharacter;
-(void)animateRoomPan;
-(void)animateBlock;

-(void)events;
-(void)notifications;
-(void)eraseNotifications;
-(void)room;
-(void)roomShuffle;
-(void)roomShuffle2;

-(void)sequenceWarpTo:(int)destination;
-(void)sequenceIntro;
-(void)sequenceResetTree;
-(void)sequenceEndRed;
-(void)sequenceCredits1;
-(void)sequenceCredits2;
-(void)sequenceCredits3;
-(void)sequenceRedSight;
-(void)sequenceRedHide;
-(void)sequenceRamen;

-(void)spellbookDisplay;
-(void)spellbookHide;

-(void)layout;
-(void)animationTimer;

-(void)bumpEvent :(NSString*)eventName;

@end

NSTimer * eventTimer;
NSTimer * userTimer;

int eventTime;
int eventFrame;
int characterFrame;

NSRect windowSize;