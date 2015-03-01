//
//  ViewController.h
//  Oquonie Desktop
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "xxiivvSettings.h"
#import "xxiivvVariables.h"

#import "CoreWindow.h"

#import "DrawView.h"

#import <Foundation/Foundation.h>
@import AVFoundation;

@interface ViewController : NSViewController

@property (weak) IBOutlet DrawView *roomContainer;

@property (weak) IBOutlet NSImageView *floor11;
@property (weak) IBOutlet NSImageView *floor10;
@property (weak) IBOutlet NSImageView *floor1e;
@property (weak) IBOutlet NSImageView *floor0e;
@property (weak) IBOutlet NSImageView *floor01;
@property (weak) IBOutlet NSImageView *floor00;
@property (weak) IBOutlet NSImageView *flooree;
@property (weak) IBOutlet NSImageView *floore1;
@property (weak) IBOutlet NSImageView *floore0;

@property (weak) IBOutlet NSImageView *wall1l;
@property (weak) IBOutlet NSImageView *wall2l;
@property (weak) IBOutlet NSImageView *wall3l;
@property (weak) IBOutlet NSImageView *wall1r;
@property (weak) IBOutlet NSImageView *wall2r;
@property (weak) IBOutlet NSImageView *wall3r;

@property (weak) IBOutlet NSImageView *step1l;
@property (weak) IBOutlet NSImageView *step2l;
@property (weak) IBOutlet NSImageView *step3l;
@property (weak) IBOutlet NSImageView *step1r;
@property (weak) IBOutlet NSImageView *step2r;
@property (weak) IBOutlet NSImageView *step3r;

@property (weak) IBOutlet NSImageView *spriteContainer;
@property (weak) IBOutlet NSImageView *spriteShadow;
@property (weak) IBOutlet NSImageView *spriteCharacter;

@property (weak) IBOutlet NSView *interfaceContainer;
@property (weak) IBOutlet NSView *spellsContainer;
@property (weak) IBOutlet NSImageView *spellView1;
@property (weak) IBOutlet NSImageView *spellView2;
@property (weak) IBOutlet NSImageView *spellView3;

@property (weak) IBOutlet NSView *dialogContainer;
@property (weak) IBOutlet NSImageView *portraitImageView;
@property (weak) IBOutlet NSImageView *bubbleImageView;
@property (weak) IBOutlet NSView *bubbleContainer;
@property (weak) IBOutlet NSImageView *letterView1;
@property (weak) IBOutlet NSImageView *letterView2;
@property (weak) IBOutlet NSImageView *letterView3;

@property (weak) IBOutlet NSImageView *roomColor;
@property (weak) IBOutlet NSImageView *parallaxBack;
@property (weak) IBOutlet NSImageView *parallaxFront;
@property (weak) IBOutlet NSImageView *vignette;

@property (weak) IBOutlet NSView *mapContainer;
@property (weak) IBOutlet NSImageView *mapGraphic;

@end

ViewController * storyboard;
NSView * spriteContainer;
CoreWindow * coreWindow;


int userAudioPlaying;

