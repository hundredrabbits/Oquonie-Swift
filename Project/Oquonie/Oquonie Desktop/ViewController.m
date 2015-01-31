//
//  ViewController.m
//  Oquonie Desktop
//
//  Created by Devine Lu Linvega on 2015-01-28.
//  Copyright (c) 2015 XXIIVV. All rights reserved.
//

#import "ViewController.h"

#import "xxiivvSettings.h"
#import "xxiivvVariables.h"
#import "World.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    storyboard = self;
    [self start];
    
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
    [user setLocation:50];
    
    room = [[Room alloc] initWithArray:[world roomAtLocation:[user location]]];
    
    [newDraw animateRoom];
}

-(void)template
{
    
}

-(void)test
{
//    _roomContainer.frame = CGRectMake(0, 0, 100, 100);
//    self.roomContainer.frame = CGRectMake(0, 0, 100, 100);
//    NSLog(@"yo!");
}

@end
