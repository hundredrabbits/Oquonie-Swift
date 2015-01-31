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

#import "AdvancedView.h"

@interface ViewController : NSViewController

@property (weak) IBOutlet AdvancedView *roomContainer;
@property (weak) IBOutlet NSTextField *testLabel;

-(void)test;

@end

ViewController * storyboard;

