//
//  ViewController.m
//  Oquonie Desktop
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "ViewController.h"
#import "CoreWindow.h"

#import "xxiivvSettings.h"
#import "xxiivvVariables.h"
#import "World.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	storyboard = self;
	spriteContainer = self.spriteContainer;
	[[window contentView] setWantsLayer:YES];
	
	[NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(splash) userInfo:nil repeats:NO];
}

-(void)splash
{
	NSLog(@"  SPLASH + -----------------");
	
	self.roomContainer.hidden = YES;
	self.spriteContainer.hidden = YES;
	self.interfaceContainer.hidden = NO;
	self.dialogContainer.hidden = YES;
	
	self.interfaceContainer.frame = self.view.frame;
	
	CALayer *viewLayer = [CALayer layer];
	[viewLayer setBackgroundColor:CGColorCreateGenericRGB(0, 0, 0, 1)]; //RGB plus Alpha Channel
	[self.interfaceContainer setWantsLayer:YES]; // view's backing store is using a Core Animation Layer
	[self.interfaceContainer setLayer:viewLayer];
	
	CGFloat graphicSize = self.view.frame.size.height/2;
	NSImageView * test = [[NSImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2)-graphicSize/2, (self.view.frame.size.height/2)-graphicSize/2, graphicSize, graphicSize)];
	test.imageScaling = NSImageScaleProportionallyUpOrDown;
	[self.interfaceContainer addSubview:test];

	test.image = [NSImage imageNamed:@"splash.xxiivv"];
	test.alphaValue = 0;
	
	float splashSpeed = 0.2;
	
	// Fade In XXIIVV
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
		context.duration = splashSpeed;
		[[test animator] setAlphaValue:1];
	} completionHandler:^{
		
		// Fade out XXIIVV
		[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
			context.duration = splashSpeed;
			[[test animator] setAlphaValue:0];
		} completionHandler:^{
			
			// Fade In Kokorobot
			test.image = [NSImage imageNamed:@"splash.kokorobot"];

			[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
				context.duration = splashSpeed;
				[[test animator] setAlphaValue:1];
			} completionHandler:^{
				
				// Fade Out Kokorobot
				[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
					context.duration = splashSpeed;
					[[test animator] setAlphaValue:0];
				} completionHandler:^{
					
					// Fade In Oquonie
					test.image = [NSImage imageNamed:@"splash.oquonie"];
					
					[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
						context.duration = splashSpeed;
						[[test animator] setAlphaValue:1];
					} completionHandler:^{
						
						// Fade Out Oquonie
						[NSAnimationContext runAnimationGroup:^(NSAnimationContext *context){
							context.duration = splashSpeed;
							[[test animator] setAlphaValue:0];
						} completionHandler:^{
							
							// Start
							[self start];
						}];
					}];
					
					
				}];
			}];
		}];
	}];
	
	
	
}

-(void)start
{
    world = [[World alloc] init];
    user  = [[User alloc] init];
    position = [[Position alloc] initWithView:self.view.frame];
    render = [[Render alloc] init];
	
	NSLog(@"  SETUP + ------------------");
	
	
	
	
	/*
	 
	 [user listening:0];
	 
	 [user setLocation:1];
	 [user eventCollect:storageQuestPillarNephtaline];
	 [user setCharacter:2];
	 [user finishing:0];
	 
//	[user setCharacter:7];
//	[user finishing:1];
	
//	[render spellCollect:@"photocopier3":3];
	//	[render spellCollect:@"photocopier2":3];
//	[user eventCollect:storageQuestPillarNemedique];
//	[user eventCollect:storageQuestPillarNecomedre];
//	[user eventCollect:storageQuestPillarNeomine];
//	[user eventCollect:storageQuestPillarNestorine];
	*/
	
	
	[eventTimer invalidate];
	eventTimer = [NSTimer scheduledTimerWithTimeInterval:0.25 target:newDraw selector:@selector(animationTimer) userInfo:nil repeats:YES];
	
}

- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];
	// Update the view, if already loaded.
}

@end
