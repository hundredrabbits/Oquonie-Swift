//
//  splashViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/8/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "splashViewController.h"

@interface splashViewController ()

@end

@implementation splashViewController

-(void)viewDidLoad
{
    [super viewDidLoad];	
	[self splashStart];
}

-(void)splashStart
{
	NSLog(@" SPLASH | Timer        | Start %d",splashSlide);
	slideTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(splashSkip) userInfo:nil repeats:NO];
}

-(void)splashSkip
{
	NSLog(@" SPLASH | Timer        | Ended %d",splashSlide);
	splashSlide += 1;
	[self performSegueWithIdentifier: @"skip" sender: self];
}
- (IBAction)firstSlideButton:(id)sender {
	splashSlide = 2;
	[slideTimer invalidate];
	[self splashSkip];
}
- (IBAction)secondSlideButton:(id)sender {
	splashSlide = 3;
	[slideTimer invalidate];
	[self splashSkip];
}
- (IBAction)thirdSlideButton:(id)sender {
	splashSlide = 4;
	[slideTimer invalidate];
	[self splashSkip];
}

@end
