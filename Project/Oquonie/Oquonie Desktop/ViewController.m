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
	
    [user listening:0];
    [user setLocation:61];
	[user setCharacter:3];
    [render spellCollect:@"nephtalineNeomine2":3];
    [render spellCollect:@"nephtalineNeomine3":3];
    
    [newDraw animateRoom];
	
	[[[CoreWindow alloc] init] toggleFullScreen:@""];
}

-(void)template
{
    
}

@end
