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

-(void)animateWalk;
-(void)animateSpellbook;
-(void)animateTransform;
-(void)animateRoomPan;
-(void)animateBlock;

-(void)events;
-(void)notifications;
-(void)room;
-(void)roomShuffle;
-(void)roomShuffle2;

-(void)sequenceIntro;
-(void)sequenceResetTree;
-(void)sequenceEndRed;
-(void)sequenceCredits1;
-(void)sequenceCredits2;
-(void)sequenceCredits3;

-(void)transformation;

@end

NSTimer * eventTimer;
NSTimer * userTimer;

int eventTime;
int eventFrame;
int characterFrame;