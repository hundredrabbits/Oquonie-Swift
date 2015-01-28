//
//  splashViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 1/8/2014.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "xxiivvVariables.h"
#import "splashViewController.h"
#import "xxiivvSettings.h"

@interface splashViewController ()

@end

@implementation splashViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    debug = 0;
    
	if(debug>0){
		[self splashSkip];
	}
	else{
		[self splashStart];
	}
}
-(void)splashStart
{
	NSLog(@" SPLASH | Timer        | Start %d",splashSlide);
	
	if(splashSlide == 1){
		[self splash1];
		[self apiContact:@"oquonie":@"analytics":@"launch":@"1"];
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
	slideTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(splashSkip) userInfo:nil repeats:NO];
}
-(void)splash2
{
	NSLog(@" SPLASH | Slide2       | Animating");
	slideTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(splashSkip) userInfo:nil repeats:NO];
}
-(void)splash3
{
	NSLog(@" SPLASH | Slide3       | Animating");
	
	slideTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(splashSkip) userInfo:nil repeats:NO];
	
	self.eraseImage.alpha = 0;
	self.splashLogoOquonie.alpha = 0;
	[UIView animateWithDuration:1.0 animations:^(void){
		self.splashLogoOquonie.frame = CGRectOffset(self.splashLogoOquonie.frame, 0, 2);
		self.splashLogoOquonie.alpha = 1;
	} completion:^(BOOL finished){
		[UIView animateWithDuration:0.5 animations:^(void){
			self.eraseImage.alpha = 1;
		} completion:^(BOOL finished){}];
	}];
	
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

- (IBAction)eraseButton:(id)sender {
	
	[slideTimer invalidate];
	
	if(gameEraseState ==1){
		self.eraseImage.image = [UIImage imageNamed:@"game_new.png"];
		gameEraseState = 2;
		slideTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(splashSkip) userInfo:nil repeats:NO];
		NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
		[[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
		[UIView animateWithDuration:0.5 animations:^(void){
			self.eraseImage.alpha = 0;
		} completion:^(BOOL finished){}];
	}
	
	if(gameEraseState ==0){
		self.eraseImage.image = [UIImage imageNamed:@"game_erase.png"];
		self.deleteSave.hidden = NO;
		gameEraseState = 1;
	}
}

-(void)apiContact:(NSString*)source :(NSString*)method :(NSString*)term :(NSString*)value
{
	NSString *post = [NSString stringWithFormat:@"values={\"term\":\"%@\",\"value\":\"%@\"}",term,value];
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	
	NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	[request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.xxiivv.com/%@/%@",source,method]]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	NSURLResponse *response;
	NSData *POSTReply = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
	NSString *theReply = [[NSString alloc] initWithBytes:[POSTReply bytes] length:[POSTReply length] encoding: NSASCIIStringEncoding];
	NSLog(@"& API  | %@: %@",method, theReply);
	
	return;
}

- (BOOL)prefersStatusBarHidden {
	return YES;
}

@end
