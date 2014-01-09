//
//  splashViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/8/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "splashViewController.h"
#import "xxiivvSettings.h"

@interface splashViewController ()

@end

@implementation splashViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
	
	if(systemDebug>0){ [self splashSkip]; }
	
	[self splashStart];
}

-(void)splashStart
{
	NSLog(@" SPLASH | Timer        | Start %d",splashSlide);
//	slideTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(splashSkip) userInfo:nil repeats:NO];
	
	if(splashSlide == 1){
		[self splash1];
	}
	if(splashSlide == 2){
		[self splash2];
	}
	if(splashSlide == 3){
		[self splash3];
	}
}

-(void)splash1
{
	NSLog(@" SPLASH | Slide1       | Animating");
}
-(void)splash2
{
	NSLog(@" SPLASH | Slide2       | Animating");
}
-(void)splash3
{
	NSLog(@" SPLASH | Slide3       | Animating");
	self.splashLogoOquonie.alpha = 0;
	[UIView animateWithDuration:1.0 animations:^(void){
		self.splashLogoOquonie.frame = CGRectOffset(self.splashLogoOquonie.frame, 0, 2);
		self.splashLogoOquonie.alpha = 1;
	} completion:^(BOOL finished){}];
}




-(void)splashSkip
{
	NSLog(@" SPLASH | Timer        | Ended %d",splashSlide);
	splashSlide += 1;
	[self performSegueWithIdentifier: @"skip" sender: self];
}
- (IBAction)firstSlideButton:(id)sender {
	[slideTimer invalidate];
	[self splashSkip];
}
- (IBAction)secondSlideButton:(id)sender {
	[slideTimer invalidate];
	[self splashSkip];
}
- (IBAction)thirdSlideButton:(id)sender {
	[slideTimer invalidate];
	[self splashSkip];
}

@end
