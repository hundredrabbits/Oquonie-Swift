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
    [self start];
    spriteContainer = self.spriteContainer;	
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

-(void)start
{
    world = [[World alloc] init];
    user  = [[User alloc] init];
    position = [[Position alloc] initWithView:self.view.frame];
    render = [[Render alloc] init];
	
	NSLog(@"  SETUP + ------------------");
	
	[user listening:0];
	[user setLocation:21];
	[user setCharacter:1];
	
	newDraw = [[Draw alloc] init];
}

-(void)template
{
	
}

@end
